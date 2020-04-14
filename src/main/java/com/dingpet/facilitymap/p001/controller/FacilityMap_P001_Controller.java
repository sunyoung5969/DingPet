package com.dingpet.facilitymap.p001.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

public interface FacilityMap_P001_Controller {

	// 시설지도 
	public void facilityMap(Model model);

	// 시설지도 병원 카테고리 조회 
	public ResponseEntity<List<FacilityMap_P001_VO>> medicenterMap(PlaceDTO dto);

	// 등록 reagister 
	public void test(Model model);
	
	// 상세페이지 조회 info
	public void facilityinfo(@ModelAttribute("place_num") int place_num, Model model);
	
}
