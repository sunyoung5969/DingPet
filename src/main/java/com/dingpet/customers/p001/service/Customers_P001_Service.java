package com.dingpet.customers.p001.service;


import java.util.List;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Service {
	
	// 펫시터전환 관리자 승인여부 
	public void approval(String id);
	public void approvall(String id);
	public void reject(String id);
	
	//펫시터 신청자 목록
	public List<Customers_P001_VO> getList();
	
	//일반회원 등록
	public void signup(Customers_P001_VO customers);
	public void signupp(Customers_P001_VO customers);
	public void signupPet(Customers_P001_VO customers);
	
	//펫시터회원 등록
	public void change(Customers_P001_VO customers);

	//로그인
	public Customers_P001_VO loginCheck(Customers_P001_VO customers);
	public String readPrivNo(Customers_P001_VO privNo) ;

	
	//id중복체크
	public int overlappedId(String id);
	public int overlappedEmail(String email);
	
	//내정보 조회
	public Customers_P001_VO myinfo(Customers_P001_VO cust);
	public List<Customers_P001_VO> dogInfo(Customers_P001_VO cust);
	public String readPw(Customers_P001_VO cust);
	
	//펫시터회원 정보조회
	public Customers_P001_VO readPetSitter(String id);
		
	//정보수정
	public boolean modify(Customers_P001_VO cust);
	public boolean modifyPet(Customers_P001_VO cust);
	
	//탈퇴
	public boolean withdraw(Customers_P001_VO id);
	public boolean withdrawPet(Customers_P001_VO id);
	public boolean withdraww(Customers_P001_VO id) ;

}
