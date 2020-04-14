package com.dingpet.customers.p002.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p002.mapper.Customers_P002_Mapper;
import com.dingpet.customers.p002.vo.Customers_P002_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Customers_P002_ServiceImple implements Customers_P002_Service{
	
	private Customers_P002_Mapper mapper;
	
	public Customers_P002_VO lostId(Customers_P002_VO id) {
		log.info("아이디찾기 service");
		return mapper.lostId(id);
	}
	
	public Customers_P002_VO lostPwd(Customers_P002_VO pwd) {
		log.info("비번찾기 service");
		return mapper.lostId(pwd);
	}

}
