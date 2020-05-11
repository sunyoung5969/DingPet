package com.dingpet.petsitting.p003.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dingpet.petsitting.p003.vo.PetSitting_P003_VO;

public interface PetSitting_P003_Controller {
	
	// 일지 등록 폼
	public void logregister(Model model);
	
	// 산책 등록 폼
	public void walkregister(Model model);
	
	// 산책 데이터 처리
	public void loglocationdata(Model model, PetSitting_P003_VO logVO);
	
	// 일지(산책) 등록 폼
	public void walklogregister(Model model, PetSitting_P003_VO logVO);	
	
	// 일지 데이터 처리
	public String logregisterdata(Model model, PetSitting_P003_VO logVO, MultipartHttpServletRequest uploadFile, HttpServletRequest request);
	
	// 일지 조회
	public void loglookup(Model model, PetSitting_P003_VO logVO, HttpServletRequest request);
	
	// 산책경로 테스트
	public void walkpathtest(Model model, PetSitting_P003_VO logVO);

	
}
