package com.dingpet.customers.p004.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p004.mapper.CustomersP004Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CustomersP004ServiceImple implements CustomersP004Service{
	
	private CustomersP004Mapper mapper;
	
}
