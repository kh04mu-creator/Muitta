package com.springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class reviewDTO {
	   private int r_no;
	   private String r_title;
	   private String r_writer;
	   private Date r_date;
	   private int r_view;
	   private double r_star;
	   private String r_detail;
	   private String r_upload;
	   private int m_no;
	   private int likeCount;
}
