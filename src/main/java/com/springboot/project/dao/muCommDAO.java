package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.project.dto.muCommDTO;

@Mapper
public interface muCommDAO {
	public List<muCommDTO> mc_listDao(@Param("mu_no") int mu_no); // 뮤지컬 한줄평 목록 조회
	public muCommDTO mc_viewDao(int mc_no); // 뮤지컬 한줄평 상세보기
	public int mc_writeDao(muCommDTO dto); // 뮤지컬 한줄평 작성
	public int mc_deleteDao(@Param("mc_no") int mc_no); // 뮤지컬 한줄평 삭제
	public int mc_updateDao(muCommDTO dto); // 뮤지컬 한줄평 수정
}
