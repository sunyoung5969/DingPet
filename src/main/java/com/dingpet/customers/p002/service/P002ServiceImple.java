package com.dingpet.customers.p002.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p002.mapper.P002Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class P002ServiceImple implements P002Service{
	
	private P002Mapper mapper;
	
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return mapper.getTotal();
	}

}
