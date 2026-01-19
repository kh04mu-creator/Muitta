package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.muCastDTO;

@Mapper
public interface muCastDAO {
	public List<muCastDTO> mucast_listDao();
	public muCastDTO ca_viewDao(int ca_no);
	public int ca_deleteDao(int ca_no);
}
