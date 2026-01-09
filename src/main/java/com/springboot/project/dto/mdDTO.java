package com.springboot.project.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class mdDTO {
   private int md_no;
   private String md_category;
   private String md_title;
   private String md_upload;
   private Date md_start;
   private Date md_end;
   private String md_memo;
}
