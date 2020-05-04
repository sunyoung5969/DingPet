package com.dingpet.customers.p001.service;

import javax.servlet.http.HttpSession;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Service {
	
	//일반회원 등록
	public void signup(Customers_P001_VO customers);
	
	//펫시터회원 등록
	public void change(Customers_P001_VO customers);

	//로그인
	public Customers_P001_VO loginCheck(Customers_P001_VO customers);

	//id중복체크
	public int overlappedId(String id);
	
	//내정보 조회
	public Customers_P001_VO myinfo(Customers_P001_VO cust);
	
	//정보수정
	public boolean modify(Customers_P001_VO cust);
	
	public boolean withdraw(Customers_P001_VO id);
}
