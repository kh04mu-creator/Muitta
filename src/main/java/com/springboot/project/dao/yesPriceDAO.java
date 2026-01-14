package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.yesPriceDTO;
 
@Mapper 
public interface yesPriceDAO {
   public List<yesPriceDTO> yes_listDao();
   public yesPriceDTO yes_viewDao(int yes_no);
   public int yes_writeDao(yesPriceDTO dto);
   public int yes_updateDao(yesPriceDTO dto);
   public int yes_deleteDao(int yes_no);
}
