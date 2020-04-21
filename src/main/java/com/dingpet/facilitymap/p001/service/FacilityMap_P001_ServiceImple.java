package com.dingpet.facilitymap.p001.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dingpet.facilitymap.p001.dto.PlaceDTO;
import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_AttachMapper;
import com.dingpet.facilitymap.p001.mapper.FacilityMap_P001_Mapper;
import com.dingpet.facilitymap.p001.vo.FacilityMap_AttachVO;
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
	@Autowired
	private FacilityMap_P001_AttachMapper attachMapper;
	
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
	public int getSeq() {
		// TODO Auto-generated method stub
		return mapper.getseq();
	}
	
	@Transactional
	@Override
	public void register(FacilityMap_P001_VO vo) {
		log.info("register....");
		// ------- 시퀀스 url 삽입 --------------
		int sitesq = mapper.getseq();
		log.info(vo.getSitesq());
		log.info(sitesq);
		String url = vo.getPlace_url()+sitesq;
		vo.setSite_id(sitesq);
		vo.setPlace_url(url);
		// -------===============--------------
		mapper.registerPlace(vo);
		log.info("Insert End...:"+vo);
		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}

		vo.getAttachList().forEach(attach -> {
			attach.setSite_id(vo.getSite_id());
			attachMapper.insert(attach);
		});
	}
	
	@Override
	public List<FacilityMap_AttachVO> getAttachList(int site_id) {

		log.info("get Attach list by site_id : " + site_id);

		return attachMapper.findBySiteno(site_id);
	}

	@Override
	public void removeAttach(int site_id) {

		log.info("remove all attach files : ");

		attachMapper.deleteAll(site_id);
	}
	
}
