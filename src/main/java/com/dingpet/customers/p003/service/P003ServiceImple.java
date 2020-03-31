package com.dingpet.customers.p003.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p003.mapper.P003Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class P003ServiceImple implements P003Service{
	
	private P003Mapper mapper;
	
}
