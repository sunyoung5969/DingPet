package com.dingpet.customers.p001.service;

import java.util.List;

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
	
	// 펫시터전환 관리자 승인여부 
	public void approval(String id) {
		log.info("펫시터전환 관리자 승인 service");
		mapper.approval(id);
	}
	public void approvall(String id) {
		log.info("펫시터전환 관리자 승인 service!");
		mapper.approvall(id);
	}
	public void reject(String id) {
		log.info("펫시터전환 관리자 거절 service");
		mapper.reject(id);
	}
	
	//펫시터회원 정보조회
	public Customers_P001_VO readPetSitter(String id) {
		log.info("펫시터 신청서 조회");
		return mapper.readPetSitter(id);
	}
		
	//펫시터 신청자 목록
	public List<Customers_P001_VO> getList(){
		log.info("펫시터 신청자 목록 service");
		return mapper.getList();
	}
	
	public boolean withdraw(Customers_P001_VO id) {
		log.info("회원탈퇴service");
		return mapper.delete(id);
	}
	public boolean withdraww(Customers_P001_VO id) {
		log.info("회원탈퇴service");
		return mapper.delete1(id);
	}
	public boolean withdrawPet(Customers_P001_VO id) {
		log.info("반려견탈퇴service");
		return mapper.deletePet(id);
	}
	
	public boolean modify(Customers_P001_VO cust) {
		log.info("내정보수정service");
		return mapper.update(cust);
	}
	public boolean modifyPet(Customers_P001_VO cust) {
		log.info("애견정보수정service");
		return mapper.updatePet(cust);
	}
	
	
	//내정보 조회
	public Customers_P001_VO myinfo(Customers_P001_VO cust) {
		log.info("내정보조회service");
		return mapper.read(cust);
	}
	
	public List<Customers_P001_VO> dogInfo(Customers_P001_VO cust) {
		log.info("강아지 정보 service");
		return mapper.dogInfo(cust);
	}
	
	public String readPw(Customers_P001_VO cust) {
		log.info("정보조회를 위한 비밀번호 입력 처리 service");
		return mapper.readPw(cust);
	}
	
	public void signup(Customers_P001_VO customers) {
		log.info("회원가입 서비스계층");
		mapper.insert1(customers);
	}
	public void signupp(Customers_P001_VO customers) {
		log.info("회원가입 서비스계층");
		mapper.insert11(customers);
	}
	public void signupPet(Customers_P001_VO customers) {
		log.info("반려견 정보 등록 service");
		mapper.insertPet(customers);
	}
	
	public void change(Customers_P001_VO customers) {
		log.info("펫시터회원 전환 service");
		mapper.insert2(customers);
	}
	
	//로그인
	public Customers_P001_VO loginCheck(Customers_P001_VO customers) {
		return mapper.loginCheck(customers);
	}
	//관리자 권한 부여
	public String readPrivNo(Customers_P001_VO privNo) {
		return mapper.readPrivNo(privNo);
	}
	//id중복체크
	public int overlappedId(String id) {
		log.info("id중복체크 service");
		return mapper.overlappedId(id);
	}
	
	public int overlappedEmail(String email) {
		log.info("email중복체크 service");
		return mapper.overlappedEmail(email);
	}

}
