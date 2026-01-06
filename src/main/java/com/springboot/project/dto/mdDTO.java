package com.springboot.project.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class mdDTO {
   private int md_no;
   private String md_category;
   private String md_title;
   private MultipartFile md_upload;
   private String md_name;
   private Date md_start;
   private Date md_end;
   private String md_memo;
}
