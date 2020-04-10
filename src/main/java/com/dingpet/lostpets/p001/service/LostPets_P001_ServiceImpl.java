package com.dingpet.lostpets.p001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.mapper.LostPets_P001_Mapper;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LostPets_P001_ServiceImpl implements LostPets_P001_Service{

	private LostPets_P001_Mapper mapper;

	@Override
	public List<Map<String,String>> list() {
		log.info("list**********");
		return mapper.list();
	}

	//등록
	@Override
	public void write(Map<String, String> writeMap) {
		mapper.writeLost(writeMap);
		mapper.writeDog(writeMap);
	}
	
	/*
	@Override
	public void write(LostPets_P001_VO lostVO) {
		// TODO Auto-generated method stub
		log.info("write............." + lostVO);
		mapper.write(lostVO);
	}
	*/
	
	@Override
	public LostPets_P001_VO view(String board_id) {
		log.info("view===========" + board_id);
		return mapper.view(board_id);
	}

	@Override
	public boolean delete(String board_id) {
		log.info("delete==========" + board_id);
		return mapper.delete(board_id) == 1;
	}

	@Override
	public boolean modify(LostPets_P001_VO lostVO) {
		log.info("modify==========" + lostVO);
		return mapper.modify(lostVO) == 1;
	}


	
}
