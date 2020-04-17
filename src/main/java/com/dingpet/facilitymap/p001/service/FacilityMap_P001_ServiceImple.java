package com.dingpet.facilitymap.p001.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_Mapper;
import com.dingpet.facilitymap.p001.vo.FacilityMap_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class FacilityMap_P001_ServiceImple implements FacilityMap_P001_Service {
	
	@Autowired
	private FacilityMap_P001_Mapper mapper;
	
	@Override
	public List<FacilityMap_P001_VO> getMediMap(PlaceDTO dto) {
		// 동물병원 맵 마킹
		return mapper.meditest(dto);
	}
	
	@Override
	public List<FacilityMap_P001_VO> getMediMap2(PlaceDTO dto) {
		// 약국 맵 마킹
		return mapper.medicenterSearch(dto);
	}
	
	@Override
	public FacilityMap_P001_VO getMediCenter(int num) {
		// TODO Auto-generated method stub
		return mapper.readcenter(num);
	}
	
	
	@Override
	public void register(FacilityMap_P001_VO vo) {
		log.info("register...."+vo);
		
		//mapper.insertSelectKey(vo);

//		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
//			return;
//		}
//
//		vo.getAttachList().forEach(attach -> {
//
//			attach.setBno(board.getBno());
//			attachMapper.insert(attach);
//		});
	}
	
}
