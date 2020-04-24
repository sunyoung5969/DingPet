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

import com.dingpet.facilitymap.p001.dto.ReplyPageDTO;
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
public class FacilityMap_Reply_ControllerImpl {
	@Autowired
	private FacilityMap_Reply_Service service;
	@Autowired
	private FacilityMap_P001_AttachMapper attachMapper;
	
	//댓글 등록
	@RequestMapping(value = "/new", method = {RequestMethod.POST}, consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> write(@RequestBody FacilityMap_P001_ReplyVO reply_vo){
		log.info("Reply VO : " + reply_vo);
		int insertCount = service.write(reply_vo);
		log.info(insertCount);
		
		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 목록 조회
	@RequestMapping(value = "/pages/{site_id}/{pageNum}", method = {RequestMethod.GET},
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> list(@PathVariable("site_id") String site_id, @PathVariable("pageNum") int pageNum){
		
		log.info("listing");		
		log.info("site_id:"+site_id);
		Criteria cri = new Criteria(pageNum, 5);
		
		return new ResponseEntity<>(service.getListPage(cri, site_id), HttpStatus.OK);
	}
	
	//댓글 조회
	@RequestMapping(value = "/{review_id}", method = {RequestMethod.GET}, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<FacilityMap_P001_ReplyVO> view(@PathVariable ("review_id") String review_id){
		log.info("reading a reply");
		
		return new ResponseEntity<>(service.view(review_id), HttpStatus.OK);
	}
	
	//댓글 삭제
	@RequestMapping(value = "/{review_id}", method = {RequestMethod.DELETE}, produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("review_id") String review_id){
		log.info("removing " + review_id);
		
		return service.delete(review_id) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{review_id}",
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody FacilityMap_P001_ReplyVO reply_vo, @PathVariable("review_id") String review_id){
		reply_vo.setReview_id(review_id);
		log.info("modifying reply_id " + review_id);
		
		return service.modify(reply_vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
