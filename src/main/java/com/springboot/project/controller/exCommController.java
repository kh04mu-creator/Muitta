package com.springboot.project.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.project.dao.exCommDAO;
import com.springboot.project.dao.exchangeDAO;
import com.springboot.project.dto.exCommDTO;

@Controller
public class exCommController {

    @Autowired
    exCommDAO dao;

    @Autowired
    exchangeDAO exdao;

    // 댓글 작성
    @PostMapping("/exchange/exCommWrite")
    public String exCommWrite(exCommDTO dto, Principal principal) {

        // 로그인 체크
        if (principal == null) {
            return "redirect:/loginForm";
        }

        // 작성자 설정
        dto.setExc_writer(principal.getName());

        dao.exc_writeDao(dto);

        // 상세페이지로 복귀
        return "redirect:/exchange/exchangeDetail?ex_no=" + dto.getEx_no();
    }

    // 댓글 삭제
    @PostMapping("/exchange/exCommDelete")
    public String exCommDelete(
            @RequestParam("exc_no") int exc_no,
            @RequestParam("ex_no") int ex_no,
            Principal principal) {

        // 로그인 체크
        if (principal == null) {
            return "redirect:/loginForm";
        }

        // 삭제 대상 댓글 조회
        exCommDTO dto = dao.exc_viewDao(exc_no);
        if (dto == null) {
            return "redirect:/exchange/exchangeDetail?ex_no=" + ex_no;
        }

        String loginId = principal.getName();

        // 작성자 또는 관리자만 삭제
        if (loginId.equals(dto.getExc_writer()) || loginId.equals("admin")) {
            dao.exc_deleteDao(exc_no);
        }

        return "redirect:/exchange/exchangeDetail?ex_no=" + ex_no;
    }
}
