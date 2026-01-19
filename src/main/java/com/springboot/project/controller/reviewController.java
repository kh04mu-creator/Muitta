package com.springboot.project.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.reviewDAO;
import com.springboot.project.dao.rwLikeDAO;
import com.springboot.project.dto.reviewDTO;
import com.springboot.project.security.CustomUserDetails;

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
	public String reviewWrite(
	        reviewDTO dto,
	        @RequestParam("file") MultipartFile file,
	        Authentication authentication) {

	    // ⭐ 로그인 체크
	    if (authentication == null
	        || !authentication.isAuthenticated()
	        || authentication.getPrincipal() instanceof String) {
	        return "redirect:/loginForm";
	    }

	    // ⭐ 로그인 사용자 정보
	    CustomUserDetails user =
	        (CustomUserDetails) authentication.getPrincipal();

	    int loginMno = user.getMember().getM_no();
	    String loginId = user.getMember().getM_id();

	    // ⭐ FK 핵심
	    dto.setM_no(loginMno);
	    dto.setR_writer(loginId);

	    // 별점 기본값
	    if (dto.getR_star() == 0) {
	        dto.setR_star(5);
	    }

	    // 파일 업로드
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


	@PostMapping("/review/reviewDelete")
	public String reviewDelete(@RequestParam("r_no") int r_no) {

	    // 1️. 좋아요 먼저 삭제
	    likeDao.likeDeleteByReview(r_no);

	    // 2. 이미지 파일 삭제
	    reviewDTO dto = dao.r_viewDao(r_no);
	    if (dto.getR_upload() != null) {
	        File file = new File(
	            "C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"
	            + dto.getR_upload()
	        );
	        if (file.exists()) file.delete();
	    }

	    // 3️. 리뷰 삭제
	    dao.r_deleteDao(r_no);

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
	        Authentication authentication,
	        Model model) {

	    dao.r_viewCountUp(r_no);
	    reviewDTO dto = dao.r_viewDao(r_no);

	    int likeCheck = 0;

	    if (authentication != null
	        && authentication.isAuthenticated()
	        && !(authentication.getPrincipal() instanceof String)) {

	        CustomUserDetails user =
	            (CustomUserDetails) authentication.getPrincipal();

	        int loginMno = user.getMember().getM_no();   // ✅ 수정
	        String loginId = user.getMember().getM_id(); // ✅ 수정

	        likeCheck = likeDao.likeCheck(loginMno, r_no);

	        model.addAttribute("loginId", loginId);
	        model.addAttribute("loginMno", loginMno);
	    }

	    int likeCount = likeDao.likeCount(r_no);
	    
	    List<reviewDTO> r_list = dao.selectRecentReviews();
	    model.addAttribute("r_list", r_list);

	    model.addAttribute("reviewDetail", dto);
	    model.addAttribute("likeCheck", likeCheck);
	    model.addAttribute("likeCount", likeCount);

	    return "review/reviewDetail";
	}

	@PostMapping("/review/likeToggle")
	public String likeToggle(
	        @RequestParam("r_no") int r_no,
	        Authentication authentication) {

	    if (authentication == null
	        || !authentication.isAuthenticated()
	        || authentication.getPrincipal() instanceof String) {

	        return "redirect:/loginForm";
	    }

	    CustomUserDetails user =
	        (CustomUserDetails) authentication.getPrincipal();

	    int loginMno = user.getMember().getM_no(); 

	    int check = likeDao.likeCheck(loginMno, r_no);

	    if (check == 0) {
	        likeDao.likeInsert(loginMno, r_no);
	    } else {
	        likeDao.likeDelete(loginMno, r_no);
	    }

	    System.out.println("loginMno = " + loginMno);
	    
	    return "redirect:/review/reviewDetail?r_no=" + r_no;
	}
	
	


}

