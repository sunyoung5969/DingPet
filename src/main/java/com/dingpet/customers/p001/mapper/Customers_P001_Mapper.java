package com.dingpet.customers.p001.mapper;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Mapper {
	
	//일반회원 등록
	public void insert1(Customers_P001_VO customers);
	public void insertPet(Customers_P001_VO customers);
		
	//펫시터회원 등록
	public void insert2(Customers_P001_VO customers);

	//로그인 
	public Customers_P001_VO loginCheck(Customers_P001_VO customers);
	
	//id중복체크
	public int overlappedId(String id);
	
	//내정보 조회
	public Customers_P001_VO read(Customers_P001_VO cust);
	public int readPw(Customers_P001_VO cust);
	
	//정보수정
	public boolean update(Customers_P001_VO cust);
	
	//탈퇴
	public boolean delete(Customers_P001_VO id);

}
