package com.springboot.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class muListDTO {
   private int  mu_no;
   private String mu_title;
   private String mu_place;
   private String mu_addr;
   private String mu_start;
   private String mu_end;
   private String mu_time;
   private String mu_age;
   private String vip_price;
   private String r_price;
   private String s_price;
   private String a_price;
   private String mu_pupload;
   private MultipartFile file1;
}
