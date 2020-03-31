package com.dingpet.customers.p005.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p005.mapper.CustomersP005Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CustomersP005ServiceImple implements CustomersP005Service{
	
	private CustomersP005Mapper mapper;
	
}
