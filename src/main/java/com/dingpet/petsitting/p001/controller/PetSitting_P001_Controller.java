package com.dingpet.petsitting.p001.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dingpet.petsitting.p001.vo.PetSitting_P001_VO;

public interface PetSitting_P001_Controller {

	public void profilelist(Model model);		// 펫시터 목록
	public void register(Model model);	// 펫시터 프로필 등록
	public void filessaved(HttpServletRequest request, MultipartFile[] files);
	public void register_f(Model model);

	public String registerdata(Model model, PetSitting_P001_VO profile, MultipartHttpServletRequest uploadFile, HttpServletRequest request);
	public void lookup(Model model, PetSitting_P001_VO profile);	// 프로필 조회
	public void update(Model model);	// 프로필 수정
	public void delete(Model model);	// 프로필 삭제
	
}
