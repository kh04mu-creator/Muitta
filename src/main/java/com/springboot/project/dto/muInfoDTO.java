package com.springboot.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class muInfoDTO {
   private int mi_no;
   private String mi_detail;
   private String mi_upload;
   private String mi_pname;
   private int mu_no;
}
