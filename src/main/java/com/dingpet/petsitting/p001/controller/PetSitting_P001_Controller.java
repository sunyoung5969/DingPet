package com.dingpet.petsitting.p001.controller;

import org.springframework.ui.Model;

public interface PetSitting_P001_Controller {

	public void petsitterlist(Model model);		// 펫시터 목록
	public void register(Model model);	// 펫시터 프로필 등록
	public void lookup(Model model);	// 프로필 조회
	public void update(Model model);	// 프로필 수정
	public void delete(Model model);	// 프로필 삭제
	
}
