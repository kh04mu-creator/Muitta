package com.springboot.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.project.dao.exCommDAO;
import com.springboot.project.dao.exchangeDAO;
import com.springboot.project.dto.exCommDTO;
import com.springboot.project.dto.exchangeDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class exCommController {
	@Autowired
	exCommDAO dao;
	@Autowired
	exchangeDAO exdao;
	
	
	@RequestMapping("/exComm/exCommWriteForm")
	public String exCommWriteForm() {
		return "exComm/exCommWriteForm";
	}
	
//	@RequestMapping("/exchange/exCommWrite") 
//	public String exCommWrite(HttpServletRequest request, exCommDTO dto) {		
//		dao.exc_writeDao(dto); 
//		return "redirect:/exchange/exchangeDetail"; 
//		}
//	
	@RequestMapping("/exchange/exCommWrite")
	public String exCommWrite(
	        exCommDTO dto,
	        Principal principal) {

	    // 로그인 안 된 경우 방어
	    if (principal == null) {
	        return "redirect:/loginForm";
	    }

	    // 로그인 아이디
	    String exc_writer = principal.getName();
	    dto.setExc_writer(exc_writer); // 작성자 ID
	    dao.exc_writeDao(dto);      // DAO 직접 호출
	    

	    // ⭐ ex_no 반드시 포함
	    return "redirect:/exchange/exchangeDetail?ex_no=" + dto.getEx_no();
	}	
	
	@RequestMapping("/exCommDelete")
	public String exCommDelete(HttpServletRequest request, exCommDTO dto, Principal principal) {
	      int exc_no = Integer.parseInt(request.getParameter("exc_no"));
	      int ex_no = Integer.parseInt(request.getParameter("ex_no"));
	      dto = dao.exc_viewDao(exc_no);
	      
	      // 로그인 체크
	      if (principal == null) {
	          return "redirect:/loginForm";
	      }
	      String loginId = principal.getName();
	      
	      //  본인 또는 관리자만 삭제 가능
	      if (loginId.equals(dto.getExc_writer()) || loginId.equals("admin")) {
	    	 dao.exc_deleteDao(exc_no);
	      }
	      
	      return "redirect:/exchange/exchangeDetail?ex_no=" + dto.getEx_no();
	   }	   
		
	}
	
//	@RequestMapping("/exchange/exchangeDetail")
//	public String exchangeDetail(
//			@RequestParam("ex_no") int ex_no, Model model, exchangeDTO exdto) {
//		// 🔥 Service 없이 DAO 직접 호출
//		//exdto = exdao.ex_detail(ex_no);
//		//List<exCommDTO> commList = dao.exc_listDao(ex_no);
//		//model.addAttribute("exdetail", exdto = exdao.ex_detail(ex_no));
//		model.addAttribute("exdetail", exdao.ex_detail(ex_no));
//		model.addAttribute("commList", dao.exc_listDao(ex_no));
//
//	    return "exchange/exchangeDetail";
//	}

	
	
	
//	@RequestMapping("/exchange/comment")
//	public class ExchangeCommentController {
//
//	    private final ExchangeCommentService commentService;
//
//	    public ExchangeCommentController(ExchangeCommentService commentService) {
//	        this.commentService = commentService;
//	    }

//	    // ✅ 댓글 등록
//	    @RequestMapping("/write")
//	    public String write(
//	            @RequestParam int ex_no,
//	            @RequestParam String c_content,
//	            HttpSession session
//	    ) {
//	        String m_id = (String) session.getAttribute("loginId");
//	        if (m_id == null) {
//	            return "redirect:/member/login";
//	        }
//
//	        ExchangeCommentDTO dto = new ExchangeCommentDTO();
//	        dto.setEx_no(ex_no);
//	        dto.setM_id(m_id);
//	        dto.setC_content(c_content);
//
//	        commentService.write(dto);
//
//	        return "redirect:/exchange/detail?ex_no=" + ex_no;
//	    }
//
	    
	    
//	    // ✅ 댓글 삭제
//	    @RequestMapping("/exCommDelete")
//	    public String exCommDelete(
////	            @RequestParam int exc_no,
////	            @RequestParam int ex_no,
//	            HttpSession session,
//	            exCommDTO dto
//	    ) {
//	        String m_id = (String) session.getAttribute("loginId");
//	        
//
//	        // 작성자 본인만 삭제
//	        commentService.delete(dto.getExc_no(), dto.getExc_writer());
//
//	        return "redirect:/exchange/detail?exc_no=" + exc_no;
//	    }
//	
//	
//	
//	
//
//}
