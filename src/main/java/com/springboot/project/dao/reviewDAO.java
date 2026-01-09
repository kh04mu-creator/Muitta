package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.reviewDTO;

@Mapper
public interface reviewDAO {
	public List<reviewDTO> r_listDao();  // 후기 목록 조회
	public reviewDTO r_viewDao(int r_no); // 후기 상세보기
	public int r_viewCountUp(int r_no); // 조회수 증가
	public int r_writeDao(reviewDTO dto); // 후기 작성	
	public int r_deleteDao(int r_no); // 후기 삭제
	public int r_updateDao(reviewDTO dto); // 후기 수정
}
