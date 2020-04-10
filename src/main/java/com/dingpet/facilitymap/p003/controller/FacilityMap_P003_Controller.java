package com.dingpet.facilitymap.p003.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dingpet.facilitymap.p003.service.FacilityMap_P003_Service;

import lombok.AllArgsConstructor;

public interface FacilityMap_P003_Controller {

	public void test(Model model);
	//=== 샘플페이지 시작 ===
	public void facilityinfo_f(Model model);
		
	public void facilityregister_f(Model model); 
	//=== 샘플페이지 끝 ===	
}
