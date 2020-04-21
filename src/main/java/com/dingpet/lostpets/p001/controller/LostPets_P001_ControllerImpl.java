package com.dingpet.lostpets.p001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		log.info("list");
	}

	// 글 등록 폼으로 이동
	@GetMapping("/write")
	public void write() {
		
	}
	
	// 글 등록
	@PostMapping("/write")
	public String write(@RequestParam Map<String, Object> writeMap, MultipartFile file, RedirectAttributes rttr) throws Exception {
		String uploadPath = "C://upload/";
		//파일 업로드
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileUploadUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null) {
			fileName = FileUploadUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		}else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		writeMap.put("photo_test", File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		log.info("photo_front : " + writeMap.get("photo_test"));
		service.write(writeMap);
		rttr.addFlashAttribute("result", writeMap.get("board_id"));
		
		
		return "redirect:/lostpets/p001/list";
	}
	
	//
	/*
	private static final String IMAGE_PATH = "C:\\upload\\tmp";
	
	@PostMapping("/write")
	public ModelAndView upload(@RequestParam Map<String, Object> writeMap, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		
		List fileList = fileProcess(multipartRequest);
		writeMap.put("fileList", fileList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("writeMap", writeMap);
		mav.setViewName("view");
		
		return mav;
		
	}
	
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileList = new ArrayList<>();
		
		//첨부된 파일 이름들을 가져옴
		Iterator<String> fileNames = multipartRequest.getFileNames();
		//List fileList에 이름을 저장
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			
			File file = new File(IMAGE_PATH + "\\" + fileName) ;
			
			//첨부된 파일이 있나 확인 > 경로에 파일이 없으면 그 경로에 해당하는 dir 만든 후 파일 생성
			if(mFile.getSize() != 0) {
				if(file.getParentFile().mkdirs()) {
					file.createNewFile();
				}
			}
			//임시저장된 multipartFile 실제로 전송
			mFile.transferTo(new File(IMAGE_PATH + "\\" + originalFileName));
		}
		//첨부파일 이름 리스트 반환
		return fileList;
	}
	*/
	
	// 글 조회
	@GetMapping({"/view", "/modify"})
	public void view(@RequestParam("board_id") String board_id, Model model) {
		model.addAttribute("board", service.view(board_id));
		log.info("view");
	}

	// 글 수정
	@PostMapping("/modify")
	public String modify( LostPets_P001_VO lostVO, RedirectAttributes rttr) {
		if (service.modify(lostVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		log.info("modify");
		return "redirect:/lostpets/p001/list";
	}

	// 글 삭제
	@PostMapping("/delete")
	public String delete(@RequestParam("board_id") String board_id, @RequestParam("dog_id") String dog_id, RedirectAttributes rttr) {
		if (service.delete(board_id, dog_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		log.info("delete");
		return "redirect:/lostpets/p001/list";
	}


}
