package com.springboot.project.dto;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class mdDTO {
   private int md_no;
   private String md_category;
   private String md_title;
   private String md_upload; // db 저장된 컬럼
   private MultipartFile md_name;
   private String md_start;
   private String md_end;
   private String md_memo;
}
