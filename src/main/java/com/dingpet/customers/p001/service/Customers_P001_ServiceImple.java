package com.dingpet.customers.p001.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p001.mapper.Customers_P001_Mapper;
import com.dingpet.customers.p001.vo.Customers_P001_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class Customers_P001_ServiceImple implements Customers_P001_Service{
	
	private Customers_P001_Mapper mapper;
	
	@Override
	public boolean withdraw(Customers_P001_VO id) {
		log.info("회원탈퇴service");
		return mapper.delete(id);
	}
	
	@Override
	public boolean modify(Customers_P001_VO cust) {
		log.info("내정보수정service");
		return mapper.update(cust);
	}
	
	//내정보 조회
	@Override
	public Customers_P001_VO myinfo(Customers_P001_VO cust) {
		log.info("내정보조회service");
		return mapper.read(cust);
	}
	
	@Override
	public int readPw(Customers_P001_VO cust) {
		log.info("정보조회를 위한 비밀번호 입력 처리 service");
		return mapper.readPw(cust);
	}
	
	@Override
	public void signup(Customers_P001_VO customers) {
		log.info("회원가입 서비스계층");
		mapper.insert1(customers);
	}
	@Override
	public void signupPet(Customers_P001_VO customers) {
		log.info("반려견 정보 등록 service");
		mapper.insertPet(customers);
	}
	
	@Override
	public void change(Customers_P001_VO customers) {
		log.info("펫시터회원 가입 서비스계층");
		mapper.insert2(customers);
	}
	
	//로그인
	@Override
	public Customers_P001_VO loginCheck(Customers_P001_VO customers) {
		return mapper.loginCheck(customers);
		
	}
	
	//id중복체크
	@Override
	public int overlappedId(String id) {
		log.info("id중복체크 service");
		return mapper.overlappedId(id);
	}

}
