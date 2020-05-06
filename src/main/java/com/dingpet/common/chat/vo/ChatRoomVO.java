package com.dingpet.common.chat.vo;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import lombok.Builder;
import lombok.Data;

@Data
public class ChatRoomVO {

	private String roomId;
    private String name;
    private Set<WebSocketSession> sessions = new HashSet<>();
    @Builder
    public ChatRoomVO(String roomId, String name) {
        this.roomId = roomId;
        this.name = name;
    }
//    public void handleActions(WebSocketSession session, ChatMessageVO chatMessage, ChatService chatService) {
//        if (chatMessage.getType().equals(ChatMessageVO.MessageType.ENTER)) {
//            sessions.add(session);
//            chatMessage.setMessage(chatMessage.getSender() + "님이 입장했습니다.");
//        }
//        sendMessage(chatMessage, chatService);
//    }
//    public <T> void sendMessage(T message, ChatService chatService) {
//        sessions.parallelStream().forEach(session -> chatService.sendMessage(session, message));
//    }
	
	
}
