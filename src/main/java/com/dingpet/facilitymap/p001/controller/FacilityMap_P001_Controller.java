package com.dingpet.facilitymap.p001.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Controller {

	// 시설지도 
	public void facilityMap(Model model);

	// 시설지도 병원 카테고리 조회 
	public ResponseEntity<List<FacilityMap_P001_VO>> medicenterMap(PlaceDTO dto);
	// 시설지도 약국 카테고리 조회
	public ResponseEntity<List<FacilityMap_P001_VO>> mediMap2(PlaceDTO dto);
	// 시설지도 카페 카테고리 조회
	public ResponseEntity<List<FacilityMap_P001_VO>> cafeMap(PlaceDTO dto);
	// 등록 페이지 register 
	public void test(Model model);
	// 등록 Action
	public String registerAction(Model model, FacilityMap_P001_VO vo, MultipartHttpServletRequest uploadFile, RedirectAttributes rttr);
	// 상세페이지 조회 info
	public void facilityinfo(@ModelAttribute("place_num") int place_num, Model model);
	// 시설 인포 리뷰 등록 register
	public String ReviewRegister (Model model, FacilityMap_P001_VO vo, MultipartHttpServletRequest uploadFile, RedirectAttributes rttr);
	
}
