package com.springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class exCommDTO {
   private int exc_no; // 댓글번호
   private String exc_writer; // 작성자id
   private Date exc_date;
   private String exc_detail;
   private int ex_no; // 게시글 번호
}
