package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.muCastDTO;

@Mapper
public interface muCastDAO {
	public List<muCastDTO> mucast_listDao();
	public muCastDTO mucast_viewDao(int ca_no);
	public int mucast_writeDao(muCastDTO dto);
	public int mucast_updateDao(muCastDTO dto);
	public int mucast_deleteDao(int ca_no);
}
