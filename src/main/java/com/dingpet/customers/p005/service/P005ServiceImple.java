package com.dingpet.customers.p005.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p005.mapper.P005Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class P005ServiceImple implements P005Service{
	
	private P005Mapper mapper;
	
}
