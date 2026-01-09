package com.springboot.project.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.exchangeDAO;
import com.springboot.project.dto.exchangeDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class exchangeController {
	@Autowired
	exchangeDAO dao;
	
	@RequestMapping("/exchangeWriteForm")
	public String exchangeWriteForm() {
		return "exchangeWriteForm";
	}
	
	@RequestMapping("/exchangeWrite")
	public String exchangeWrite(exchangeDTO dto, @RequestParam("ex_upload") MultipartFile ex_upload) throws Exception {
		if(!ex_upload.isEmpty()) {
			String ex_name = ex_upload.getOriginalFilename();
			ex_upload.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+ex_name));
			
		}
		dao.ex_writeDao(dto);
		
		return "redirect:/exchangeList";
	}
	
	@RequestMapping("/exchangeList")
	public String exchangeList(exchangeDTO dto, Model model) {
		model.addAttribute("exlist", dao.ex_listDao());
		
		return "exchangeList";
	}
	
	@RequestMapping("/exchangeDetail")
	public String exchangeDetail(HttpServletRequest request, exchangeDTO dto, Model model) {
		int ex_no = Integer.parseInt(request.getParameter("ex_no"));
		model.addAttribute("exdetail", dao.ex_viewDao(ex_no));
		
		return "exchangeDetail";
	}
	
	@RequestMapping("/exchangeDelete")
	public String exchangeDelete(HttpServletRequest request, exchangeDTO dto) {
		int ex_no = Integer.parseInt(request.getParameter("ex_no"));
		dao.ex_deleteDao(ex_no);
		
		return "exchangeList";
	}
	
	@RequestMapping("/exchangeUpdateForm")
	public String exchangeUpdateForm(HttpServletRequest request, exchangeDTO dto, Model model) {
		int ex_no = Integer.parseInt(request.getParameter("ex_no"));
		model.addAttribute("exedit", dao.ex_viewDao(ex_no));
		
		return "exchangeUpdateForm";
	}
	
	@RequestMapping("/exchangeUpdate")
	public String exchangeUpdate(exchangeDTO dto, @RequestParam("ex_upload") MultipartFile ex_upload) throws Exception {
		if(!ex_upload.isEmpty()) {
			String ex_name = ex_upload.getOriginalFilename();
			ex_upload.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+ex_name));
			
		}
		dao.ex_updateDao(dto);
		
		return "redirect:/exchangeDetail";
	}
	
}
