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

import com.dingpet.lostpets.p001.service.LostPets_P001_RestService;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p001.vo.LostPets_Reply_VO;
import com.dingpet.lostpets.p001.vo.LostPets_Request_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/lost")
@AllArgsConstructor
public class LostPets_P001_RestController {
	
	private LostPets_P001_RestService service;

	//해당 회원의 작성글 목록
	@GetMapping(value = "/myList/{member_id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<LostPets_P001_VO>> myList(@PathVariable("member_id") String member_id){
		log.info("myList 메소드 호출");
		
		return new ResponseEntity<>(service.myList(member_id), HttpStatus.OK);
	}
	
	//요청 전송
	@PostMapping(value = "/sendRequest", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> send(@RequestBody LostPets_Request_VO request_vo){
		log.info("request_vo : " + request_vo);
		int insertCount = service.send(request_vo);
		
		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//증복확인
	
	
	//요청 삭제
	@DeleteMapping(value = "/deleteRequest/{request_id}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteRequest(@PathVariable("request_id") String request_id){
		
		return service.deleteRequest(request_id) ==1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/*//완료 처리
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/confirmRequest/{board_id}/{request_id}",
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody LostPets_P001_VO vo, @PathVariable("request_id") String request_id, @PathVariable("board_id") String board_id){
		
		return service.confirmRequest(request_id) == 1 && service.complete(board_id) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/request/{member_id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<LostPets_P001_VO>> requestList(@PathVariable("member_id") String member_id){
		log.info("requestList 메소드 호출");
		
		return new ResponseEntity<>(service.requestList(member_id), HttpStatus.OK);
	}*/
	
	
	
	
	
	
	
}
