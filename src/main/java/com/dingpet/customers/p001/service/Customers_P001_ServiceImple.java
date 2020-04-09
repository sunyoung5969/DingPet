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
	
	
	public void signup(Customers_P001_VO customers) {
		log.info("회원가입 서비스계층");
		mapper.insert1(customers);
	}
	
	public void change(Customers_P001_VO customers) {
		log.info("펫시터회원 가입 서비스계층");
		mapper.insert2(customers);
		
	}

	
}
