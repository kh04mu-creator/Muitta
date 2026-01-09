package com.springboot.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.project.dao.memberDAO;
import com.springboot.project.dto.memberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class memberController {
   @Autowired
   memberDAO dao;
   
   @RequestMapping("/memberWriteForm")
   public String memberWriteForm() {
      return "memberWriteForm";
   }
   
   @RequestMapping("/memberWrite")
   public String memberWrite(memberDTO dto) {
      dao.m_writeDao(dto);
      
      return "redirect:/";
   }
   
   @PostMapping("/login")
   public String login(
           @RequestParam String userId,
           @RequestParam String userPw,
           HttpSession session) {

       // 1. DB에서 아이디/비밀번호 확인
       memberDTO member = dao.login(userId, userPw);

       if (member != null) {
           // 로그인 성공 시
           session.setAttribute("loginId", member.getUserId());
           session.setAttribute("loginName", member.getUserName()); // 선택

           return "redirect:/";
       } else {
           return "loginForm";
       }
   }
   
   @RequestMapping("/logout")
   public String logout(HttpSession session) {
       session.invalidate();
       return "redirect:/";
   }


   
   @RequestMapping("/memberList")
   public String memberList(memberDTO dto, Model model) {
      model.addAttribute("mlist", dao.m_listDao());
      
      return "memberList";
   }
   
   @RequestMapping("/memberDetail")
   public String memberDetail(HttpServletRequest request, memberDTO dto, Model model) {
      int m_no = Integer.parseInt(request.getParameter("m_no"));
      model.addAttribute("mdetail", dao.m_viewDao(m_no));
      
      return "memberDetail";
   }
   
   @RequestMapping("/memberDelete")
   public String memberDelete(
           @RequestParam int m_no,
           HttpSession session) {

       String loginId = (String) session.getAttribute("loginId");
       memberDTO member = dao.m_viewDao(m_no);

       if (loginId == null || !loginId.equals(member.getUserId())) {
           return "redirect:/";
       }

       dao.m_deleteDao(m_no);
       session.invalidate(); // 본인 삭제 시 로그아웃
       return "redirect:/";
   }

   
   @RequestMapping("/memberUpdateForm")
   public String memberUpdateForm(
           @RequestParam int m_no,
           HttpSession session,
           Model model) {

       String loginId = (String) session.getAttribute("loginId");
       memberDTO member = dao.m_viewDao(m_no);

       if (loginId == null || !loginId.equals(member.getUserId())) {
           return "redirect:/";
       }

       model.addAttribute("medit", member);
       return "memberUpdateForm";
   }

   
   @RequestMapping("/memberUpdate")
   public String memberUpdate(memberDTO dto, HttpSession session) {

       String loginId = (String) session.getAttribute("loginId");
       memberDTO member = dao.m_viewDao(dto.getM_no());

       if (loginId == null || !loginId.equals(member.getUserId())) {
           return "redirect:/";
       }

       dao.m_updateDao(dto);
       return "redirect:/memberDetail?m_no=" + dto.getM_no();
   }

   
}