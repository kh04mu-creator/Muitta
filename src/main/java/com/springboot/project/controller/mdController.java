package com.springboot.project.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@PreAuthorize("hasRole('ADMIN')")
	@PostMapping("/admin/mdSetHome")
	public String mdSetHome(@RequestParam("md_no") int md_no,
	                        RedirectAttributes ra) throws Exception {

	    // ⭐ 저장 경로 (프로젝트 루트/config/home-md.txt)
	    Path path = Paths.get("config/home-md.txt");

	    // 폴더 없으면 생성
	    Files.createDirectories(path.getParent());

	    // 파일에 md_no 저장
	    Files.writeString(path, String.valueOf(md_no));

	    ra.addFlashAttribute("msg", "홈 화면에 등록되었습니다.");
	    return "redirect:/admin/mdDetail?md_no=" + md_no;
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
