package com.springboot.project.service;

import java.io.File;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.springboot.project.dao.musicalWriteDAO;
import com.springboot.project.dto.muCastDTO;
import com.springboot.project.dto.muInfoDTO;
import com.springboot.project.dto.muListDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class musicalService {
	private final musicalWriteDAO dao;
	
	@Transactional
	public void writeMusical(muListDTO mldto, muInfoDTO midto, muCastDTO mcdto, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws Exception {
		if(!file1.isEmpty()) {
			String mu_pupload = file1.getOriginalFilename();
			file1.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+mu_pupload));
			mldto.setMu_pupload(mu_pupload);
		}
		dao.insertMuList(mldto);
		
		midto.setMu_no(mldto.getMu_no());
		
		
		if(!file2.isEmpty()) {
			String mi_upload = file2.getOriginalFilename();
			file2.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+mi_upload));
			midto.setMi_upload(mi_upload);
		}	
		dao.insertMuInfo(midto);
		
		mcdto.setMu_no(mldto.getMu_no());
		
		if(!file3.isEmpty()) {
			String ca_upload = file3.getOriginalFilename();
			file3.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+ca_upload));
			mcdto.setCa_upload(ca_upload);
		}	
		dao.insertMuCast(mcdto);
	}
	
	@Transactional
	public void updateMusical(muListDTO mldto, muInfoDTO midto, muCastDTO mcdto, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws Exception {
		if(!file1.isEmpty()) {
			String mu_pupload = file1.getOriginalFilename();
			file1.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+mu_pupload));
			mldto.setMu_pupload(mu_pupload);
		}
		dao.updateMuList(mldto);
		
		midto.setMu_no(mldto.getMu_no());
		
		
		if(!file2.isEmpty()) {
			String mi_upload = file2.getOriginalFilename();
			file2.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+mi_upload));
			midto.setMi_upload(mi_upload);
		}	
		dao.updateMuInfo(midto);
		
		mcdto.setMu_no(mldto.getMu_no());
		
		if(!file3.isEmpty()) {
			String ca_upload = file3.getOriginalFilename();
			file3.transferTo(new File("C:\\Springboot\\Muitta\\src\\main\\resources\\static\\images\\"+ca_upload));
			mcdto.setCa_upload(ca_upload);
		}	
		dao.updateMuCast(mcdto);
	}
	
	
	
}
