package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.springboot.project.dto.reviewDTO;

@Mapper
public interface reviewDAO {

    // 후기 목록 조회
    List<reviewDTO> r_listDao();

    // 후기 상세보기
    reviewDTO r_viewDao(@Param("r_no") int r_no);

    // 조회수 증가
    int r_viewCountUp(@Param("r_no") int r_no);

    // 후기 작성
    int r_writeDao(reviewDTO dto);

    // 후기 삭제
    int r_deleteDao(@Param("r_no") int r_no);

    // 후기 수정
    int r_updateDao(reviewDTO dto);
    
    // 최근 후기 목록
    List<reviewDTO> selectRecentReviews();

}
