package com.springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class mLikeDTO {
	private int l_no;
	private String l_title;
	private Date l_start;
	private Date l_end;
	private int mu_no;
	private int m_no;
}
