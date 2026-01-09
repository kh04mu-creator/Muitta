package com.springboot.project.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.springboot.project.dao.muListDAO;
import com.springboot.project.dto.muListDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class musicalController {
	@Autowired
	muListDAO dao;

	
	@RequestMapping("/musicalWriteForm")
	public String musicalwriteForm() {
		return "admin/musicalWriteForm";
	}

	
	@PostMapping("/musicalWrite")
	public String musicalWrite(muListDTO dto, @RequestParam("file1") MultipartFile file1) throws Exception {
		if(!file1.isEmpty()) {
			String mu_pupload = file1.getOriginalFilename();
			file1.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+mu_pupload));
			dto.setMu_pupload(mu_pupload);
		}
		dao.mu_writeDao(dto);
	
		return "/musicalList";
	}
	
	
	@RequestMapping("/musicalList")
	public String musicalList(muListDTO dto, Model model) {
		model.addAttribute("mlist", dao.mu_listDao());
		
		return "musicalList";
	}
	
	@RequestMapping("/musicalDetail")
	public String musicalDetail(HttpServletRequest request, Model model) {
		int mu_no = Integer.parseInt(request.getParameter("mu_no"));
		model.addAttribute("mdetail", dao.mu_viewDao(mu_no));
		
		return "musicalDetail";
	}
	
	@RequestMapping("/musicalDelete")
	public String musicalDelete(HttpServletRequest request, muListDTO dto) {
		int mu_no = Integer.parseInt(request.getParameter("mu_no"));
		dao.mu_deleteDao(mu_no);
		
		return "redirect:/musicalList";
	}
	
	@RequestMapping("/musicalUpdateForm")
	public String musicalUpdateForm(HttpServletRequest request, Model model) {
		int mu_no = Integer.parseInt(request.getParameter("mu_no"));
		model.addAttribute("medit", dao.mu_viewDao(mu_no));
		
		return "admin/musicalUpdateForm";
	}
	
	@RequestMapping("/musicalUpdate")
	public String musicalUpdate(muListDTO dto, @RequestParam("mu_pupload") MultipartFile mu_pupload) throws Exception {
		if(!mu_pupload.isEmpty()) {
			String mu_pname = mu_pupload.getOriginalFilename();
			mu_pupload.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+mu_pname));
			dto.setMu_pupload(mu_pname);
		}
		dao.mu_updateDao(dto);
		
		return "redirect:/musicalDetail";
	}
	
	
	
}
