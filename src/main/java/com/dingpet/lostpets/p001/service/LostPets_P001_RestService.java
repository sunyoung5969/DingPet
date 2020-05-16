package com.dingpet.lostpets.p001.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.mapper.LostPets_Ajax_mapper;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p001.vo.LostPets_Request_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LostPets_P001_RestService {
	
	private LostPets_Ajax_mapper mapper;
	
	//해당 회원의 작성글 목록
	public List<LostPets_P001_VO> myList(String member_id){
		log.info("서비스 호출");
		return mapper.myList(member_id);
	}
	
	//요청 보내기
	public int send(LostPets_Request_VO request_vo) {
		log.info("sending");
		return mapper.send(request_vo);
	}
	
	//요청 목록
	public List<LostPets_P001_VO> requestList(String board_id) {
		return mapper.requestList(board_id);
	}
	
	//요청 삭제
	public int deleteRequest(String request_id) {
		log.info("요청 삭제");
		return mapper.deleteRequest(request_id);
	}
	
	/*
	//완료 처리
	public int confirmRequest(String request_id) {
		return mapper.confirmRequest(request_id);
	}
	
	public int complete(String board_id) {
		return mapper.complete(board_id);
	}*/
}
