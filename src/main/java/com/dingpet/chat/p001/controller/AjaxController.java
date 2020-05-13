package com.dingpet.chat.p001.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dingpet.chat.p001.service.AjaxService;
import com.dingpet.chat.p001.service.ChatService;

@RestController
public class AjaxController {
		
		@Autowired
		AjaxService service;
		
		@Autowired
		ChatService chatService;
		
		private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
		
	   @RequestMapping(value= "/checkPersonnel", method = RequestMethod.GET)
	   public int getPersonnel(@RequestParam("roomNo")int roomNo) throws Exception {
	
	      String members = chatService.getMembers(roomNo);
	      
	      // 멤버 인원수 구하기
	      if(members == null) {
	    	  System.out.println("멤버가 널");
	      }
	      
	      return 1;
	   }
		
	 @RequestMapping(value = "/memberOut", method = RequestMethod.GET)
	   public @ResponseBody int memberOut(@RequestParam("userId") String userId, 
			   									@RequestParam("roomNo")int roomNo) throws Exception {
		 int data = chatService.removeMember(roomNo, userId); 
		 // 멤버 제거후 방까지 제거되면 return 1 , else return -1
		 
		 return data;
	 }

	 @RequestMapping(value = "/updatePw", method = RequestMethod.GET)
	 public int updatePw(int roomNo, String newPass) throws Exception {
	  
		   
	      return  service.removeRoom(roomNo, newPass);
	  } 
 
}
