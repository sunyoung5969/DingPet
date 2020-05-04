package com.dingpet.lostpets.p001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.lostpets.p001.service.LostPets_P001_Service;
import com.dingpet.lostpets.p001.util.FileUploadUtils;
import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p001.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/lostpets/p001/*")
@AllArgsConstructor
@Controller
public class LostPets_P001_ControllerImpl implements LostPets_P001_Controller {

	@Autowired
	private LostPets_P001_Service service;
	
	//목록 조회
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);
		model.addAttribute("list", service.list(cri));
		
		int total = service.getTotalAmount(cri);
		model.addAttribute("pagination", new PageDTO(cri, total));
	}

	// 글 등록 폼으로 이동
	@GetMapping("/write")
	public void write() {
		
	}
	
	// 글 등록
	@PostMapping("/write")
	public String write(@RequestParam Map<String, Object> writeMap, MultipartFile file, RedirectAttributes rttr) throws Exception {
		service.write(writeMap);
		rttr.addFlashAttribute("result", writeMap.get("board_id"));
		
		return "redirect:/lostpets/p001/list";
	}
	
	// 글 조회
	@GetMapping({"/view", "/modify"})
	public void view(@RequestParam("board_id") String board_id, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.view(board_id));
		log.info("view");
	}

	// 글 수정
	@PostMapping("/modify")
	public String modify( LostPets_P001_VO lostVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.modify(lostVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		log.info("modify");
		return "redirect:/lostpets/p001/list";
	}

	// 글 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("board_id") String board_id, @RequestParam("dog_id") String dog_id, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if (service.delete(board_id, dog_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		log.info("delete");
		return "redirect:/lostpets/p001/list";
	}




}
