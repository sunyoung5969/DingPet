package com.dingpet.petsitting.p003.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p003.mapper.PetSitting_P003_Mapper;
import com.dingpet.petsitting.p003.vo.LocationVO;
import com.dingpet.petsitting.p003.vo.PetSitting_P003_VO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P003_ServiceImple implements PetSitting_P003_Service{
	
	private PetSitting_P003_Mapper mapper;

	@Override
	public int logCount(PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		return mapper.logCount(logVO);
	}
	
	@Override
	public void locationData(PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		mapper.locationData(logVO);
	}

	@Override
	public void logInsert(PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		mapper.logInsert(logVO);
	}

	@Override
	public List<LocationVO> getLocation(PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		return mapper.getLocation(logVO);
	}

	@Override
	public List<PetSitting_P003_VO> getLog(PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		return mapper.getLog(logVO);
	}

	@Override
	public int getwalk(PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		return mapper.getwalk(logVO);
	}

	@Override
	public String getmemberID(PetSitting_P003_VO logVO) {
		// TODO Auto-generated method stub
		return mapper.getmemberID(logVO);
	}


}
