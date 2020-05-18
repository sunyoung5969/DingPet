<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kakaoPaySuccess.css?v=3">

</head>
<body onbeforeunload="closedPopup()">
	<div class='payment_info-title'>
		<h1 align='center'>결 제 정 보</h1>
	</div>
	
	<div class='payment-info-contents--container'>
		<div class='payment-info-contents'>
			<table>
				<tr>
					<td align='center' class='info-name'>결 제 일 시</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.payment_Date}</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>주문번호</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.order_ID}</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>상품명</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.item_Name}</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>고객아이디</td>
					<td> : </td>
					<td align='center' id="member_ID" class='info-data'>${info.member_ID}</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>펫시터아이디</td>
					<td> : </td>
					<td align='center' id="sitter_ID" class='info-data'>${info.sitter_ID}</td>
					<input type="hidden" class="member_ID" value="${info.sitter_ID }">
				</tr>
				
				<tr>
					<td align='center' class='info-name'>부 과 세</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.vat } 원</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>총 결제 금액</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.total_amount} 원</td>
				</tr>
			</table>
			
			<div align='center' class='closed-div'>
				<button class='closed-btn' onclick="closedPopup()">확 인</button>
			</div>
		</div>
		<div class='background-gradation'></div>
		<!-- 
		<div class='img-div'>
			<img class='img-bottom' src="https://i.imgur.com/irDyXI6.png?1">
		</div>
		 -->
	</div> 
	
	<script src="${pageContext.request.contextPath}/resources/js/profilelookup.js?v=12"></script>
	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
	<script>
		$(document).ready(function(){
			formnotice();
		});

		function formnotice(){
			var noticeData = {
				"notice_Type" : "예약",						// 알림 유형(예약, 유기견찾기, 유기견보호)
				"member_ID" : $("#sitter_ID").text(),		// 받는 사람의 아이디
				"sender_ID" : $("#member_ID").text(),		// 보내는 사람의 아이디
	/*알림내용*/	"notice_Contents" : $("#member_ID").text() + "님이 "+$("#sitter_ID").text()+"님에게 펫시터 예약을 하였습니다",
				"url" : "petsitting/p002/reservationlist"	// 알림 메시지 클릭 시 이동할 매핑주소
			}
			
			//스크랩 알림 DB저장
			$.ajax({
				type : 'post',
				url : '/common/notice/setNotice',		// 알림 데이터 디비에 삽입하는 곳으로 매핑
				data : noticeData,
				dataType : 'json',
				success : function(data){
					if(socket){		// 열려있는 소켓이 있으면
						// websocket에 보내기 (reserved, 보내는사람, 받는사람, 예약번호)
						let socketMsg = "reserved,"+ $("#member_ID").text()+","+$("#sitter_ID").text()+","+"20938123";
						socket.send(socketMsg);				// 실시간 알림 메시지 전송
					}
				},
				error : function(err){
					console.log(err);
				}
			});
		}
	
	</script>
  	<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
	
</body>
</html>