package com.dingpet.customers.p003.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p003.mapper.Customers_P003_Mapper;
import com.dingpet.customers.p003.vo.Customers_P003_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Customers_P003_ServiceImple implements Customers_P003_Service{
	
	private Customers_P003_Mapper mapper;
	
	public void infoupdate(Customers_P003_VO customers) {
		log.info("일반회원 정보 수정 처리");
		mapper.update1(customers);
	}
	
	
	public void petsitterupdate(Customers_P003_VO customers) {
		log.info("펫시터회원 정보 수정 처리");
		mapper.update2(customers);
	}
	
}
