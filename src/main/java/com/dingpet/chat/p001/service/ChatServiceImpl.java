package com.dingpet.chat.p001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingpet.chat.p001.mapper.ChatMapper;
import com.dingpet.chat.p001.vo.ChatRoom;
import com.dingpet.chat.p001.vo.Criteria;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatMapper dao;

	@Override
	public List<ChatRoom> listChatRoom(Criteria cri) throws Exception {
		return dao.listChatRoom(cri);
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
      for (String name : s) {
    	  
         if (name.equals(member)) {
            return;
         }
      }
      
      members += "," + member;
      Map<String, String> params = new HashMap<>();
      
      params.put("members", members);
      params.put("roomNo", roomNo + "");
      
      dao.addMember(params);
   }
	@Override
	public int removeMember(int roomNo, String member) throws Exception {
		String members = dao.getMembers(roomNo);
		System.out.println("멤버" + members );
		
		members = members.startsWith(member) ? members.replace(member, "") : members.replace("," + member, "");
		// 방에 멤버가 존재하지 않는 경우 //
		
		if (members.isEmpty()) {
			dao.removeRoom(roomNo); // 방 삭제
			
			return 1; // 방삭제 알림
		}
		// 멤버 존재하는 경우 //
		// 룸멤버 업데이트 파트
		Map<String, String> params = new HashMap<>();
		
		params.put("members", members);
		params.put("roomNo", roomNo + "");
		
		dao.addMember(params); // member 제거된 members로 룸멤버 업데이트

		// 방장 업데이트 파트
		if (members.startsWith(",")) {
			members = members.replaceFirst(",", "");
		}
		
		String newOwner = members.split(",")[0];
		
		Map<String, String> params2 = new HashMap<>();
		
		params2.put("roomNo", roomNo + "");
		params2.put("newOwner", newOwner);
		
		dao.updateOwner(params2); // 방장 업데이트
		
		return -1; // 방 존재 알림
	}

	@Override
	public ChatRoom getRoomByOwner(String owner) throws Exception {
		return dao.getRoomByOwner(owner);
	}

	@Override
	public int totalRoomNum() throws Exception {
		return dao.getTotalRoomNum();
	}

}
