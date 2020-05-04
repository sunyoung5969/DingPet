package com.dingpet.customers.p001.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	HttpServletRequest request;
	HttpSession session;
		
	//회원탈퇴
	@RequestMapping(value="/withdraw", method={RequestMethod.POST})
	public String myinfo(Customers_P001_VO cust, RedirectAttributes rttr) {
		log.info("회원탈퇴");
		log.info(service.withdraw(cust));
		
		ModelAndView mav = new ModelAndView();
		
		service.withdraw(cust);
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
		log.info("결과값" +service.myinfo((Customers_P001_VO)session.getAttribute("customers")));
		model.addAttribute("customers", service.myinfo((Customers_P001_VO)session.getAttribute("customers")));
	}
	
	//정보수정
	@RequestMapping(value="/myinfo", method={RequestMethod.POST})
	public String myinfo(Customers_P001_VO cust, RedirectAttributes rttr, Model model) {
		log.info("내정보수정");
		log.info(service.modify(cust));
		if(service.modify(cust)) {
			//rttr.addFlashAttribute("result", "success");
			
		}
			//model.addAttribute("customers", service.myinfo(cust));

		return "redirect:/";
	}
	
	//ID중복체크
	@RequestMapping(value="/mem", method = {RequestMethod.POST})
	public void signin(HttpServletRequest request, HttpServletResponse response) throws IOException{
		log.info("id중복체크");
		PrintWriter pw = response.getWriter();
		String id = (String)request.getParameter("id");	
		int overlappedId = service.overlappedId(id);
			if(overlappedId >= 1) {
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
	
	
	//로그인 페이지
	@RequestMapping(value="/signin", method = {RequestMethod.GET})
	public void signin() {
		log.info("로그인 페이지 출력");
	}
	
	//로그인 처리
	@RequestMapping(value="/signin", method = {RequestMethod.POST})
	public ModelAndView signin(@ModelAttribute("customers") Customers_P001_VO customers,
			HttpServletRequest request, HttpServletResponse response)  {
		log.info("로그인 처리");	
		ModelAndView mav = new ModelAndView();
		Customers_P001_VO result = service.loginCheck(customers); //result에는 member_id, member_pwd, member_name, member_nickname, member_email가 담김
				
		if(result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("customers", result);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/");
			log.info("로그인 성공");
			
		}else {
			mav.setViewName("redirect:/customers/p001/signin");
			log.info("로그인 실패");
		}
		
		return mav;
	}
	
	
	//회원가입 페이지
	@GetMapping("/signup")
	public void signup() {
		log.info("회원가입 페이지");
	}
	
	//회원가입 처리
	@PostMapping("/signup")
	public String signup(Customers_P001_VO customers, MultipartHttpServletRequest uploadFile) {
		log.info("회원가입 처리");
		log.info(customers);
		
		//---------------------------	사진 업로드 데이터 처리	---------------------------
		
		String uploadFolder = "/var/lib/tomcat8/webapps/img";
		//String uploadFolder = "C:\\test\\pic";
		
		
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
				customers.setMember_photo(filePath);

				try {
					mFile.transferTo(saveFile);
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("사진업로드 Exception " + e);
				}
			}
		}

//---------------------------------------------------------------------------

		service.signup(customers);

		
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
	public String change(Customers_P001_VO petMem, Model model) {
		log.info("펫시터회원처리");
		service.change(petMem);
		return "redirect:/";
	}
	
	
	@Override
	public void signout() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void myinfo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void withdraw() {
		// TODO Auto-generated method stub
		
	}








}
