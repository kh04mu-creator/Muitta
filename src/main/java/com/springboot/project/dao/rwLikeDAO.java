package com.springboot.project.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface rwLikeDAO {

    int likeCheck(int m_no, int r_no);   // 공감 여부 확인
    int likeInsert(int m_no, int r_no);  // 공감 추가
    int likeDelete(int m_no, int r_no);  // 공감 취소
    int likeCount(int r_no);             // 공감 수
}
