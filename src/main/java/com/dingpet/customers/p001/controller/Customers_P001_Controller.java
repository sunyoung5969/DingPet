package com.dingpet.customers.p001.controller;


import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.dingpet.customers.p001.vo.Customers_P001_VO;


public interface Customers_P001_Controller {
	
	public void toMyinfo(); //내정보조회
	public void myinfo(Customers_P001_VO cust, Model model); //내정보조회
	public void readPetSitter(String id); //펫시터 신청서 조회
	public String signin(Model model, HttpSession session); //로그인
	public void signout(); //로그아웃
	public void signup(); //회원가입
	public void change(); //펫시터전환
	public void withdraw(); //탈퇴
	public void signup_(); //회원가입 완료
	public void sitterApplyBoard(); //펫시터 신청 게시판
	
}
