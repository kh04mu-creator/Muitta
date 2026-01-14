package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.mLikeDTO;

@Mapper
public interface mLikeDAO {
	public List<mLikeDTO> l_listDao();
	public int l_countDao(int mu_no, int m_no);
	public int l_checkDao(int mu_no, int m_no);
	public int l_writeDao(int mu_no, int m_no);
	public int l_deleteDao(int l_no, int m_no);
}
