package com.dingpet.lostpets.p001.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dingpet.lostpets.p001.service.LostPets_Reply_Service;
import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_Reply_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class LostPets_Reply_Controller {

	private LostPets_Reply_Service service;
	
	//댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> write(@RequestBody LostPets_Reply_VO reply_vo){
		log.info("Reply VO : " + reply_vo);
		int insertCount = service.write(reply_vo);
		log.info(insertCount);
		
		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 목록 조회
	@GetMapping(value = "/pages/{board_id}/{pageNum}", 
			produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<LostPets_Reply_VO>> list(@PathVariable("board_id") String board_id, @PathVariable("pageNum") int pageNum){
		log.info("listing");
		Criteria cri = new Criteria(pageNum, 10);
		
		return new ResponseEntity<>(service.list(cri, board_id), HttpStatus.OK);
	}
	
	//댓글 조회
	@GetMapping(value = "/{reply_id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<LostPets_Reply_VO> view(@PathVariable ("reply_id") String reply_id){
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
	public ResponseEntity<String> modify(@RequestBody LostPets_Reply_VO reply_vo, @PathVariable("reply_id") String reply_id){
		reply_vo.setReply_id(reply_id);
		log.info("modifying reply_id " + reply_id);
		
		return service.modify(reply_vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
