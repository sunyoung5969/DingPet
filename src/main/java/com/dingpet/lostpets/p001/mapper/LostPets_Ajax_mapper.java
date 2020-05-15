package com.dingpet.lostpets.p001.mapper;

import java.util.List;
import java.util.Map;

import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p001.vo.LostPets_Request_VO;

public interface LostPets_Ajax_mapper {
	//해당 회원의 작성글 목록
	public List<LostPets_P001_VO> myList(String member_id);
	
	//요청 전송
	public int send(LostPets_Request_VO request_vo);

	//특정 게시글에 대한 요청 글 목록
	public  List<LostPets_P001_VO> requestList(String board_id);

	//요청 삭제
	public int deleteRequest(String request_id);
	

	
}
