package com.springboot.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class muCastDTO {
	   private int ca_no;
	   private String ca_upload;
	   private String ca_role;
	   private String ca_name;
	   private int mi_no;
}
