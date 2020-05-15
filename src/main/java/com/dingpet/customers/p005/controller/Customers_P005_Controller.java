package com.dingpet.customers.p005.controller;

import org.springframework.ui.Model;

import com.dingpet.customers.p005.vo.CustomersP005VO;

public interface Customers_P005_Controller {

	//public void message(Model model);
	
	public CustomersP005VO inbox(String member_id);
}
