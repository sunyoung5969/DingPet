package com.dingpet.customers.p004.service;

import org.springframework.stereotype.Service;

import com.dingpet.customers.p004.mapper.Customers_P004_Mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class Customers_P004_ServiceImple implements Customers_P004_Service{
	
	private Customers_P004_Mapper mapper;
	
}
