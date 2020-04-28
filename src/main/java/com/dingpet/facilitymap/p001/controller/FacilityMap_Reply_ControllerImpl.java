package com.dingpet.facilitymap.p001.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_AttachMapper;
import com.dingpet.facilitymap.p001.service.FacilityMap_Reply_Service;
import com.dingpet.facilitymap.p001.vo.Criteria;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replymap/")
@Log4j
@AllArgsConstructor
public class FacilityMap_Reply_ControllerImpl implements FacilityMap_Reply_Controller {
	@Autowired
	private FacilityMap_Reply_Service service;
	@Autowired
	private FacilityMap_P001_AttachMapper attachMapper;
	
	// 상세페이지 리뷰 등록 Action
	@RequestMapping(value= "/revregister", method = {RequestMethod.POST})
	public String ReviewRegister (Model model, FacilityMap_P001_ReplyVO vo, MultipartHttpServletRequest uploadFile, RedirectAttributes rttr)  {
		System.out.println("============Review write!!!!!");
		
		//---------------------------	사진 업로드 데이터 처리	---------------------------
		String uploadFolder = "/var/lib/tomcat8/webapps/siteimg";
		//String uploadFolder = "C:\\upload";		
		String fileName = "";		
		Iterator<String> files = uploadFile.getFileNames();		
		while(files.hasNext()) {			
			File saveFile = null;
			String saveFileName;
			String filePath;
			String index = files.next();
			UUID placeimg_UUID = UUID.randomUUID();

			MultipartFile mFile = uploadFile.getFile(index);
			fileName = mFile.getOriginalFilename();

			if(!fileName.equals("")) {
				if(index.equals("reviewPic")) {
					saveFileName = placeimg_UUID.toString()+"reviewpic_"+fileName;
					saveFile = new File(uploadFolder, saveFileName);
					filePath = saveFile.getPath();
					vo.setReview_pic(filePath);
					vo.setReview_picname(saveFileName);
				} else {}
				
				try {
					mFile.transferTo(saveFile);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("사진업로드 Exception " + e);
				}
			}
		}
		
		log.info("사진 업로드 완료");
		//---------------------------------------------------------------------------
		log.info("==========================");
		service.reviewregister(vo);
		rttr.addFlashAttribute("result", vo.getSite_id());
		model.addAttribute("url", "https://www.dingpet.shop/siteimg/");
		int site = vo.getSite_id();
		//model.addAttribute("info", service.getDogPlace(site));
		
		return "redirect:/facilitymap/p001/mapinfo?site_id="+site;
	} // ReviewRegister End
	//댓글 등록
//	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> write(@RequestBody FacilityMap_P001_ReplyVO reply_vo){
//		log.info("Reply VO : " + reply_vo);
//		int insertCount = service.write(reply_vo);
//		log.info(insertCount);
//		
//		return insertCount == 1 
//				? new ResponseEntity<>("success", HttpStatus.OK) 
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	//댓글 목록 조회
	@GetMapping(value = "/pages/{board_id}/{pageNum}", 
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FacilityMap_P001_ReplyVO>> list(@PathVariable("board_id") String board_id, @PathVariable("pageNum") int pageNum){
		log.info("listing");
		Criteria cri = new Criteria(pageNum, 10);
		
		return new ResponseEntity<>(service.list(cri, board_id), HttpStatus.OK);
	}
	
	//댓글 조회
	@GetMapping(value = "/{reply_id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<FacilityMap_P001_ReplyVO> view(@PathVariable ("reply_id") String reply_id){
		log.info("reading a reply");
		
		return new ResponseEntity<>(service.view(reply_id), HttpStatus.OK);
	}
	
	//댓글 삭제
	@DeleteMapping(value = "/{reply_id}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("reply_id") String reply_id){
		log.info("removing " + reply_id);
		
		return service.delete(reply_id) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{reply_id}",
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody FacilityMap_P001_ReplyVO reply_vo, @PathVariable("reply_id") String reply_id){
		reply_vo.setReview_id(reply_id);
		log.info("modifying reply_id " + reply_id);
		
		return service.modify(reply_vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
