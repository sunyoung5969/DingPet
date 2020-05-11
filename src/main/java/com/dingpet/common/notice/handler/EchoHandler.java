package com.dingpet.common.notice.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.dingpet.common.notice.vo.Notice_VO;
import com.dingpet.customers.p001.vo.Customers_P001_VO;

public class EchoHandler extends TextWebSocketHandler {

	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("afterConnectionEstablished : " + session); // 메시지 받는 사람

		String senderId = getId(session);
		userSessionsMap.put(senderId , session);		// 메시지 보내는 사람의 아이디 맵에 삽입
		System.out.println(userSessionsMap);
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("handleTextMessage : " + session + " : " + message);

		String senderId = getId(session);
	
		//protocol : (알림내용 , 보내는사람 , 받는사람, 예약번호 ...)
		 
		String msg = message.getPayload();	
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 4) {
				System.out.println(strs[0]+ strs[1]+ strs[2]+ strs[3]);
				String cmd = strs[0];
				String caller = strs[1]; 
				String receiver = strs[2];
				String seq = strs[3];
				
				// 알림받는 작성자가 로그인 되어있으면
				WebSocketSession boardWriterSession = userSessionsMap.get(receiver);
				
				// 실시간 예약 알림
				if("reserved".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage("예약번호 : "+seq+" "+caller+"님이 "+receiver+"님에게 펫시터 예약을 하였습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				
				}else if("follow".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
							 "님을 팔로우를 시작했습니다.");
					boardWriterSession.sendMessage(tmpMsg);
					
				}else if("scrap".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
										//변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
										"<a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq="+seq+"&mentors="+ receiver +"'>" + seq + "</a>번 에세이를 스크랩 했습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}		
	}
	
	private String getId(WebSocketSession session) {
		// TODO Auto-generated method stub
				
		Map<String, Object> httpSession = session.getAttributes();
		Customers_P001_VO login = (Customers_P001_VO)httpSession.get("customers"); // 유저 아이디 가져오기

		Notice_VO loginUser = new Notice_VO();
		
		loginUser.setMember_ID(login.getMember_id());
		
		if(loginUser == null)
			return session.getId();
		else
			return loginUser.getMember_ID();
	}

	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed " + session + " : " + status);
		userSessionsMap.remove(session.getId());
	}

}