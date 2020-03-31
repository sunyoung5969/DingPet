package com.dingpet.customers.p003.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p003.mapper.CustomersP003Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CustomersP003ServiceImple implements CustomersP003Service{
	
	private CustomersP003Mapper mapper;
	
}
