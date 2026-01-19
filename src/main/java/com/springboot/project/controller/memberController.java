package com.springboot.project.controller;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.project.dao.memberDAO;
import com.springboot.project.dto.memberDTO;
import com.springboot.project.security.CustomUserDetails;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class memberController {

    @Autowired
    private memberDAO dao;

    @Autowired
    private PasswordEncoder passwordEncoder;


    @RequestMapping("/memberWriteForm")
    public String memberWriteForm() {
        return "memberWriteForm";
    }

    @PostMapping("/memberWrite")
    public String memberWrite(memberDTO dto) {
        dto.setM_password(passwordEncoder.encode(dto.getM_password()));
        dao.m_writeDao(dto);
        return "redirect:/loginForm";
    }
    
    @RequestMapping("/admin/memberList")
    public String memberList(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Model model) {

        // 로그인 안 한 경우
        if (userDetails == null) {
            return "redirect:/loginForm";
        }

        // ADMIN이 아닌 경우 접근 차단
        if (!userDetails.getMember().getM_auth().equals("ROLE_ADMIN")) {
            return "redirect:/accessDenied";
        }

        model.addAttribute("m_list", dao.m_listDao()); // 회원 전체 조회
        return "admin/memberList";
    }


    @GetMapping("/member/memberDetail")
    public String memberDetail(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Model model) {

        if (userDetails == null) {
            return "redirect:/loginForm";
        }

        int m_no = userDetails.getMember().getM_no();

        memberDTO member = dao.m_viewDao(m_no); //  DB에서 전체 조회

        model.addAttribute("memberDetail", member);
        model.addAttribute("loginUser", userDetails.getMember());

        return "member/memberDetail";
    }


    

    @GetMapping("/member/memberUpdateForm")
    public String memberUpdateForm(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Authentication authentication,
            Model model) {

        if (authentication.getAuthorities().stream()
                .noneMatch(a -> a.getAuthority().equals("ROLE_PASSWORD_CONFIRMED"))) {
            return "redirect:/member/passwordCheck?mode=update";
        }

        int m_no = userDetails.getMember().getM_no();
        memberDTO member = dao.m_viewDao(m_no);

        model.addAttribute("memberUpdate", member);
        return "member/memberUpdateForm";
    }


    @PostMapping("/member/memberUpdate")
    public String memberUpdate(
            memberDTO dto,
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response) {

        if (userDetails == null) return "redirect:/loginForm";

        memberDTO loginUser = userDetails.getMember();
        memberDTO targetUser = dao.m_viewDao(dto.getM_no());

        // 권한 체크
        if (!loginUser.getM_id().equals(targetUser.getM_id())
                && !loginUser.getM_auth().equals("ROLE_ADMIN")) {
            return "redirect:/accessDenied";
        }

        // 비밀번호 처리
        if (dto.getM_password() != null && !dto.getM_password().isBlank()) {
            dto.setM_password(passwordEncoder.encode(dto.getM_password()));
        } else {
            dto.setM_password(targetUser.getM_password());
        }

        dao.m_updateDao(dto);

        //  회원정보 수정 후 → 완전 로그아웃
        new SecurityContextLogoutHandler()
                .logout(request, response, authentication);

        return "redirect:/loginForm";
    }



    @PostMapping("/member/memberDelete")
    public String memberDelete(
            @RequestParam("m_no") int m_no,
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response) {

        if (userDetails == null) {
            return "redirect:/";
        }

        // 비밀번호 확인 여부 체크
        if (authentication.getAuthorities().stream()
                .noneMatch(a -> a.getAuthority().equals("ROLE_PASSWORD_CONFIRMED"))) {
            return "redirect:/member/passwordCheck?mode=delete";
        }

        memberDTO loginUser = userDetails.getMember();
        memberDTO targetUser = dao.m_viewDao(m_no);

        // 본인 또는 관리자만 가능
        if (!loginUser.getM_id().equals(targetUser.getM_id())
                && !loginUser.getM_auth().equals("ROLE_ADMIN")) {
            return "redirect:/accessDenied";
        }

        // 회원 삭제
        dao.m_deleteDao(m_no);

        //  본인 탈퇴일 경우: Security 완전 로그아웃
        if (loginUser.getM_id().equals(targetUser.getM_id())) {
            new SecurityContextLogoutHandler()
                    .logout(request, response, authentication);
            return "redirect:/";
        }

        //  관리자 삭제: 관리자 세션 유지
        return "redirect:/admin/memberList";
    }

    @PostMapping("/admin/member/memberDelete")
    public String adminMemberDelete(
            @RequestParam("m_no") int m_no,
            @AuthenticationPrincipal CustomUserDetails userDetails) {

        if (userDetails == null) return "redirect:/loginForm";

        if (!userDetails.getMember().getM_auth().equals("ROLE_ADMIN")) {
            return "redirect:/accessDenied";
        }

        dao.m_deleteDao(m_no);
        return "redirect:/admin/memberList";
    }

    
    
    

    @GetMapping("/member/passwordCheckForm")
    public String passwordCheckForm(
            @RequestParam("mode") String mode,
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Model model) {

        if (userDetails == null) return "redirect:/loginForm";

        model.addAttribute("mode", mode); // update / delete
        model.addAttribute("m_no", userDetails.getMember().getM_no());
        return "member/passwordCheckForm";
    }
  
 
    @PostMapping("/member/passwordCheck")
    public String passwordCheck(
            @RequestParam("m_password") String m_password,
            @RequestParam("mode") String mode,
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Authentication authentication,
            Model model) {

        if (userDetails == null) {
            return "redirect:/loginForm";
        }

        // 🔑 비밀번호 검증 (핵심)
        if (!passwordEncoder.matches(m_password, userDetails.getPassword())) {
            model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
            model.addAttribute("mode", mode);
            return "member/passwordCheckForm"; // ← 뷰 이름 주의
        }

        // 권한 추가
        Collection<GrantedAuthority> newAuth =
                new ArrayList<>(authentication.getAuthorities());
        newAuth.add(new SimpleGrantedAuthority("ROLE_PASSWORD_CONFIRMED"));

        Authentication newAuthentication =
                new UsernamePasswordAuthenticationToken(
                        authentication.getPrincipal(),
                        authentication.getCredentials(),
                        newAuth
                );

        SecurityContextHolder.getContext().setAuthentication(newAuthentication);

        return "update".equals(mode)
                ? "redirect:/member/memberUpdateForm"
                : "redirect:/member/memberDeleteConfirm";
    }
    
    @GetMapping("/member/memberDeleteConfirm")
    public String memberDeleteConfirm(
            @AuthenticationPrincipal CustomUserDetails userDetails,
            Model model) {

        model.addAttribute("loginUser", userDetails.getMember());
        return "member/memberDeleteConfirm";
    }







    
    
}
