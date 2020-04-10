package com.dingpet.lostpets.p001.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.lostpets.p001.service.LostPets_P001_Service;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/lostpets/p001/*")
@AllArgsConstructor
@Controller
public class LostPets_P001_ControllerImpl implements LostPets_P001_Controller {

	@Autowired
	private LostPets_P001_Service service;

	// 목록 조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.list());
	}

	// 글 등록
	@PostMapping("/write")
	public String write(@RequestParam Map<String, String> writeMap, RedirectAttributes rttr) {
		service.write(writeMap);
		rttr.addFlashAttribute("result", writeMap.get("board_id"));

		return "redirect:/lostpets/p001/list";
	}

	/*
	  //글 등록
	 @PostMapping("/write") 
	 public String write(LostPets_P001_VO lostVO,  RedirectAttributes rttr) {
	 service.write(lostVO);
	 rttr.addFlashAttribute("result", lostVO.getBoard_id());
	 
	  return "redirect:/lostpets/p001/list"; }
	*/

	// 글 등록 폼으로 이동
	@GetMapping("/write")
	public void write() {

	}

	// 글 조회
	@GetMapping({"/view", "/modify"})
	public void view(@RequestParam("board_id") String board_id, Model model) {
		model.addAttribute("board", service.view(board_id));
	}

	// 글 수정
	@PostMapping("/modify")
	public String modify( LostPets_P001_VO lostVO, RedirectAttributes rttr) {
		if (service.modify(lostVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/lostpets/p001/list";
	}

	// 글 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("board_id") String board_id, RedirectAttributes rttr) {
		if (service.delete(board_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/lostpets/p001/list";
	}
}
