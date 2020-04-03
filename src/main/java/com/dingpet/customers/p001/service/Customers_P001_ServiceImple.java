package com.dingpet.customers.p001.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.customers.p001.mapper.Customers_P001_Mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class Customers_P001_ServiceImple implements Customers_P001_Service{
	
	@Setter(onMethod_ = @Autowired)
	private Customers_P001_Mapper mapper;
	
	@Override
	public int getTotal() {
		return mapper.getTotal();
	}
	
}
