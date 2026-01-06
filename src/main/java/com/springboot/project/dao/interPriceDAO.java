package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.interPriceDTO;

@Mapper
public interface interPriceDAO {
	public List<interPriceDTO> inter_listDao();
	public interPriceDTO inter_viewDao(int inter_no);
	public int inter_writeDao(interPriceDTO dto);
	public int inter_updateDao(interPriceDTO dto);
	public int inter_deleteDao(int inter_no);
}
