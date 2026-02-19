package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.project.dto.memberDTO;

@Mapper
public interface memberDAO {
	public List<memberDTO> m_listDao(); // 회원목록 조회
	public memberDTO m_viewDao(int m_no); // 회원정보 상세보기
	public int m_writeDao(memberDTO dto); // 회원가입
	public int m_deleteDao(int m_no); // 회원탈퇴
	public int m_updateDao(memberDTO dto); // 회원정보 수정	
	public memberDTO findByUserId(String userId);
}
