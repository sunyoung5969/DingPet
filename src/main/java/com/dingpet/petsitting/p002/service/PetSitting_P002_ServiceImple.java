package com.dingpet.petsitting.p002.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.dingpet.petsitting.p002.mapper.PetSitting_P002_Mapper;
import com.dingpet.petsitting.p002.vo.KakaoPayReadyVO;
import com.dingpet.petsitting.p002.vo.PetSitting_P002_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PetSitting_P002_ServiceImple implements PetSitting_P002_Service{
	
	private PetSitting_P002_Mapper mapper;

	@Override
	public int getOrderIdSequence() {
		// TODO Auto-generated method stub
		return mapper.getOrderIdSequence();
	}

	@Override
	public void reservationInsert(PetSitting_P002_VO reserved) {
		// TODO Auto-generated method stub
		mapper.reservationInsert(reserved);
	}

	@Override
	public List<PetSitting_P002_VO> reservedSitterList(PetSitting_P002_VO vo) {
		// TODO Auto-generated method stub
		return mapper.reservedSitterList(vo);
	}

	@Override
	public List<PetSitting_P002_VO> reservedCustList(PetSitting_P002_VO vo) {
		// TODO Auto-generated method stub
		return mapper.reservedSitterList(vo);
	}

}
