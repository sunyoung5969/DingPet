<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatList.css?v=5">

<script	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/dist/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/chat_socket.js?v=<%=System.currentTimeMillis() %>"	type="text/javascript"></script>

<script>
var logged = '${customers.member_id}';
function checkPersonnel(roomNo, roomPw, result) {
	  /* 	alert(typeof roomNo + roomPw + result); */
	//$(".content").data('room-no', roomNo);
	$(".content").attr('data-room-no', roomNo);

	$.ajax ({
		type:'get',
		url:'/checkPersonnel',
		data: {
			roomNo : roomNo
		},
		success:function(data) {
	    	  /* alert(data); */
			if (data >= 6) {
					return false;
			} else {
				console.log("방에 입장 중 입니다.");
				if(!onoff){
					chatcon();
				}
	
				if (!result) {
		               check(roomNo, roomPw);
				} else {
					submitForm(roomNo);
				}
			}
		}
	});
}
	
function check(roomNo, roomPw){
	/* alert(roomNo + "roomPw" + roomPw); */
	var input = prompt('패스워드를 입력하세요 > ');
	
	if(input == roomPw){
		alert("일치함");
		
		submitForm(roomNo);
	}else{
		alert("패스워드가 일치하지 않습니다.");
		return false;
	}
}

function submitForm(roomNo){

	$("#subNo").val(roomNo);
	
	
	var chatData = {
		userId : $("userId").val(),
		userNmae : $("userName").val(),
		roomNo : roomNo,
	}

	 $.ajax ({
		type:'post',
		url:'/chat/enterRoom',
		data: chatData,
		success:function(data) {
			/* alert(data); */
			
			var chatList = data.chatList;
			var room2 = data.room2;
			
			$(".chat-mem").empty();
			$(".chat-panel").empty(); //여기서 append
			/*
			if (logged == room2.room_owner){
				$(".chat-mem").append(room2.bnick+"님과 대화 중");
			}else{
				$(".chat-mem").append(room2.anick+"님과 대화 중");
			}*/
			if(chatList.length > 0){

				var chatClass="";	
				var str = "";	
				for(var i=0; i<Object.keys(chatList).length; i++){
					if ($(".member_ID").val() == chatList[i].sender){
						chatBoxLocation = "right";
						chatClass = "chat-bubble--right";
						textBoxClass = "textBox-div--right";
					}else{
						chatClass="chat-bubble--left";
						textBoxClass = "textBox-div--left";
						chatBoxLocation ="left";
					}
					str += '<div class="no-gutters--'+chatBoxLocation+'"><div class="offset-md-9">';
					str += '<div class="textBox-div--'+chatBoxLocation+'"><div class="chat-bubble chat-bubble--'+chatBoxLocation+'"><li style="word-break: break-all;">'+chatList[i].message;
					str += '</li></div></div><span class="chat-date">'+chatList[i].send_date+'</span>';
					str += '</div></div>';
					
					$(".chat-panel").append(str); //여기서 append
					$(".chat-panel").scrollTop($(".chat-panel")[0].scrollHeight);
					str = "";

				}
	        }
        }
     });
}

</script>
<style>
.bg{
	background:#74b9ff !important;
	color:#FFF;
}
</style>

<section style="padding-top: 87px">

	<input type="hidden" id="subNo" name="roomNo" />
	<input type="hidden" id="subName" name="subName" />
	<div class="container-chat">
		<div class="row no-gutters row-div">
			<div class="col-md-4 border-right">
				<div class="settings-tray">
					<h4 class="chat-memid">환영합니다, ${customers.member_nickname }님!</h4>
				</div>
				<c:forEach items="${roomList}" var="room">
					<c:choose>
						<c:when	test="${room.roomPw == '' || room.roomPw eq null || room.roomPw eq ''}">
							<div class="friend-drawer friend-drawer--onhover" onclick="return checkPersonnel(${room.roomNo}, ${room.roomNo}, true)">
								<small></small>
								<div class="text" >
								<c:if test="${empty room.bnick}">
									<c:set var="bnick" value="존재하지 않는 사용자" />
								</c:if>
								<c:if test="${empty room.anick}">
									<c:set var="anick" value="존재하지 않는 사용자" />
								</c:if>
									<h6>${room.roomMember == customers.member_id ? room.anick : room.bnick}</h6>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="friend-drawer friend-drawer--onhover" onclick="return checkPersonnel(${room.roomNo}, ${room.roomPw}, false)">
								<small></small>
								<div class="text">
									<h6>${room.roomMember == customers.member_id ? room.room_owner : room.roomMember}</h6>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 룸 리스트 -->
			</div>

			<div class="col-md-8">
				<div class="content chatcontent" data-room-no="" data-member="${customers.member_id}"></div>
				<div class="chat-mem" id="choiceName"></div>
				<div class="chat-panel"></div>
				<div class="row-chat">
					<div class="col-12" style="padding: 0px;">
						<div class="chat-box-tray" style="margin: 0px;">
							<input type="text" name="msg" placeholder="메세지를 입력하세요">
							<button class="btn-send send">전 송</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
		$( '.friend-drawer' ).on( 'click',  function() {
			  $( '.chat-bubble' ).hide('slow').show('slow');
			  $( '.chat-date' ).hide('slow').show('slow');
			
			  $(".friend-drawer").removeClass("bg");
			  $(this).addClass("bg");
			  
		});
		
		

</script>


</section>


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
