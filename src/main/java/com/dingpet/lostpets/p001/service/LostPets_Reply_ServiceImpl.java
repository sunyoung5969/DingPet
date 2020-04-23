package com.dingpet.lostpets.p001.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.lostpets.p001.mapper.LostPets_Reply_Mapper;
import com.dingpet.lostpets.p001.vo.Criteria;
import com.dingpet.lostpets.p001.vo.LostPets_Reply_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LostPets_Reply_ServiceImpl implements LostPets_Reply_Service {

	private LostPets_Reply_Mapper mapper;
	
	public int write(LostPets_Reply_VO reply_vo) {
		log.info("writing reply");
		return mapper.write(reply_vo);
	}

	public LostPets_Reply_VO view(String reply_id) {
		log.info("viewing reply");
		return mapper.view(reply_id);
	}

	public int delete(String reply_id) {
		log.info("deleting reply");
		return mapper.delete(reply_id);
	}

	public int modify(LostPets_Reply_VO reply_vo) {
		log.info("modifying reply");
		return mapper.modify(reply_vo);
	}

	public List<LostPets_Reply_VO> list(Criteria cri, String site_id) {
		log.info("listing replies");
		return mapper.list(cri, site_id);
	}

}
