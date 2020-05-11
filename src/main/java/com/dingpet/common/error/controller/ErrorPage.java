package com.dingpet.common.error.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/error/*")
@Controller
public class ErrorPage {

	@RequestMapping("errorpage")
	public void errorPage() {
		
	}
}
