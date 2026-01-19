package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.exchangeDTO;

@Mapper
public interface exchangeDAO {
	public List<exchangeDTO> ex_listDao();
	public exchangeDTO ex_viewDao(int ex_no);
	public exchangeDTO ex_detail(int ex_no);
	public int ex_writeDao(exchangeDTO dto);
	public int ex_deleteDao(int ex_no);
	public int ex_updateDao(exchangeDTO dto);
}
