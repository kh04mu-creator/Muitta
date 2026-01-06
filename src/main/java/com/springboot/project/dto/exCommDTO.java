package com.springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class exCommDTO {
   private int exc_no;
   private String exc_writer;
   private Date exc_date;
   private String exc_detail;
   private int ex_no;
}
