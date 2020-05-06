package com.dingpet.common.chat.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;

import com.dingpet.common.chat.vo.Message;



@RestController
public class MessageController {
	
	
    // 채팅 메세지 전달
    @MessageMapping("/app/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Message sendChatMessage(@DestinationVariable String roomNo, Message message, Principal principal) {
    	System.out.println(">>>>message");
    	
    	message.setMessageType("");
        message.setChatdate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 a h시 m분")));
        
        return message;
    }
    
    // 방에 들어왔을 때 전달
    @MessageMapping("/app/join/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Message sendJoinChatMessage(@DestinationVariable String roomNo, Message message,Principal prin) throws NumberFormatException, Exception {
    	System.out.println(">>>>join");
    	
    	message.setMessage(message.getWriter() + "님이 입장하셨습니다");
        message.setMessageType("System message"); 
        message.setChatdate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 a h시 m분")));
        //message.setMemberList(service.getUserList(Integer.parseInt(roomNo)));
        
        System.out.println("-------------------" + message.getMemberList());
        return message;
    }
    	
    // 방에 나갔을 때 전달
    @MessageMapping("/app/out/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Message sendEndChatMessage(@DestinationVariable String roomNo, Message message) throws NumberFormatException, Exception {
    	System.out.println(">>>>out");
    	
    	message.setMessage(message.getWriter() + "님이 퇴장하셨습니다");
        message.setMessageType("System message");
        message.setChatdate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 a h시 m분")));
        //message.setMemberList(service.getUserList(Integer.parseInt(roomNo)));
        
        return message;
    }
    
}