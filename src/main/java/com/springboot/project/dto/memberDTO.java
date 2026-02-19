package com.springboot.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class memberDTO {
   private int m_no;
   private String m_id;
   private String m_password;
   private String m_name;
   private String m_gender;
   private String m_birth;
   private String m_email;
   private String m_tel;
   private Date m_join;
   private String m_auth;
}