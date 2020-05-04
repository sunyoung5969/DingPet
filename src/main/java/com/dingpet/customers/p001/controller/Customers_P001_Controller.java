package com.dingpet.customers.p001.controller;

import com.dingpet.customers.p001.vo.Customers_P001_VO;

public interface Customers_P001_Controller {
	
	public void toMyinfo(); //내정보조회
	public void myinfo(); //내정보조회
	public void signin(); //로그인
	public void signout(); //로그아웃
	public void signup(); //회원가입
	public void change(); //펫시터전환
	public void withdraw(); //탈퇴
	public void signup_(); //회원가입 완료
	
}
