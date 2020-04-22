package com.dingpet.lostpets.p001.service;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.mapper.LostPets_P001_Mapper;
import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LostPets_P001_ServiceImpl implements LostPets_P001_Service{

	private LostPets_P001_Mapper mapper;

	//목록 조회
	public List<Map<String, String>> list(Criteria cri) {
		log.info("list is called at Service");
		return mapper.listWithPaging(cri);
	}
	
	public int getTotalAmount(Criteria cri) {
		return mapper.getTotalAmount(cri);
	}

	//등록
	public void write(Map<String, Object> writeMap) throws Exception{
		String dog_id = mapper.getDogId();
		writeMap.put("dog_id", dog_id);
		mapper.writeLost(writeMap);
		mapper.writeDog(writeMap);
		log.info("write");
	}
	
	//조회
	public LostPets_P001_VO view(String board_id) {
		log.info("view===========" + board_id);
		return mapper.view(board_id);
	}

	//삭제
	public boolean delete(String board_id, String dog_id) {
		log.info("delete==========" + board_id);
		
		boolean result = false;
		if(mapper.deleteDog(dog_id) == 1 && mapper.deleteLost(board_id) == 1) {
			result = true;
		}
		return result;
	}

	//수정
	public boolean modify(LostPets_P001_VO lostVO) {
		log.info("modify==========" + lostVO);
		return mapper.modifyLost(lostVO) == 1 && mapper.modifyDog(lostVO) == 1;
	}
	
}
