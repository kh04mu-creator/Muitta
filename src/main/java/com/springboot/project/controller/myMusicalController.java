package com.springboot.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.project.dao.mLikeDAO;
import com.springboot.project.dao.muListDAO;
import com.springboot.project.dto.mLikeDTO;
import com.springboot.project.dto.muListDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class myMusicalController {
	@Autowired
	mLikeDAO dao;
	
	@RequestMapping("/mLikeWrite")
	public String mLikeWrite(mLikeDTO dto) {
		dao.l_writeDao(dto);
		
		return "redirect:/musicalDetail";
	}
	
	@RequestMapping("/mLikeList")
	public String mLikeList(HttpServletRequest request, mLikeDTO dto, muListDTO mudto, muListDAO mudao, Model model) {
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		model.addAttribute("llist", dao.l_listDao());
		model.addAttribute("mlist", mudao.mu_listDao());
		
		return "mLikeList";
	}
	
	@RequestMapping("/mLikeDelete")
	public String mLikeDelete(HttpServletRequest request, mLikeDTO dto) {
		int l_no = Integer.parseInt(request.getParameter("l_no"));
		dao.l_deleteDao(l_no);
		
		return "mLikeList";
	}
	
}
