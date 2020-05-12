var noticeService = (function(){
	
	function formNotice(noticeData){
		//스크랩 알림 DB저장
		$.ajax({
			type : 'post',
			url : '/common/notice/setNotice',		// 알림 데이터 디비에 삽입하는 곳으로 매핑
			data : noticeData,
			dataType : 'json',
			success : function(data){
				if(socket){		// 열려있는 소켓이 있으면
					// websocket에 보내기 (reserved, 보내는사람, 받는사람, 예약번호)
					let socketMsg = noticeData.notice_Contents
					console.log("msg : " + socketMsg);	// 실시간 알림메시지 확인
					socket.send(socketMsg);				// 실시간 알림 메시지 전송
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	
	
	return {
		form : formNotice
	}
	
})();