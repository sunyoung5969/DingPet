<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@include file="./includes/header.jsp"%>
<div class="content-wrapper" style="min-height: 901px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1> Chatting </h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active"> 채팅</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">채팅방목록</h3>
					</div>
					<!-- /.box-header -->

					<div class="box-body chatroomList">
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->		
	
			<div class="col-md-6">
				<!-- DIRECT CHAT WARNING -->
				<div class="box box-warning direct-chat direct-chat-warning">
					<div class="box-header with-border">
						<h3 class="box-title">Direct Chat</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<!-- Conversations are loaded here -->
						<div class="direct-chat-messages">							
						</div>
						<!--/.direct-chat-messages-->
					</div>
					<!-- /.box-body -->
					
					<div class="box-footer">
						<div class="input-group">
							<input type="text" name="message" placeholder="Type Message ..." class="form-control" id="message"> 
							<span class="input-group-btn">
								<input type="button" class="btn btn-warning btn-flat" id="sendBtn" value="전송">Send</button>
							</span>
						</div>
						<!-- ./input-group -->
					</div>
					<!-- /.box-footer-->
				</div>
				<!--/.direct-chat -->
			</div>
			<!-- /.col -->

			<div class="col-md-3">
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">친구 목록</h3>
					</div>
					<!-- /.box-header -->

					<div class="box-body">
						<ul class="tree" data-widget="tree" id='friendList'>
					        
					    </ul>
					</div>
					
					<div class="box-footer">
			          <button class="btn btn-block btn-warning" id="btn_makeChat">채팅방 만들기</button>
			        </div>
			        <!-- /.box-footer -->

				</div>
				<!-- /.box -->
			
			</div>
			<!-- /.col -->

		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	
	
	<!-- 채팅방 만들고/ 방장의 경우 수정 MODAL -->
	<div class="modal fade" id="makeChatModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">채팅방</h4>
				</div>
				<!-- /.modal-header -->
				
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="chatroomName">채팅방명</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="chatroomName"/> 
							<input type="hidden" name="chatroomId"/> <!-- 채팅방 번호 -->
						</div>
					</div><br/><br/><br/>
					<div class="form-group">
						<label class="col-sm-2 control-label">참여자</label>
						<div class="col-sm-10">
							<table class="table table-condensed">
								<tbody id="chatmemInfo"></tbody>
							</table>
						</div>
					</div>
					
				</div>
				<!-- /.modal-body -->
				
				<div class="modal-footer modalBtnContainer-addEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning" id="save-chat">만들기</button>
				</div>
				<div class="modal-footer modalBtnContainer-modifyEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="delete-chat">채팅방삭제</button>
					<button type="button" class="btn btn-info" id="update-chat">채팅방수정</button>
					<button type="button" class="btn btn-warning enter-chat">채팅하기</button>
				</div>
				<div class="modal-footer modalBtnContainer-enterEvent">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-danger" id="exit-chat">채팅방 나가기</button>
					<button type="button" class="btn btn-warning enter-chat">채팅하기</button>
				</div>
				<!-- /.modal-footer -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
</div>
<!-- /.content-wrapper -->
<%@include file="./includes/footer.jsp"%>
<link href='${contextPath}/resources/css/rice_chatcss.css' rel='stylesheet' />

<script src="${contextPath}/resources/api/js/moment.min.js"></script>
<script src="${contextPath}/resources/api/js/sockjs-0.3.4.js"></script>
<script src="${contextPath}/resources/js/rice_chatjs.js"></script>
<script type="text/javascript">
	var wsocket;

	$(document).ready(function() {	
		setmemNum('${loginMem.memNum}');
		setauthId('${loginMem.authId}');
		
		getFriendList(memNum, authId);	// 친구목록 가져오기 ajax
		getChatroomList(memNum);		// 채팅방 목록 가져오기 ajax
		
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});
		
		$('#sendBtn').click(function() { send(); });
// 		$('#enterBtn').click(function() { connect(); });
// 		$('#exitBtn').click(function() { disconnect(); });
	});
	
	// 채팅방 참여 버튼 event
	btn_enterchat.click(function (e) {
		if(wsocket == undefined || wsocket == null) { // 연결이 안되어 있을 경우에만 연결
			connect();
		} 
	});
		
	function connect(target) {	// 연결 시키기 함수
		alert(chatroomId);
	
		wsocket = new SockJS("/echo");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;	
	}
	
	function disconnect() {	// 연결 끊기 함수
		wsocket.close();
	}
	
	function onOpen(evt) {	// 연결됨
		direct_chat_messages.html('');
		var open_msg = {
			type : 'register',
			userid : '${loginMem.memNum}',
			send_memNum : '',
			send_name : '',
			send_msg : '${loginMem.memName}' + "님이 입장했습니다",
			send_time : moment().format('YYYY[-]MM[-]DD HH:mm')
		}
		wsocket.send(JSON.stringify(open_msg));
	}
	
	function onClose(evt) {	// 끊어짐
// 		var close_msg = {
// 			type : 'close',
// 			send_memNum : '',
// 			send_name : '',
// 			send_msg : "연결을 끊었습니다.",
// 			send_time : moment().format('YYYY[-]MM[-]DD HH:mm')
// 		}
// 		appendMessage(JSON.stringify(close_msg));
		console.log("연결 끊김");
	}
	
	function onMessage(evt) {	// 받음
		var data = evt.data;
		appendMessage(data);
		alert(data);
	}
	
	function send() {		// 보냄
		var send_msg = {
			type : 'chat',
			send_memNum : '${loginMem.memNum}',
			send_name : '${loginMem.memName}',
			send_msg : $("#message").val(),
			send_time : moment().format('YYYY[-]MM[-]DD HH:mm'),
			send_target : send_target
		}
		wsocket.send(JSON.stringify(send_msg));
		$("#message").val("");
	}
	
	function appendMessage(msg) {	// 받은 메시지 화면에 보여주기 function 
		var obj = JSON.parse( msg );
		
		if(obj.send_memNum  == '${loginMem.memNum}') {
			str = '<div class="direct-chat-msg right">'
		} else {
			str = '<div class="direct-chat-msg">'
		}
		str += '<div class="direct-chat-info clearfix">'
				+ '<span class="direct-chat-name pull-left">'
				+ obj.send_name + '</span>'
				+'<span class="direct-chat-timestamp pull-right">'
				+ obj.send_time + '</span></div>'
				+ '<div class="direct-chat-text">'
				+ obj.send_msg
				+ '</div></div>';
			
		var direct_chat_messages = $(".direct-chat-messages");
		direct_chat_messages.append(str);
		direct_chat_messages.scrollTop(direct_chat_messages[0].scrollHeight);
	}

</script>
</html>