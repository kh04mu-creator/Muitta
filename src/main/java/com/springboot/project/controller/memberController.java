package com.springboot.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.project.dao.memberDAO;
import com.springboot.project.dto.memberDTO;

import jakarta.servlet.http.HttpServletRequest;

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
	public String memberDelete(HttpServletRequest request, memberDTO dto) {
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		dao.m_deleteDao(m_no);
		
		return "/";
	}
	
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm(HttpServletRequest request, memberDTO dto, Model model) {
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		model.addAttribute("medit", dao.m_viewDao(m_no));
		
		return "memberUpdateForm";
	}
	
	@RequestMapping("/memberUpdate")
	public String memberUpdate(memberDTO dto) {
		dao.m_updateDao(dto);
		
		return "redirect:/memberDetail";
	}
}
