package com.springboot.project.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.springboot.project.dto.rwLikeDTO;

@Mapper
public interface rwLikeDAO {
	public List<rwLikeDTO> rwLikeDao();
	public rwLikeDTO rw_viewDao(int rw_no);
	public int rw_deleteDao(int rw_no);
	public int rw_updateDao(rwLikeDTO dto);	
	public int rw_countDao(int rw_no);

}
