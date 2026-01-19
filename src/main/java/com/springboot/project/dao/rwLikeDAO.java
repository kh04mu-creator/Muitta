package com.springboot.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface rwLikeDAO {

    int likeCheck(
        @Param("m_no") int m_no,
        @Param("r_no") int r_no
    );

    int likeInsert(
        @Param("m_no") int m_no,
        @Param("r_no") int r_no
    );

    int likeDelete(
        @Param("m_no") int m_no,
        @Param("r_no") int r_no
    );

    int likeCount(
        @Param("r_no") int r_no
    );
    
    // 후기 삭제시 FK 충돌 방지용
    int likeDeleteByReview(
    	@Param("r_no") int r_no
    );

}
