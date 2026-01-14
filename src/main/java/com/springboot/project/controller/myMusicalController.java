package com.springboot.project.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.project.dao.mLikeDAO;
import com.springboot.project.dao.memberDAO;
import com.springboot.project.dao.muListDAO;
import com.springboot.project.dto.mLikeDTO;
import com.springboot.project.dto.memberDTO;
import com.springboot.project.dto.muListDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class myMusicalController {
	@Autowired
	mLikeDAO dao;
	@Autowired
	memberDAO mdao;
	
	@RequestMapping("/mLikeList")
	public String mLikeList(mLikeDTO dto, memberDTO mdto, muListDTO mudto, muListDAO mudao, Model model) {
		model.addAttribute("llist", dao.l_listDao());
		model.addAttribute("mlist", mudao.mu_listDao());
		
		return "redirect:/mLikeList?m_no="+mdto.getM_no();
	}
	
//	@RequestMapping("/mLiketoggle")
//	public String mLiketoggle(int mu_no, Principal principal) {
//		Integer current_m_no = null;
//		if(principal != null) {
//			memberDTO member = mdao.findbyM_id(principal.getName());
//			if(member != null) {
//				current_m_no = member.getM_no();
//			}
//		}
//		
//		int count = dao.l_checkDao(mu_no, current_m_no);
//		
//		if(count == 0) {
//			dao.l_writeDao(mu_no, current_m_no);
//		}else {
//			dao.l_deleteDao(mu_no, current_m_no);
//		}
//		
//		return "redirect:/musicalDetail?mu_no="+mu_no;
//		
//	}
	
	
	@RequestMapping("/mLikeDelete")
	public String mLikeDelete(HttpServletRequest request, mLikeDTO dto, HttpSession session) {
		int l_no = Integer.parseInt(request.getParameter("l_no"));
		Integer loginMno = (Integer) session.getAttribute("loginMno");
		
		dao.l_deleteDao(l_no, loginMno);
		
		return "mLikeList";
	}
	
}
