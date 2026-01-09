package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.mLikeDTO;

@Mapper
public interface mLikeDAO {
	public List<mLikeDTO> l_listDao();
	public mLikeDTO l_viewDao(int l_no);
	public int l_writeDao(mLikeDTO dto);
	public int l_deleteDao(int l_no);
	public int l_updateDao(mLikeDTO dto);
}
