package com.dingpet.lostpets.p003.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p003.mapper.LostPets_P003_Mapper;
import com.dingpet.lostpets.p003.vo.LostPets_P003_VO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LostPets_P003_ServiceImple implements LostPets_P003_Service{

	private LostPets_P003_Mapper mapper;
	
	//받은 요청
	public List<LostPets_P001_VO> myList(String member_id) {
		return mapper.myList(member_id);
	}
	public List<LostPets_P001_VO> requestFrom(String member_id) {
		return mapper.requestFrom(member_id);
	}

	//보낸 요청
	public List<LostPets_P001_VO> myRequest(String member_id) {
		return mapper.myRequest(member_id);
	}
	public List<LostPets_P001_VO> requestTo(String member_id) {
		return mapper.requestTo(member_id);
	}
	
	//완료 후기 등록
	public void write(LostPets_P003_VO vo) {
		mapper.write(vo);
		mapper.confirmRequest(vo);
		mapper.complete_lost(vo);
		mapper.complete_find(vo);
		
	}
}
