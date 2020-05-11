//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;

$(document).ready(function() {
	connectWs();
});

function connectWs() {
	// sock = new WebSocket( 'ws://localhost:8099/echo/websocket');
	sock = new SockJS('http://localhost:8099/echo');
	// sock = new SockJS('/replyEcho');
	socket = sock;

	sock.onopen = function() {
		console.log('info: connection opened.');
		console.log($(".member_ID").val())
		
		$(".notice-div").css("display","block");
		
		$.ajax({
			url : '/common/notice/noticeCount',	// 카운터하는 컨트롤러로 디비에서 select count 가지고와야지
			type : 'POST',
			data : {"member_id" : $(".member_ID").val()},
			dataType: 'json',
			success : function(data) {		// 알람수 받아오기
				if(data.count == '0'){		// 알람이 0개이면 패스
					$('#notice_count--div').css('visibility', 'hidden')
				}else{					// 알림이 하나이상이면 뱃지표시
					
					// 뱃지 css적용
					$('.notice_count--div').css('visibility', 'visible')
					// 알림수 뱃지안에 숫자 텍스트로 삽입
					$('.notice_count--text').empty();
					$('.notice_count--text').text(data.count);
					
					console.log("알림수 체크체크 = " +data.count);
				}
			},
			error : function(err){
				alert('err');
			}
	   	});
		
	};

	//메세지 받았을 떄
	sock.onmessage = function(evt) {
		var data = evt.data;
		console.log("ReceivMessage : " + data + "\n");
		$(".noticeDiv").css('display', 'block');
		$(".noticeText").text(data);
		console.log( $(".member_ID").val());
		$.ajax({
			url : '/common/notice/noticeCount',	// 카운터하는 컨트롤러로 디비에서 select count 가지고와야지
			type : 'POST',
			data : {"member_id" : $(".member_ID").val()},
			dataType: 'json',
			success : function(data) {		// 알람수 받아오기
				if(data.count == '0'){		// 알람이 0개이면 패스
					$('#notice_count--div').css('visibility', 'hidden')
				}else{					// 알림이 하나이상이면 뱃지표시
					
					// 뱃지 css적용 클래스 삽입
					//$('#notice_count--div').addClass('notice_count--div')
					$('#notice_count--div').css('visibility', 'visible')
					// 알림수 뱃지안에 숫자 텍스트로 삽입
					$('.notice_count--text').empty();
					$('.notice_count--text').text(data.count);
					
					console.log("알림수 체크체크 = " +data.count);
				}
			},
			error : function(err){
				alert('err');
			}
	   	});
	   	
		// 모달 알림
	};

	// 연결 해제할 때
	sock.onclose = function() {
		console.log('connect close');
		/* setTimeout(function(){conntectWs();} , 1000); */
	};
	
	// 에러 발생할 때
	sock.onerror = function(err) {
		console.log('Errors : ', err);
	};

}