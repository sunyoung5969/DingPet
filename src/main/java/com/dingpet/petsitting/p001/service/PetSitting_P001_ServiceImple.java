package com.dingpet.petsitting.p001.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dingpet.petsitting.p001.mapper.PetSitting_P001_Mapper;
import com.dingpet.petsitting.p001.vo.MultiPhotoVO;
import com.dingpet.petsitting.p001.vo.PetSitting_P001_VO;
import com.dingpet.petsitting.p004.vo.PetSitting_P004_VO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PetSitting_P001_ServiceImple implements PetSitting_P001_Service{
	
	private PetSitting_P001_Mapper mapper;
	

	@Override
	public List<PetSitting_P001_VO> profileGetList() {
		// TODO Auto-generated method stub
		return mapper.profileGetList();
	}

	@Override
	public void profileInsert(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		mapper.profileInsert(profile);
	}

	@Override
	public void licenseInsert(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		mapper.licenseInsert(profile);
	}

	@Override
	public void petServiceInsert(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		mapper.petServiceInsert(profile);
	}

	@Override
	public void closedInsert(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		mapper.closedInsert(profile);
	}

	@Override
	public PetSitting_P001_VO profileLookup(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		return mapper.profileLookup(profile);
	}

	@Override
	public List<PetSitting_P001_VO> getClosedList(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		return mapper.getClosedList(profile);
	}

	@Override
	public List<PetSitting_P001_VO> getLicenseList(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		return mapper.getLicenseList(profile);
	}

	@Override
	public List<PetSitting_P004_VO> getReview(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		return mapper.getReview(profile);
	}

	@Override
	public int getProfileIDSequence() {
		// TODO Auto-generated method stub
		return mapper.getProfileIDSequence();
	}

	@Override
	public void setMultiPhoto(MultiPhotoVO mpvo) {
		// TODO Auto-generated method stub
		mapper.setMultiPhoto(mpvo);
	}

	@Override
	public List<MultiPhotoVO> getMultiPhoto(PetSitting_P001_VO profile) {
		// TODO Auto-generated method stub
		return mapper.getMultiPhoto(profile);
	}

	

}
