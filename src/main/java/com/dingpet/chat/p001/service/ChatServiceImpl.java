package com.dingpet.chat.p001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.chat.p001.mapper.ChatMapper;
import com.dingpet.chat.p001.vo.ChatRoom;
import com.dingpet.chat.p001.vo.Criteria;
import com.dingpet.chat.p001.vo.Message;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatMapper dao;
	
	@Override
	public void saveMessage(Message message) throws Exception {
		dao.saveMessage(message);
	}
	@Override
	public List<Message> getMessage(int roomno) throws Exception {
		return dao.getRoomMessage(roomno);
	}
	
	@Override
	public List<ChatRoom> listChatRoom(Criteria cri, String newOwner) throws Exception {
		return dao.listChatRoom(cri, newOwner);
	}
	@Override
	public int getChatRoomNo() throws Exception {
		
		return dao.getChatRoomNo(); 
	}
	@Override
	public void createRoom(ChatRoom room) throws Exception {
		dao.createRoom(room);
	}

	@Override
	public ChatRoom getRoom(int roomNo) throws Exception {
		return dao.getRoom(roomNo);
	}

	@Override
	public String getMembers(int roomNo) throws Exception {
		return dao.getMembers(roomNo);
	}

	@Override
   public void addMember(int roomNo, String member) throws Exception {
      String members = dao.getMembers(roomNo);

      String[] s = members.split(",");

      members += "," + member;
      Map<String, String> params = new HashMap<>();
      
      params.put("members", members);
      params.put("roomNo", roomNo + "");
      
   }
	@Override
	public int removeMember(int roomNo, String member) throws Exception {
		String members = dao.getMembers(roomNo);
		System.out.println("멤버" + members );
		
		if (members.isEmpty()) {
			dao.removeRoom(roomNo); // 방 삭제
			
			return 1; // 방삭제 알림
		}
		// 멤버 존재하는 경우 //
		// 룸멤버 업데이트 파트
		Map<String, String> params = new HashMap<>();
		
		params.put("members", members);
		params.put("roomNo", roomNo + "");
		
		return -1; // 방 존재 알림
	}

	@Override
	public ChatRoom getRoomByOwner(ChatRoom room) throws Exception {
		return dao.getRoomByOwner(room);
	}

	@Override
	public int totalRoomNum() throws Exception {
		return dao.getTotalRoomNum();
	}

}
