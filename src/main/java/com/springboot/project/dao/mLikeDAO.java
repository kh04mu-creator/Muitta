package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.project.dto.mLikeDTO;

@Mapper
public interface mLikeDAO {
	public List<mLikeDTO> l_listDao(@Param("m_no") int m_no);
	public int l_countDao(@Param("mu_no") int mu_no);
	public int l_checkDao(@Param("mu_no") int mu_no, @Param("m_no") int m_no);
	public int l_writeDao(@Param("m_no") int m_no, @Param("mu_no") int mu_no);
	public int l_deleteDao(@Param("m_no") int m_no, @Param("mu_no") int mu_no);
}
