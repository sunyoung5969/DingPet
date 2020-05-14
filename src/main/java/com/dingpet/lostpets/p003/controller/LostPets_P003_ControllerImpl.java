package com.dingpet.lostpets.p003.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p003.service.LostPets_P003_Service;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/lostpets/request/*")
public class LostPets_P003_ControllerImpl implements LostPets_P003_Controller {
	
	private LostPets_P003_Service service;

	//요청 목록 가져오기
		@GetMapping("/list")
		public void request(@RequestParam("member_id") String member_id, Model model) {
			//받은 요청
			List<LostPets_P001_VO> myList = service.myList(member_id);		//내가 쓴 글 목록
			List<LostPets_P001_VO> requestFrom = service.requestFrom(member_id); 		//내 글에 대한 요청 목록

			//보낸 요청
			List<LostPets_P001_VO> myRequest = service.myRequest(member_id);		//내 요청 목록
			List<LostPets_P001_VO> requestTo = service.requestTo(member_id); 		//내 요청을 수신한 글 목록
			
			model.addAttribute("myList", myList);
			model.addAttribute("requestFrom", requestFrom);
			
			model.addAttribute("myRequest", myRequest);
			model.addAttribute("requestTo", requestTo);
		}
}
