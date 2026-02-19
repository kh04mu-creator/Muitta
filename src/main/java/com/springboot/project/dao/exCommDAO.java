package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.exCommDTO;
 
@Mapper
public interface exCommDAO {
	public List<exCommDTO> exc_listDao(int ex_no);
	public exCommDTO exc_viewDao(int exc_no);
	public int exc_writeDao(exCommDTO dto);
	public int exc_deleteDao(int exc_no);
}
