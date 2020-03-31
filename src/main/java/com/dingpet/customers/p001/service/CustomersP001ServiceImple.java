package com.dingpet.customers.p001.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.customers.p001.mapper.CustomersP001Mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class CustomersP001ServiceImple implements CustomersP001Service{
	
	@Setter(onMethod_ = @Autowired)
	private CustomersP001Mapper mapper;
	
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return mapper.getTotal();
	}
	
}
