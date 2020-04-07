package com.dingpet.customers.p001.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.customers.p001.mapper.Customers_P001_Mapper;
import com.dingpet.customers.p001.vo.Customers_P001_VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class Customers_P001_ServiceImple implements Customers_P001_Service{
	
	private Customers_P001_Mapper mapper;
	
	@Override
	public void register1(Customers_P001_VO cust) {
		mapper.insert1(cust);
		log.info("일반회원 가입");
	}
	
	
	//@Override
	//public void register2(Customers_P001_VO cust) {
		//	mapper.insert2(cust);
		//	log.info("펫시터회원 가입");
		//}	
	

	@Override
	public void insertmember(Customers_P001_VO member) {
		
		mapper.insertmember(member);
		log.info("등록");
		
	}



	
	
	
	

}
