package com.springboot.project.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.reviewDAO;
import com.springboot.project.dao.rwLikeDAO;
import com.springboot.project.dto.reviewDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class reviewController {
	@Autowired
	reviewDAO dao; // 의존성 자동주입
	
	@Autowired
	rwLikeDAO likeDao;

	
	@RequestMapping("/review/reviewList")
	public String reviewList(Model model) {
	    model.addAttribute("r_list", dao.r_listDao());
	    return "review/reviewList";
	}
	
	@RequestMapping("/review/reviewWriteForm")
	public String reviewWriteForm(reviewDTO dto) {
		System.out.println(dto.getR_star()); // 1~5 숫자로 들어옴
		return "review/reviewWriteForm";
	}
	
	@RequestMapping("/review/reviewWrite")
	public String reviewWrite(reviewDTO dto, @RequestParam("file") MultipartFile file) {
	    if (dto.getR_star() == 0) {
	        dto.setR_star(5);
	    }

	    if (!file.isEmpty()) {
	        try {
	            String r_upload = file.getOriginalFilename();
	            file.transferTo(
	                new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\" + r_upload)
	            );
	            dto.setR_upload(r_upload);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    dao.r_writeDao(dto);
	    return "redirect:/review/reviewList";
	}


	
	
	
	// 수정 폼 (GET)
	@RequestMapping(value="/review/reviewUpdate", method=RequestMethod.GET)
	public String reviewUpdateForm(@RequestParam("r_no") int r_no, Model model) {
	    reviewDTO dto = dao.r_viewDao(r_no);
	    model.addAttribute("reviewUpdate", dto);
	    return "review/reviewUpdateForm";
	}

	// 수정 처리 (POST)
	@RequestMapping(value="/review/reviewUpdate", method=RequestMethod.POST)
	public String reviewUpdate(
	        reviewDTO dto,
	        @RequestParam(value="uploadFile", required=false) MultipartFile file) {

	    reviewDTO old = dao.r_viewDao(dto.getR_no());

	    if (dto.getR_star() == 0) {
	        dto.setR_star(old.getR_star());
	    }

	    if (file != null && !file.isEmpty()) {
	        try {
	            String r_upload = file.getOriginalFilename();
	            file.transferTo(
	                new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\" + r_upload)
	            );
	            dto.setR_upload(r_upload);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    } else {
	        dto.setR_upload(old.getR_upload());
	    }

	    dao.r_updateDao(dto);
	    return "redirect:/review/reviewDetail?r_no=" + dto.getR_no();
	}
	
	@RequestMapping("/review/reviewDetail")
	public String reviewDetail(
	        @RequestParam("r_no") int r_no,
	        HttpSession session,
	        Model model) {

	    dao.r_viewCountUp(r_no);
	    reviewDTO dto = dao.r_viewDao(r_no);

	    Integer loginMno = (Integer) session.getAttribute("loginMno");

	    int likeCheck = 0;
	    if (loginMno != null) {
	        likeCheck = likeDao.likeCheck(loginMno, r_no);
	    }

	    int likeCount = likeDao.likeCount(r_no);

	    model.addAttribute("reviewDetail", dto);
	    model.addAttribute("likeCheck", likeCheck); // 0 or 1
	    model.addAttribute("likeCount", likeCount);

	    return "review/reviewDetail";
	}
	
	@RequestMapping("/review/likeToggle")
	public String likeToggle(
	        @RequestParam("r_no") int r_no,
	        HttpSession session) {

	    Integer loginMno = (Integer) session.getAttribute("loginMno");
	    if (loginMno == null) {
	        return "redirect:/member/loginForm";
	    }

	    int check = likeDao.likeCheck(loginMno, r_no);

	    if (check == 0) {
	        likeDao.likeInsert(loginMno, r_no);
	    } else {
	        likeDao.likeDelete(loginMno, r_no);
	    }

	    return "redirect:/review/reviewDetail?r_no=" + r_no;
	}






}
