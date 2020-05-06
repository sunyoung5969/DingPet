package com.dingpet.facilitymap.p001.controller;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;

public interface FacilityMap_Reply_Controller {

	// 시설 인포 리뷰 등록 register
	public String ReviewRegister (Model model, FacilityMap_P001_ReplyVO vo, MultipartHttpServletRequest uploadFile, RedirectAttributes rttr);
	
}
