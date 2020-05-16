package com.dingpet.lostpets.p003.mapper;

import java.util.List;

import com.dingpet.lostpets.p001.vo.LostPets_P001_VO;
import com.dingpet.lostpets.p003.vo.LostPets_P003_VO;

public interface LostPets_P003_Mapper {

	//받은 요청
	public List<LostPets_P001_VO> myList(String member_id);
	public List<LostPets_P001_VO> requestFrom(String member_id);
	
	//보낸 요청
	public List<LostPets_P001_VO> myRequest(String member_id);
	public List<LostPets_P001_VO> requestTo(String member_id);
	
	//완료 후기 등록
	public void write(LostPets_P003_VO vo);
	public int confirmRequest(LostPets_P003_VO vo);
	public int complete_lost(LostPets_P003_VO vo);
	public int complete_find(LostPets_P003_VO vo);
}
