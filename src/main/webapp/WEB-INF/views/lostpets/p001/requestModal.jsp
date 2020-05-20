<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
<style>
/*확인 요청 Modal*/
a:link, a:visited {
	text-decoration : none;
	color : #2C2A2A;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 35%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
	color: #088cf3;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.selected {
	border-radius: 25px;
  	border: 2px solid #088cf3;
}

.d_table{
display: table;
width:100%;
}
.cell {
    display: table-cell;
    vertical-align: middle;
}


.frame{
	position: relative;
	width: 180px; 
	height: 120px;
	display : inline-block;
}

.frame img{
	position : absolute;
	max-width: 100%;
	max-height : 100%;
	top:0;
	left:0;
	right:0;
	bottom:0;
	margin:auto;
}

</style>



<!-- 확인 요청 모달 -->
<div id="modal" class="modal">
	<div class="modal-content">
		<div class="text_center py-1">
			<h2 class ="color_dark_blue narrow" style="font-family:GmarketSansBold;">확인 요청</h2>
			<span class="color_grey">게시하신 글을 바탕으로 확인을 요청하실 수 있습니다. 게시글을 선택해주세요.</span>
		</div>
		<div class = "content_area pt-3">
		</div>
		
		<form id = "toChat" action="../../chat/createRoom" method="post" >
            <input type='hidden' name='room_owner'  value='${customers.member_id }' />    
            <input type="hidden" name="roomName"  value="확인 요청합니다"/>
            <input type="hidden" name="roomMember"  value='${board.member_id}'/>

			<div class="py-5 flex_row">
				<button type = 'submit'  id="sendRequest" class="btn-sm btn btn-primary mr-3">요청 전송</button>
				<button type = "button"id = "closeBtn" class="btn-sm btn btn-primary">닫기</button> 
			</div>
		 </form>
	</div>
</div>

		
	



<script type = "text/javascript" src = "/resources/js/request.js"></script>
<script>

	var loggedIn_id = '${customers.member_id}';
	var modal = $("#modal");
	var window = $(window);
	var content_area = $(".content_area");
	
	$(function(){
		//로그인 돼 있지 않을 시
		if(!loggedIn_id){
			$("#confirmation_request").on("click", function(){
				alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
				location.href = "/customers/p001/signin";
			});
			
		//로그인 한 경우	
		}else{
			//확인 요청 버튼 클릭 시 이벤트
			$("#confirmation_request").on("click", function(){
				console.log("로그인 한 id " + loggedIn_id);
				
				var str = "";
				
				//버튼을 누르면 ajax로 내 작성글 데이터를 가져오고 동적으로 html 요소 형성 
				requestService.list(loggedIn_id, function(senderList){
					if(!senderList || senderList.length == 0){
						content_area.html('<h2 class = "text_center">아직 작성하신 글이 없습니다.</h2>');
						$("#send").hide();
						return;
					}else{
						for(var i = 0; i < senderList.length; i++){
							str += "<div class='radio small_list_border w-90 mx-auto my-2' data-sender_b_id = '" + senderList[i].board_id +"' data-sender_id = '" + loggedIn_id + "'>";
							str += "<div class = 'p-3 d_table'><div class='cell frame pt-2'>";
							str += "<img src='https://www.dingpet.shop/lost/" + senderList[i].front_name + "'></div>";
							str += "<div style = 'width: 60%;' class= 'cell pl-3 pt-2 text_left d-inline-block'>";
							str += "<p class='text_overflow'><strong>" + senderList[i].title + "</strong></p><p class='pl-2'>";
							str += " <span class='tag'>견종</span><span> </span><span>" + senderList[i].dog_breed +"</span>";
							str += "<span class = 'pl-2'></span> <span class='tag'>성별</span><span></span> <span>" + senderList[i].dog_sex +"</span> </p><p class='pl-2'>";
							str += " <span class= 'tag'>실종 장소</span><span></span> <span>" + senderList[i].found_location + "</span>";
							str += " </p> </div> </div> </div>";
						}
						content_area.html(str);
					}
				});
				
				//모달 창 표시
				modalDisplay();

				//모달창 표시
				function modalDisplay(){
					modal.css("display", "block");
				}
				
			});
		}
		
		
		// 닫기 버튼 누르면 닫기
		$("#closeBtn").click(function(){
			modal.css("display", "none");
		});
		
		//모달 바깥 영역 클릭시 닫기
		window.onclick = function(event) {
			if (event.target.id == "modal") {
				modal.css("display", "none");
			}
		}
	});
		
	$(function(){
		
		//게시글 선택 시 member_id와 선택된 글의 board_id 저장
		content_area.on('click', '.radio', function(){
			$(this).parent().find('.radio').removeClass('selected');
			$(this).addClass('selected');
			
			var sender_id = $(this).attr('data-sender_id');
			var sender_b_id = $(this).attr('data-sender_b_id');
			var receiver_id = "${board.member_id}";
			var receiver_b_id = "${board.board_id}";
			
			console.log("sender info " + sender_id + ", " + sender_b_id);
			console.log("receiver info " + receiver_id + ", " + receiver_b_id);
			
			//요청 전송 버튼 클릭시
			$("#sendRequest").on("click", function(){
				//중복 실행 방지
			//$("#toChat").submit(function(){
				
				event.stopPropagation();
		
				
				if(!sender_id || !sender_b_id){
					alert("게시글을 선택해주세요.");
				}else{
					//요청 전송
				//요청 전송 ajax
					var requestData = {
						category : 'FTL',
						sender_id : sender_id,
						sender_b_id : sender_b_id,
						receiver_id : receiver_id,
						receiver_b_id : receiver_b_id
					};
					
					var noticeData = {
						notice_Type : "확인 요청",
						sender_ID : sender_id,
						member_ID : receiver_id,
						notice_Contents : sender_id + "님이 확인 요청을 보내셨습니다.",
						url : "/lostpets/p001/view?board_id=" + sender_b_id
					}
					
					requestService.send(requestData, function(){
					//중복확인 필요@@@@@@@@@@@@@@@@@@@@
						alert('요청이 전송되었습니다!');
						modal.css("display", "none");
					});
					
					noticeService.form(noticeData,function(){
						console.log('알림 전송 성공');
					})
				
				}
				
			});// 요청 버튼 클릭 이벤트 끝
		});
		
		
	});
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/notice.js" ></script>











