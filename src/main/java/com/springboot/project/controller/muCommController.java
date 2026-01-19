package com.springboot.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.project.dao.muCommDAO;
import com.springboot.project.dto.muCommDTO;
import com.springboot.project.security.CustomUserDetails;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class muCommController {
	@Autowired
	muCommDAO dao;
	
	
//	@RequestMapping("/muCommWrite")
//	public String muCommWrite(muCommDTO dto, Authentication auth) {
//		String m_id = auth.getM_id();
//		dto.setMc_writer(m_id);
//		
//		dao.mc_writeDao(dto);
//		
//		return "redirect:/musicalDetail?mu_no="+dto.getMu_no();
//	}
	
	@RequestMapping("/muCommWrite")
	public String muCommWrite(muCommDTO dto, Authentication authentication) {
		if (authentication == null || !authentication.isAuthenticated()
		        || authentication.getPrincipal() instanceof String) {
		        return "redirect:/loginForm";
		    }
		
		CustomUserDetails user =
			     (CustomUserDetails) authentication.getPrincipal();
		
		String loginId = user.getMember().getM_id();
		int loginMno = user.getMember().getM_no();
		
		dto.setMc_writer(loginId);
		dto.setM_no(loginMno);
		
		dao.mc_writeDao(dto);
		
		return "redirect:/musicalDetail?mu_no="+dto.getMu_no();
	}
	
//	@RequestMapping("/muCommList")
//	public String muCommList(@RequestParam("mu_no") int mu_no, muCommDTO dto, Model model, Authentication authentication) {
//		if (authentication == null || !authentication.isAuthenticated()
//		        || authentication.getPrincipal() instanceof String) {
//		        return "redirect:/loginForm";
//		    }
//		
//		CustomUserDetails user =
//			     (CustomUserDetails) authentication.getPrincipal();
//		
//		System.out.println("mu_no = " + mu_no);
//
//		List<muCommDTO> list = dao.mc_listDao(mu_no);
//		System.out.println("댓글 개수 = " + list.size());
//
//		model.addAttribute("mclist", list);
//		
//		model.addAttribute("mclist", dao.mc_listDao(mu_no));
//		model.addAttribute("loginId", user.getMember().getM_id());
//		
//		return "musicalDetail";
//	}
	
	@RequestMapping("/muCommDelete")
	public String muCommDelete(@RequestParam("mc_no") int mc_no, @RequestParam("mu_no") int mu_no) {
		dao.mc_deleteDao(mc_no);
		
		return "redirect:/musicalDetail?mu_no=" + mu_no;
	}
	
}
