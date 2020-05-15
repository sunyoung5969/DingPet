package com.dingpet.customers.p004.controller;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface Customers_P004_Controller {

	public String withdraw(String member_id, RedirectAttributes rttr);
	
	public void withdraw_(); //회원탈퇴 완료
}
