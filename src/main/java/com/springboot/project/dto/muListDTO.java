package com.springboot.project.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class muListDTO {
   private int  mu_mo;
   private String mu_title;
   private String mu_place;
   private String mu_addr;
   private Date mu_start;
   private Date mu_end;
   private String mu_time;
   private String mu_age;
   private String vip_price;
   private String r_price;
   private String s_price;
   private String a_price;
   private MultipartFile mu_pupload;
   private String mu_pname;
}
