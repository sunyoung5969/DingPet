package com.dingpet.customers.p002.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p002.mapper.CustomersP002Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CustomersP002ServiceImple implements CustomersP002Service{
	
	private CustomersP002Mapper mapper;
	
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return mapper.getTotal();
	}

}
