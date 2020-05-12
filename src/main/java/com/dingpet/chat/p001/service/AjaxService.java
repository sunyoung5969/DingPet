package com.dingpet.chat.p001.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.chat.p001.mapper.ChatMapper;


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
	
		    return list;
	 }

	public int removeRoom(int roomNo, String member) throws Exception {
		return chatdao.removeRoom(roomNo); // 방 삭제
	}

}
