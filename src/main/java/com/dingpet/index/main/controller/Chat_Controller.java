package com.dingpet.index.main.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/chat/*")
@AllArgsConstructor
@Log4j
@Controller
public class Chat_Controller {
	
	// 시설지도 페이지
	@RequestMapping(value="/chatpage", method = {RequestMethod.GET})
	public String chatpage(Model model) {
		log.info("chat page~~");
		return "chatpage";
	}

}
