package com.dingpet.customers.p003.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p003.mapper.Customers_P003_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class Customers_P003_ServiceImple implements Customers_P003_Service{
	
	private Customers_P003_Mapper mapper;
	
}
