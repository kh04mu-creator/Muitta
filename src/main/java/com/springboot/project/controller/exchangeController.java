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
import com.springboot.project.dto.mdDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class exchangeController {
   @Autowired
   exchangeDAO dao;
   
   @RequestMapping("/exchange/exchangeWriteForm")
   public String exchangeWriteForm() {
      return "exchange/exchangeWriteForm";
   }
   
   @RequestMapping("/exchange/exchangeWrite")
   public String exchangeWrite(exchangeDTO dto, @RequestParam("file") MultipartFile file) throws Exception {
      if(!file.isEmpty()) {
         String ex_upload = file.getOriginalFilename();
         file.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+ex_upload));         
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
   public String exchangeDetail(HttpServletRequest request, exchangeDTO dto, Model model) {
      int ex_no = Integer.parseInt(request.getParameter("ex_no"));
      model.addAttribute("exdetail", dao.ex_viewDao(ex_no));
      
      return "exchange/exchangeDetail";
   }
   
   @RequestMapping("/exchangeDelete")
   public String exchangeDelete(HttpServletRequest request, exchangeDTO dto) {
      int ex_no = Integer.parseInt(request.getParameter("ex_no"));
      dao.ex_deleteDao(ex_no);
      
      return "exchange/exchangeList";
   }
   
   @RequestMapping("/exchange/exchangeUpdateForm")
   public String exchangeUpdateForm(HttpServletRequest request, exchangeDTO dto, Model model) {
      int ex_no = Integer.parseInt(request.getParameter("ex_no"));
      model.addAttribute("exedit", dao.ex_viewDao(ex_no));
      
      return "exchange/exchangeUpdateForm";
   }
   
   @RequestMapping("/exchange/exchangeUpdate")
   public String exchangeUpdate(exchangeDTO dto, @RequestParam("ex_upload") MultipartFile ex_upload) throws Exception {
      if(!ex_upload.isEmpty()) {
         String ex_name = ex_upload.getOriginalFilename();
         ex_upload.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+ex_name));         
      }
      dao.ex_updateDao(dto);      
      return "redirect:/exchange/exchangeDetail";
   }
   
}