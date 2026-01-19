package com.springboot.project.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.muInfoDTO;

@Mapper
public interface muInfoDAO {
	public List<muInfoDTO> mi_listDao();
	public muInfoDTO mi_viewDao(int mi_no);
	public int mi_deleteDao(int mi_no);
}
