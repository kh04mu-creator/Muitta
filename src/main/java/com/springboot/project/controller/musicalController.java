package com.springboot.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.mLikeDAO;
import com.springboot.project.dao.muCastDAO;
import com.springboot.project.dao.muCommDAO;
import com.springboot.project.dao.muInfoDAO;
import com.springboot.project.dao.muListDAO;
import com.springboot.project.dto.muCastDTO;
import com.springboot.project.dto.muCommDTO;
import com.springboot.project.dto.muInfoDTO;
import com.springboot.project.dto.muListDTO;
import com.springboot.project.security.CustomUserDetails;
import com.springboot.project.service.musicalService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class musicalController {
	@Autowired
	muListDAO dao;
	@Autowired
	muInfoDAO midao;
	@Autowired
	muCastDAO cadao;
	@Autowired
	mLikeDAO mldao;
	@Autowired
	muCommDAO mcdao;
	
	private final musicalService musicalService;

	
	@RequestMapping("/admin/musicalWriteForm")
	public String musicalwriteForm() {
		return "admin/musicalWriteForm";
	}	
	
	@RequestMapping("/musicalWrite")
	public String musicalWrite(muListDTO mldto, muInfoDTO midto, muCastDTO mcdto, @RequestParam("file1") MultipartFile file1,
	@RequestParam("file2") MultipartFile file2, @RequestParam("file3") MultipartFile file3) throws Exception {
		musicalService.writeMusical(mldto, midto, mcdto, file1, file2, file3);
		
		return "redirect:/musicalList";
	}
	
	@RequestMapping("/musicalList")
	public String musicalList(muListDTO dto, Model model) {
		model.addAttribute("mlist", dao.mu_listDao());
		
		return "musicalList";
	}
	
	@RequestMapping("/musicalDetail")
	public String musicalDetail(HttpServletRequest request, HttpSession session, Authentication authentication, Model model) {
		int mu_no = Integer.parseInt(request.getParameter("mu_no"));
		int mi_no = Integer.parseInt(request.getParameter("mu_no"));
		int ca_no = Integer.parseInt(request.getParameter("mu_no"));
		model.addAttribute("mdetail", dao.mu_viewDao(mu_no));
		model.addAttribute("midetail", midao.mi_viewDao(mu_no));
		model.addAttribute("cadetail", cadao.ca_viewDao(mu_no));
		
		int lcheck = 0;
		
		if (authentication != null
		        && authentication.isAuthenticated()
		        && !(authentication.getPrincipal() instanceof String)) {

		        CustomUserDetails user =
		            (CustomUserDetails) authentication.getPrincipal();

		        int loginMno = user.getMember().getM_no();   // ✅ 수정
		        String loginId = user.getMember().getM_id(); // ✅ 수정

		        lcheck = mldao.l_checkDao(mu_no, loginMno);

		        model.addAttribute("loginId", loginId);
		        model.addAttribute("loginMno", loginMno);
		    }
		
		int lcount = mldao.l_countDao(mu_no);
		
		model.addAttribute("lcheck", lcheck);
		model.addAttribute("lcount", lcount);
		
		List<muCommDTO> list = mcdao.mc_listDao(mu_no);
		model.addAttribute("mclist", list);
		
		return "musicalDetail";
	}
	
	@RequestMapping("/musicalDelete")
	public String musicalDelete(HttpServletRequest request, muListDTO dto) {
		int mu_no = Integer.parseInt(request.getParameter("mu_no"));
		int mi_no = Integer.parseInt(request.getParameter("mu_no"));
		int ca_no = Integer.parseInt(request.getParameter("mu_no"));
		dao.mu_deleteDao(mu_no);
		midao.mi_deleteDao(mu_no);
		cadao.ca_deleteDao(mu_no);
		
		return "redirect:/musicalList";
	}
	
	@RequestMapping("/musicalUpdateForm")
	public String musicalUpdateForm(HttpServletRequest request, Model model) {
		int mu_no = Integer.parseInt(request.getParameter("mu_no"));
		int mi_no = Integer.parseInt(request.getParameter("mu_no"));
		int ca_no = Integer.parseInt(request.getParameter("mu_no"));
		model.addAttribute("medit", dao.mu_viewDao(mu_no));
		model.addAttribute("miedit", midao.mi_viewDao(mu_no));
		model.addAttribute("caedit", cadao.ca_viewDao(mu_no));
		
		return "admin/musicalUpdateForm";
	}
	
	@RequestMapping("/musicalUpdate")
	public String musicalUpdate(muListDTO mldto, muInfoDTO midto, muCastDTO mcdto, @RequestParam("file1") MultipartFile file1,
	@RequestParam("file2") MultipartFile file2, @RequestParam("file3") MultipartFile file3) throws Exception {
		musicalService.updateMusical(mldto, midto, mcdto, file1, file2, file3);
		
		return "redirect:/musicalDetail?mu_no="+mldto.getMu_no();
	}
	
	
}
