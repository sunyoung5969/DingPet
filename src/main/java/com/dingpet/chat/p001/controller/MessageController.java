package com.dingpet.chat.p001.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;

import com.dingpet.chat.p001.service.ChatService;
import com.dingpet.chat.p001.vo.Message;



@RestController
public class MessageController {
	@Autowired
	ChatService service;

	//Date date = new Date();
	//SimpleDateFormat form = new SimpleDateFormat("yy. MM. dd a hh:mm");
    // 채팅 메세지 전달
    @MessageMapping("/app/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Message sendChatMessage(@DestinationVariable String roomNo, Message message) throws Exception {
    	Date date = new Date();
    	SimpleDateFormat form = new SimpleDateFormat("yy. MM. dd a hh:mm");
    	System.out.println(">>>>message");
    	System.out.println(form.format(date));
    	message.setRoomName(roomNo);
    	message.setRoomno(roomNo);
    	message.setMessageType("");
        message.setChatdate(form.format(date));
        message.setSender(message.getWriter());
        System.out.println(message);
        service.saveMessage(message);
        
        return message;
    }
    
    // 방에 들어왔을 때 전달
    @MessageMapping("/app/join/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Message sendJoinChatMessage(@DestinationVariable String roomNo, Message message) throws NumberFormatException, Exception {
    	System.out.println(">>>>join");
    	
    	Date date = new Date();
    	SimpleDateFormat form = new SimpleDateFormat("yy. MM. dd a hh:mm");
    	System.out.println(form.format(date));
    	
    	message.setMessage(message.getWriter() + "님이 입장하셨습니다");
        message.setMessageType("System message"); 
        message.setChatdate(form.format(date));
        
        System.out.println("-------------------" + message.getWriter());
        return null;
    }
    	
    // 방에 나갔을 때 전달
    @MessageMapping("/app/out/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Message sendEndChatMessage(@DestinationVariable String roomNo, Message message) throws NumberFormatException, Exception {
    	System.out.println(">>>>out");
    	Date date = new Date();
    	SimpleDateFormat form = new SimpleDateFormat("yy. MM. dd a hh:mm");
    	message.setMessage(message.getWriter() + "님이 퇴장하셨습니다");
        message.setMessageType("System message");
        message.setChatdate(form.format(date));
        
        return null;
    }
    
}