package com.springboot.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.project.dao.mLikeDAO;
import com.springboot.project.dao.memberDAO;
import com.springboot.project.dao.muListDAO;
import com.springboot.project.dto.mLikeDTO;
import com.springboot.project.dto.muListDTO;
import com.springboot.project.security.CustomUserDetails;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class myMusicalController {
	@Autowired
	mLikeDAO dao;
	@Autowired
	memberDAO mdao;
	@Autowired
	muListDAO mudao;
	
	@RequestMapping("/mLikeList")
	public String mLikeList(Authentication authentication, Model model) {
		if (authentication == null || !authentication.isAuthenticated()
		        || authentication.getPrincipal() instanceof String) {
		        return "redirect:/loginForm";
		    }
		
		CustomUserDetails user =
			     (CustomUserDetails) authentication.getPrincipal();
		
		int loginMno = user.getMember().getM_no();
		System.out.println("loginMno = " + loginMno);
		
		List<muListDTO> likedMusicals = mudao.selectLikedMuList(loginMno);
		
		model.addAttribute("mlist", likedMusicals);
		model.addAttribute("loginMno", loginMno);
		
		return "member/mLikeList";
	}
	
	@RequestMapping("/mLiketoggle")
	public String mLiketoggle(@RequestParam("mu_no") int mu_no, Authentication authentication) {
		if (authentication == null
		        || !authentication.isAuthenticated()
		        || authentication.getPrincipal() instanceof String) {

		        return "redirect:/loginForm";
		    }
		
		CustomUserDetails user =
		     (CustomUserDetails) authentication.getPrincipal();
		
		int loginMno = user.getMember().getM_no();
		
		int check = dao.l_checkDao(mu_no, loginMno);
		
		if(check == 0) {
			dao.l_writeDao(loginMno, mu_no);
		}else {
			dao.l_deleteDao(loginMno, mu_no);
		}
		
		System.out.println("loginMno = " + loginMno);
		
		return "redirect:/musicalDetail?mu_no="+mu_no;
		
	}
	
	
	@RequestMapping("/mLikeDelete")
	public String mLikeDelete(@RequestParam("mu_no") int mu_no, Authentication authentication) {
		CustomUserDetails user =
			     (CustomUserDetails) authentication.getPrincipal();
		
		int m_no = user.getMember().getM_no();
		
		dao.l_deleteDao(m_no, mu_no);
		
		return "redirect:/mLikeList";
	}
	
}
