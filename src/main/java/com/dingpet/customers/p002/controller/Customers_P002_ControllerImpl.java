package com.dingpet.customers.p002.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.customers.p002.service.Customers_P002_Service;
import com.dingpet.customers.p002.vo.Customers_P002_VO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/customers/p002/*")
@AllArgsConstructor
@Controller
public class Customers_P002_ControllerImpl implements Customers_P002_Controller {

	private Customers_P002_Service service;
	
	private JavaMailSender mailSender;
	
	//아이디 찾기 처리
	@RequestMapping(value="/lostid", method={RequestMethod.POST})
	public ModelAndView lostid(Model model, HttpServletRequest request, HttpServletResponse response) throws
				ServletException, IOException{
	
	ModelAndView mav = new ModelAndView();

	String email = request.getParameter("member_email");
	String id = service.lostId(email);

	//입력한 이메일과 동한 아이디가 있으면 이메일로 전송
	if(id != null){
		System.out.println("아이디 찾음");
		model.addAttribute("yesID", "이메일로 아이디가 전송되었어요");
		
		String setfrom ="pepupx2@gmail.com";		
		String title ="Dingpet 아이디";
		String content = "귀하의 아이디는\""+id+"\"입니다";

		try{
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(email);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);

		}catch(Exception e){
			System.out.println(e);
		}
		
		
	}
	//입력한 이메일이 존재하지 않으면 "일치하는 아이디가 없어요" 화면출력	
	else{
		System.out.println("아이디 없음");
		model.addAttribute("noID", "일치하는 아이디가 없어요");
	}
	
	mav.setViewName("customers/p002/lostid");
	return mav;
	}
	
	@RequestMapping(value="/lostid", method = {RequestMethod.GET})
	public void lostid() {
		System.out.println("아이디찾기 페이지");
	}
	
	/*
	//아이디 찾기
	@RequestMapping(value="/lostid", method = {RequestMethod.POST})
	public ModelAndView lostid(Model model, HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		System.out.println("아이디찾기 controller");
		
		ModelAndView mav = new ModelAndView();
		
		String id = request.getParameter("member_email");
		System.out.println(id);
		
		String _id = service.lostId(id);
		System.out.println(_id);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		if(_id != null) {
			System.out.println("아이디 찾았다!"); 
			model.addAttribute("_id", "아이디 찾았어요!"+ "<br>" + _id);
		}else {
			System.out.println("일치하는 아이디 없음"); 
			model.addAttribute("noID","일치하는 아이디가 없어요");
		}	
		mav.setViewName("customers/p002/lostid");
		return mav;
	}
	 */

	
	
	
	
	@RequestMapping(value="/lostpwd", method = {RequestMethod.GET})
	public void lostpwd() {
	System.out.println("비밀번호찾기 페이지");
	}
	
	
	//비밀번호 찾기
	@RequestMapping(value="/lostpwd", method = {RequestMethod.POST})
	public ModelAndView lostpwd(Customers_P002_VO vo, HttpServletRequest request, HttpServletResponse response) 
	throws Exception{
		
		System.out.println("비밀번호찾기 controller");
	
		ModelAndView mav = new ModelAndView();
		
		System.out.println(service.lostPwd(vo));
		
		String ohyes = service.lostPwd(vo);
		
		if(ohyes != null) {
			System.out.println("비밀번호도 찾았다!!");
			mav.addObject("yespw", ohyes);
		}else {
			System.out.println("일치하는 비밀번호 없음");
			mav.addObject("nopw", "일치하는 비밀번호를 찾을 수 없어요");
			
		}
			
		return mav; 
	}
	
	
	
	@RequestMapping("/checkid")
	@Override
	public void checkid() {
		System.out.println("아이디 확인");
	}
	

	@RequestMapping("/changepwd")
	@Override
	public void changepwd() {
		System.out.println("비밀번호를 변경할래요");
		
	}


}
