package com.dingpet.common.chat.service;


import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.common.chat.mapper.ChatMapper;

@Service
public class AjaxService {
	
	@Autowired
	ChatMapper chatdao;
	
	public String getOwner(int roomNo) throws Exception {
		return chatdao.getOwner(roomNo);
	}


	 public String getUserList(int roomNo) throws Exception {
		 	
		 	String list = "";
		 
		    String members = chatdao.getMembers(roomNo); // 챗룸에 남아있는 멤버들
	
		    if (members.startsWith(",")) {
		       members = members.replaceFirst(",", "");		       
		    }
		    
		    String[] users = members.split(",");
		    
		    for (int i = 0; i < users.length; i++) {
		    	
		      // list += userdao.getUser(users[i]).getUserName() + ",";
		    }
		    
		    return list;
	 }
			

}
