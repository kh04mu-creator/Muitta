package com.springboot.project.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.springboot.project.dto.mdDTO;

@Mapper
public interface mdDAO {
	public List<mdDTO> md_listDao();
	public mdDTO md_viewDao(int md_no);
	public int md_writeDao(mdDTO dto);
	public int md_deleteDao(int md_no);
	public int md_updateDao(mdDTO dto);
}
