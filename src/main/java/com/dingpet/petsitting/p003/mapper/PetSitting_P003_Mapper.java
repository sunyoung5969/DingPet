package com.dingpet.petsitting.p003.mapper;

import java.util.List;

import com.dingpet.petsitting.p003.vo.LocationVO;
import com.dingpet.petsitting.p003.vo.PetSitting_P003_VO;

public interface PetSitting_P003_Mapper {
	
	// 일지 카운트 SELECT
	public int logCount(PetSitting_P003_VO logVO);
	
	// 일지 INSERT
	public void logInsert(PetSitting_P003_VO logVO);
	
	// 산책 데이터 저장 INSERT
	public void locationData(PetSitting_P003_VO logVO);
	
	// 산책 데이터 가져오기
	public List<LocationVO> getLocation(PetSitting_P003_VO logVO);
	
	// 로그 가져오기
	public List<PetSitting_P003_VO> getLog(PetSitting_P003_VO logVO);
	
	public int getwalk(PetSitting_P003_VO logVO);
	
	public String getmemberID(PetSitting_P003_VO logVO);
}
