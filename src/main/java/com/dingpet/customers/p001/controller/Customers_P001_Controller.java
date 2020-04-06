package com.dingpet.customers.p001.controller;

import org.springframework.ui.Model;

public interface Customers_P001_Controller {
	
	public void signin(Model model);
	public void signup(Model model);
	public void change(Model model);
	
	//샘플페이지 시작
	public void signin_f();
	public void signup_f();
}
