package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.project.dto.muListDTO;

@Mapper
public interface muListDAO {
	public List<muListDTO> mu_listDao(); // 뮤지컬 목록 조회
	public muListDTO mu_viewDao(int mu_no); // 뮤지컬 상세보기
	public int mu_writeDao(muListDTO dto); // 뮤지컬 내용 작성
	public int mu_deleteDao(int mu_no); // 뮤지컬 내용 삭제
	public int mu_updateDao(muListDTO dto); // 뮤지컬 내용 수정
	public List<muListDTO> selectLikedMuList(@Param("m_no") int m_no);
}
