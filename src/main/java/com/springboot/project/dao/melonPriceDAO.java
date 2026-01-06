package com.springboot.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.project.dto.melonPriceDTO;
 
@Mapper 
public interface melonPriceDAO {
   public List<melonPriceDTO> melon_listDao();
   public melonPriceDTO melon_viewDao(int melon_no);
   public int melon_writeDao(melonPriceDTO dto);
   public int melon_updateDao(melonPriceDTO dto);
   public int melon_deleteDao(int melon_no);
   
}

