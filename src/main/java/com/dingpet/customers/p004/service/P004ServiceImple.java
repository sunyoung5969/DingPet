package com.dingpet.customers.p004.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p004.mapper.P004Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class P004ServiceImple implements P004Service{
	
	private P004Mapper mapper;
	
}
