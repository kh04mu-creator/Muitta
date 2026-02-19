package com.springboot.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.muCastDTO;
import com.springboot.project.dto.muInfoDTO;
import com.springboot.project.dto.muListDTO;

@Mapper
public interface musicalWriteDAO {
	int insertMuList(muListDTO dto);
	int insertMuInfo(muInfoDTO dto);
	int insertMuCast(muCastDTO dto);
	int updateMuList(muListDTO dto);
	int updateMuInfo(muInfoDTO dto);
	int updateMuCast(muCastDTO dto);
}
