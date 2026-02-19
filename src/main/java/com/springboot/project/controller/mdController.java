package com.springboot.project.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.mdDAO;
import com.springboot.project.dto.mdDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class mdController {
	@Autowired
	mdDAO dao;	
	
		
	@RequestMapping("/admin/mdWriteForm")
	public String mdWriteForm() {
		return "admin/mdWriteForm";
	}
	
	@RequestMapping("/admin/mdWrite")
	public String mdWrite(@RequestParam("file1") MultipartFile file1, mdDTO dto) throws Exception {
		if(!file1.isEmpty()) {
			String md_upload=file1.getOriginalFilename();
			file1.transferTo(new File("C:\\SpringBoot\\Muitta\\src\\main\\resources\\static\\images\\"+md_upload));
			dto.setMd_upload(md_upload);
		}
		dao.md_writeDao(dto);
		return "redirect:/admin/mdPickList";	
	}
	@RequestMapping("/admin/mdPickList")
	public String mdList(Model model) {
		model.addAttribute("list", dao.md_listDao());
		return "admin/mdPickList";
	}	
	
	@RequestMapping("/admin/mdDetail")
	 public String mdDetail(HttpServletRequest request, Model model) { 
		int md_no = Integer.parseInt(request.getParameter("md_no")); 
		model.addAttribute("detail", dao.md_viewDao(md_no));	 
		return "admin/mdDetail";		
	}
	@RequestMapping("/admin/mdUpdateForm")
	public String mdUpdate(HttpServletRequest request, Model model) {
		int md_no = Integer.parseInt(request.getParameter("md_no"));		
		model.addAttribute("mdedit", dao.md_viewDao(md_no));		
		return "admin/mdUpdateForm";
	}
	@RequestMapping("/admin/mdUpdate") 
	public String mdUpdate(@RequestParam("file1") MultipartFile file1, mdDTO dto) throws Exception {
		if(!file1.isEmpty()) {
			String md_upload=file1.getOriginalFilename();
			file1.transferTo(new File("C:\\SpringBoot\\Muitta\\src\\main\\resources\\static\\images\\"+md_upload));
			dto.setMd_upload(md_upload);
		}
		dao.md_updateDao(dto);
		return "redirect:/admin/mdPickList";		
	}
	@RequestMapping("/mdDelete")
	public String mdDelete(HttpServletRequest request, mdDTO dto) {
		int md_no = Integer.parseInt(request.getParameter("md_no"));
		dao.md_deleteDao(md_no);		
		return "redirect:/admin/mdPickList";
	}
}
