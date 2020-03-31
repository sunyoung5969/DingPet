package com.dingpet.customers.p002.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p002.mapper.Customers_P002_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class Customers_P002_ServiceImple implements Customers_P002_Service{
	
	private Customers_P002_Mapper mapper;
	
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return mapper.getTotal();
	}

}
