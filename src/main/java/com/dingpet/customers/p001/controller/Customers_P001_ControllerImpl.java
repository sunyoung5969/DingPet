package com.dingpet.customers.p001.controller;

import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;

import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dingpet.customers.p001.service.Customers_P001_Service;
import com.dingpet.customers.p001.vo.Customers_P001_VO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@AllArgsConstructor
@Controller
@Log4j
@RequestMapping("/customers/p001/*")
public class Customers_P001_ControllerImpl implements Customers_P001_Controller {
	
	private Customers_P001_Service service;
	private JavaMailSender mailSender;
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;

	@RequestMapping(value = "/admin_board", method = {RequestMethod.GET})
	public void list(Model model) {
		log.info("펫시터 전환 신청자 목록 controller");
		log.info(service.getList());
		model.addAttribute("list", service.getList());
	}
	
	@RequestMapping(value = "/petSitterForm", method = {RequestMethod.GET})
	public void petSitterForm(@RequestParam("member_id") String member_id, Model model) {
		log.info("펫시터 신청서");
		log.info(service.readPetSitter(member_id));
		model.addAttribute("info", service.readPetSitter(member_id));
	}
	
	@RequestMapping(value = "/signin", method = {RequestMethod.GET})
	public void signin(){
		log.info("로그인 화면");
	}
	
    //로그인 처리
	@RequestMapping(value = "/signin", method = {RequestMethod.POST })
	public ModelAndView signin(Customers_P001_VO customers, RedirectAttributes rttr)
	throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		Customers_P001_VO result = service.loginCheck(customers); 
		List<Customers_P001_VO> dogResult = service.dogInfo(customers); 
		 
		if(result != null) {
			HttpSession session = request.getSession(); //세션처리
			session.setAttribute("customers", result);
			session.setAttribute("dogs", dogResult);
			session.setAttribute("isLogOn", true);

			log.info(session.getAttribute("customers"));
			log.info("로그인 성공");
			mav.setViewName("redirect:/");
			
		} else {
			log.info("로그인 실패");
			mav.setViewName("redirect:/customers/p001/signin");
			rttr.addFlashAttribute("fail", "아이디와 비밀번호가 일치하지 않습니다");
		}
		return mav;
	}
	

	
	

	//내정보조회
	@RequestMapping(value="/toMyinfo", method={RequestMethod.GET})
	public void toMyinfo() {
		log.info("정보조회를 위해 비밀번호 입력하는 페이지");
	}
	
	//내정보조회 절차
	@RequestMapping(value="/toMyinfo", method={RequestMethod.POST})
	public String toMyinfo(Customers_P001_VO pwd) {
		log.info("정보조회를 위해 비밀번호 확인");
		Customers_P001_VO a = service.readPw(pwd);
		
		if(a != null) {
			return "redirect:/customers/p001/myinfo";
		}else {
			return "redirect:/customers/p001/toMyinfo";
		}
	}
	
	//회원탈퇴 
	@RequestMapping(value="/withdraw", method={RequestMethod.POST})
	public String myinfo(Customers_P001_VO cust, RedirectAttributes rttr) {
		log.info("회원탈퇴 controller");
		log.info(service.withdraw(cust));
		
		ModelAndView mav = new ModelAndView();
		
		service.withdraw(cust);
		service.withdrawPet(cust);
		//rttr.addFlashAttribute("result", "success");
		session.removeAttribute("customers");
		session.removeAttribute("isLogOn");
		mav.setViewName("redirect:/withdraw_");
		return "redirect:/customers/p004/withdraw_";	
	}
	
	//내정보조회
	@RequestMapping(value="/myinfo", method={RequestMethod.GET})
	public void myinfo(Customers_P001_VO cust, Model model) {
		log.info("내정보페이지");
		log.info(session.getAttribute("customers"));
		log.info("사람 결과값" +service.myinfo((Customers_P001_VO)session.getAttribute("customers")));
		model.addAttribute("customers", service.myinfo((Customers_P001_VO)session.getAttribute("customers")));
	}
	
	//정보수정
	@RequestMapping(value="/myinfo", method={RequestMethod.POST})
	public String myinfo(Customers_P001_VO cust, RedirectAttributes rttr, Model model) {
		log.info("정보수정");
		log.info(service.modify(cust));
		log.info(service.modifyPet(cust));
		service.modify(cust);
		service.modifyPet(cust);
		return "redirect:/";
	}
	
	//id중복체크
	@RequestMapping("/possibleId")
	public void signin(HttpServletRequest request, HttpServletResponse response) throws IOException{
		log.info("id중복체크controller");
		PrintWriter pw = response.getWriter();
		
		String id = (String)request.getParameter("id");	
		int overlappedId = service.overlappedId(id);
		
			if(overlappedId >= 1) {
				pw.print("not_usable");
			}else {
				pw.print("usable");
			}		
	}	
	
	//email중복체크
	@RequestMapping("/possibleEmail")
	public void emailCheck(HttpServletRequest request, HttpServletResponse response) throws IOException{
		log.info("email중복체크controller");
		PrintWriter pw = response.getWriter();
		String email = (String)request.getParameter("email");	
		int overlappedEmail = service.overlappedEmail(email);
		
			if(overlappedEmail >= 1) {
				pw.print("not_usable");
			}else {
				pw.print("usable");
			}		
	}	
	
	
	
	//로그아웃
	@RequestMapping(value="/logout", method= {RequestMethod.GET})
	public ModelAndView signout(HttpServletRequest request, HttpServletResponse response) {
		log.info("로그아웃");
		session.removeAttribute("customers");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//회원가입 페이지
	@GetMapping("/signup")
	public void signup() {
		log.info("회원가입 페이지");
	}
	
	//회원가입 처리
	@RequestMapping(value="/signup", method= {RequestMethod.POST})
	public String signup(Customers_P001_VO customers, MultipartHttpServletRequest uploadFile) {
		log.info("회원가입 처리");
		log.info(customers);
		
		//---------------------------	사진 업로드 데이터 처리	---------------------------
		//String uploadFolder = "/var/lib/tomcat8/webapps/img";
		String uploadFolder = "C:\\test\\pic";
	
		String fileName = "";
		Iterator<String> files = uploadFile.getFileNames();
		
		while(files.hasNext()) {
			
			File saveFile;
			String filePath;
			String index = files.next();
			UUID profile_UUID = UUID.randomUUID();
			UUID license_UUID = UUID.randomUUID();

			MultipartFile mFile = uploadFile.getFile(index);
			fileName = mFile.getOriginalFilename();

			if(!fileName.equals("")) {
				saveFile = new File(uploadFolder, profile_UUID.toString() + "profile_" + fileName);
				filePath = saveFile.getPath();
				customers.setMember_photo(filePath); //사람 사진

				try {
					mFile.transferTo(saveFile);
				} catch (Exception e) {
					System.out.println("사진업로드 Exception " + e);
				}
			}
		}
		//---------------------------------------------------------------------------

		service.signup(customers);
		service.signupp(customers);
		service.signupPet(customers);
		
		
		//이메일 전송
		String receiver = customers.getMember_email();
		String sender ="pepupx2@gmail.com";		
		String title ="[Dingpet] 회원가입 완료";
		String content = customers.getMember_name()+"님, 환영합니다."; 
		
		try{
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper msgHelper = new MimeMessageHelper(msg, true, "UTF-8");
			msgHelper.setFrom(sender);
			msgHelper.setTo(receiver);
			msgHelper.setSubject(title);
			msgHelper.setText(content);
			
			mailSender.send(msg);

		}catch(Exception e){
			System.out.println(e);
		}
		
		return "redirect:/customers/p001/signup_";
	}	
	
	
	@RequestMapping(value="/signup_", method = {RequestMethod.GET})
	public void signup_() {
		log.info("회원가입완료 페이지");
	}
	
	//펫시터전환신청 페이지
	@PostMapping("/change")
	public void change() {
		log.info("펫시터회원 신청 페이지");
	}
	
	//펫시터전환신청 처리
	@RequestMapping(value="/apply", method = {RequestMethod.POST})
	public String change(Customers_P001_VO petMem) {
		log.info("펫시터 전환 처리");
		log.info(petMem);
		service.change(petMem);
		return "redirect:/customers/p001/sitterApplyBoard_";
	}
	
	@RequestMapping(value="/sitterApplyBoard_", method = {RequestMethod.GET})
	public void sitterApplyBoard() {
		log.info("펫시터 신청 완료 페이지");
	}
	
	@RequestMapping(value="/approval", method = {RequestMethod.POST})
	public ModelAndView approval() {
		log.info("펫시터회원 전환 - 관리자 승인 완료");
		
		ModelAndView mav = new ModelAndView();
		
		String id = request.getParameter("member_id");
		service.approval(id);
		service.approvall(id);
		mav.setViewName("redirect:/customers/p001/admin_board");
		
		return mav;
	}
	
	@RequestMapping(value="/reject", method = {RequestMethod.POST})
	public void reject() {
		log.info("펫시터회원 전환 - 관리자 승인 거절");
		String id = request.getParameter("member_id");
		log.info(id);
		service.reject(id);
	}
	
	@Override
	public void signout() {
		
	}

	@Override
	public void myinfo() {
		
	}

	@Override
	public void withdraw() {
		
	}

	@Override
	public String signin(Model model, HttpSession session) {
		return null;
	}

	
	@RequestMapping("/callback")
	public void callback(){
		log.info("네아로");
		
	}
	
	@Override
	public void readPetSitter(String id) {
		// TODO Auto-generated method stub
		
	}


}
