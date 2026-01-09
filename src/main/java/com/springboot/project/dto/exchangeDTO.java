package com.springboot.project.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class exchangeDTO {
   private int ex_no;
   private String ex_title;
   private String ex_writer;
   private Date ex_date;
   private String ex_detail;
   private String ex_upload;
   private String ex_ing;   
   private int m_no;
}