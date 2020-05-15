<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<title>Chatting</title>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/dist/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/chat_socket.js?v=<%=System.currentTimeMillis() %>"	type="text/javascript"></script>


<style>
.chatcontent {
	overflow: scroll;
	height: 500px;
	position: relative;
}

.main_tit {
	
}

body {
	overflow: hidden;
}

#header li a {
	color: #3d3d3d;
}

#header li a:hover {
	color: #adadad;
}

.wrap {
	text-align: center;
	position: absolute;
	top: 120px;
}

.wrap h2 {
	margin: 20px auto;
}

.table {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

.table, tr, td, th {
	border: 1px solid #3d3d3d;
	border-collapse: collapse;
}

thead tr {
	height: 40px;
}

tbody tr {
	height: 34px;
}

button {
	width: 50%;
	text-align: center;
	color: #fff;
	background-color: #3d3d3d;
	border: 0;
	height: 25px;
}

tfoot tr {
	height: 36px;
}

.wrap_table {
	width: 89%;
	overflow: hidden;
	position: absolute;
	top: 160px;
	left: 5%;
}

.text-center {
	margin-top: 10px;
}

.pagination {
	width: 60%;
	margin: 0 auto;
	text-align: center;
}

.pagination li {
	display: inline-block;
	padding: 10px 5px 0 5px;
}

.cre {
	float: right;
	width: 120px;
	height: 30px;
	padding-top: 10px;
	margin-right: 10%;
	text-align: center;
	border: 1px solid #ededed;
}

.cre a:hover {
	text-decoration: none;
	color: #aeaeae;
}

button {
	width: 120px;
	height: 38px;
}

#container2 {
	background: none;
}

.chatWrap {
	width: 69%;
	height: 780px;
	position: absolute;
	top: 160px;
	left: 14%;
}

.main_tit {
	text-align: center;
}

.main_tit h1 {
	text-align: center;
}

.fix_btn {
	width: 69%;
	position: fixed;
	bottom: 0;
}

.box {
	margin: 25px 0;
}

#msgi {
	width: 200px;
	height: 35px;
	margin: 30px 0;
}

li {
	padding-left: 15px;
}

.roomOut, .btnPass {
	margin-left: 4px;
}

.user {
	
}

.user ul {
	padding-bottom: 5px;
	border-bottom: 1px dashed #ededed;
}

.user ul li {
	margin-bottom: 4px;
}

.box li {
	margin-top: 5px;
	display: inline-block;
}

.box span {
	margin-left: 20px;
	color: #aaa;
	margin-top: 20px;
	float: right;
	padding-right: 5px;
}

.dd {
	margin-left: 20px;
	color: #6d6d6d;
}
</style>
</head>
<body>
	<section class="site-blocks-cover overflow-hidden bg-light">
		<div class="container">
			<div class="row">
				<div class="chatWrap col-md-12 align-self-center">
					<div class="main_tit">
						<h2>방 이름 [ ${room.roomName} ]</h2>
					</div>
					<div class="content chatcontent" data-room-no="${room.roomNo}" data-member="${customers.member_id}">
						<div class="user">
							<ul>
							</ul>
						</div>
						<div class="box">
							<c:forEach items="${msgList}" var="msg">
						      <li> ${msg.sender} : <br/> ${msg.message} </li>
						      <span>[보낸 시간] ${msg.send_date}</span><br>
							</c:forEach><!-- 채팅 리스트 -->
						</div>
						<div class="fix_btn">
							<input type="text" id="msgi" name="msg" placeholder="메세지를 입력하세요" />
							<button type="button" class="send">보내기</button>
							<button type="button" class="roomOut" value="${customers.member_id}">방 나가기</button>
							<input type="hidden" value="${cri.page}" id="page" name="page" />
							<input type="hidden" value="${cri.perPageNum }" id="perPageNum" name="perPageNum" />
							<button type="button" class="btnPass" onclick="return isOwner(${room.roomNo}, '${customers.member_id}')">
							방삭제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>