package com.springboot.project.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.reviewDTO;

@Mapper
public interface reviewDAO {
	public List<reviewDTO> r_listDao(); 
	public reviewDTO r_viewDao(int r_no);
	public int r_writeDao(reviewDTO dto);	
	public int r_deleteDao(int r_no);
	public int r_updateDao(reviewDTO dto);
}
