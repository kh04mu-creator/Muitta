package com.springboot.project.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.exCommDAO;
import com.springboot.project.dao.exchangeDAO;
import com.springboot.project.dto.exchangeDTO;
import com.springboot.project.security.CustomUserDetails;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class exchangeController {
   @Autowired
   exchangeDAO dao;
   @Autowired
   exCommDAO excDao;   
 
   @RequestMapping("/exchange/exchangeWriteForm")
   public String exchangeWriteForm() {
       return "exchange/exchangeWriteForm";
   }

   @RequestMapping("/exchange/exchangeWrite")
   public String exchangeWrite(
           exchangeDTO dto,
           @RequestParam("file1") MultipartFile file1,
           @AuthenticationPrincipal CustomUserDetails userDetails
   ) throws Exception {

       // ✅ 로그인 체크 (403 / NULL 방지)
       if (userDetails == null) {
           return "redirect:/loginForm";
       }

       // ⭐ 핵심 1: 작성자 세팅
       dto.setEx_writer(userDetails.getMember().getM_id());

       // ⭐ 핵심 2: 회원 번호 세팅 (DB에 m_no 있음)
       dto.setM_no(userDetails.getMember().getM_no());

       // 파일 업로드
       if (!file1.isEmpty()) {
           String ex_upload = file1.getOriginalFilename();
           file1.transferTo(
               new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\" + ex_upload)
           );
           dto.setEx_upload(ex_upload);
       }

       dao.ex_writeDao(dto);

       return "redirect:/exchange/exchangeList";
   }


   @RequestMapping("/exchange/exchangeList")
   public String exchangeList(exchangeDTO dto, Model model) {
      model.addAttribute("exlist", dao.ex_listDao());
      
      return "exchange/exchangeList";
   }
   
   @RequestMapping("/exchange/exchangeDetail")
   public String exchangeDetail(
           @RequestParam("ex_no") int ex_no,
           Model model) {

       model.addAttribute("exdetail", dao.ex_viewDao(ex_no));
       model.addAttribute("commList", excDao.exc_listDao(ex_no));

       return "exchange/exchangeDetail";
   }

   
   @RequestMapping("/exchangeDelete")
   public String exchangeDelete(HttpServletRequest request, exchangeDTO dto) {
      int ex_no = Integer.parseInt(request.getParameter("ex_no"));
      dao.ex_deleteDao(ex_no);      
      return "redirect:/exchange/exchangeList";

   }
   
   @RequestMapping("/exchange/exchangeUpdateForm") 
   public String exchangeUpdateForm(HttpServletRequest request, Model model) {
      int ex_no = Integer.parseInt(request.getParameter("ex_no"));
      model.addAttribute("exedit", dao.ex_viewDao(ex_no));
      return "exchange/exchangeUpdateForm";
   }
   
   
   @RequestMapping("/exchange/exchangeUpdate") // 업데이트가 안됨
   public String exchangeUpdate(@RequestParam("file1") MultipartFile file1, exchangeDTO dto) throws Exception {
		if(!file1.isEmpty()) {
			String ex_upload=file1.getOriginalFilename();
			file1.transferTo(new File("C:\\SpringBoot\\Muitta\\src\\main\\resources\\static\\images\\"+ex_upload));
			dto.setEx_upload(ex_upload);
		}
      dao.ex_updateDao(dto);      
      return "redirect:/exchange/exchangeDetail?ex_no=" + dto.getEx_no();

   } 
   
}