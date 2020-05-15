package com.dingpet.customers.p001.mapper;

import java.util.List;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Mapper {
	
	//펫시터전환 관리자 승인여부
	public void approval(String id);
	public void approvall(String id);
	public void reject(String id);
	
	//펫시터 신청자 목록
	public List<Customers_P001_VO> getList();
	
	//일반회원 등록
	public void insert1(Customers_P001_VO customers);
	public void insert11(Customers_P001_VO customers);
	public void insertPet(Customers_P001_VO customers);
		
	//펫시터회원 등록
	public void insert2(Customers_P001_VO customers);

	//로그인 
	public Customers_P001_VO loginCheck(Customers_P001_VO customers);
	public String readPrivNo(Customers_P001_VO privNo);
	
	//id중복체크
	public int overlappedId(String id);
	public int overlappedEmail(String email);
	
	//일반회원 정보조회
	public Customers_P001_VO read(Customers_P001_VO cust);
	public List<Customers_P001_VO> dogInfo(Customers_P001_VO cust);
	public String readPw(Customers_P001_VO cust);
	
	//펫시터회원 정보조회
	public Customers_P001_VO readPetSitter(String id);
	
	//정보수정
	public boolean update(Customers_P001_VO cust);
	public boolean updatePet(Customers_P001_VO cust);
	
	//탈퇴
	public boolean delete(Customers_P001_VO id);
	public boolean delete1(Customers_P001_VO id);
	public boolean deletePet(Customers_P001_VO id);

}
