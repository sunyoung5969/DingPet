package com.dingpet.customers.p005.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p005.mapper.CustomersP005Mapper;
import com.dingpet.customers.p005.vo.CustomersP005VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CustomersP005ServiceImple implements CustomersP005Service{
	
	private CustomersP005Mapper mapper;
	
	public CustomersP005VO inbox(String member_id) {
		log.info("메세지함service");
		return mapper.inbox(member_id);
	}
	
}
