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

.radio{

}

.selected {
	border-radius: 25px;
  	border: 2px solid #088cf3;
}


</style>






<div class="flex_row_around pt-3">
	<c:choose>
		<c:when test = "${customers.member_id == board.member_id}">
			<button id="complete" class="btn btn-primary">완료 처리</button>
		</c:when>
		<c:otherwise>
			<button id="confirmation_request" class="btn btn-primary">확인 요청</button>
		</c:otherwise>
	</c:choose>
</div>


<!-- 확인 요청 모달 -->
<div id="modal" class="modal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<div class="text_center py-1 color_black">
			<h2>확인 요청</h2>
			<span>요청하실 게시글을 선택해주세요.</span>
		</div>
		<div class = "content_area">

			<c:forEach begin="1" end="5">
				<div class="my-2">
					<a href="#">
						<div class="small_list_border w-90 m-auto my-3">
							<div class="flex_row p-3">

								<div class="w-25 d-inline-block">
									<img class=".nav-pills" style="width: 150px; height: 150px;" src='/resources/images/dog2.jpg'>
								</div>
								<div class="w-75 pl-3 pt-3 d-inline-block">
									<p>
										<strong>작은 말티즈 쪼롱이를 찾고 있어요</strong>
									</p>
									<p class="pl-2">
										<span class="tag">견종</span><span> </span> <span>말티즈</span> 
										<span class="pl-2"></span> 
										<span class="tag">성별</span><span></span> <span>암컷</span>
									</p>
									<p class="pl-2">
										<span class="tag">실종 장소</span><span> </span><span>서울특별시 영등포구 국회대로29길 8</span>
									</p>
								</div>

							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>

		<div class="py-5 m-auto">
			<button id="send" class="btn-sm btn btn-primary">요청 전송</button>
		</div>
	</div>
</div>


<script type = "text/javascript" src = "/resources/js/request.js"></script>
<script>

	var loggedIn_id = '${customers.member_id}';
	var modal = $("#modal");
	var span = $(".close")[0];
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
						content_area.html('<h2>아직 작성된 글이 없습니다.</h2>');
					}else{
						for(var i = 0; i < senderList.length; i++){
							str += "<div class='radio small_list_border w-90 mx-auto my-2' data-sender_b_id = '" + senderList[i].board_id +"' data-sender_id = '" + loggedIn_id + "'>";
							str += "<div class = 'flex_row p-3'><div class= 'w-25 d-inline-block'>";
							str += "<img class = '.nav-pills' style= 'width: 150px; height: 150px;' src='/resources/images/dog2.jpg'></div>";
							str += "<div class= 'w-75 pl-3 pt-3 d-inline-block'>";
							str += "<p><strong>" + senderList[i].title + "</strong></p><p class='pl-2'> <span class='tag'>견종</span><span> </span><span>" + senderList[i].dog_breed +"</span>";
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
		
		
		// X 버튼 클릭시 닫기
		span.onclick = function() {
			modal.css("display", "none");
		}
		
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
			$("#send").on("click", function(){
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

					requestService.send(requestData, function(){
					//중복확인 필요@@@@@@@@@@@@@@@@@@@@
						alert('요청이 전송되었습니다!');
						modal.css("display", "none");
					});
				
				}
				
			})// 요청 버튼 클릭 이벤트 끝
		});
		
		
				//완료처리 
			$("#complete").on('click', function(){
			})
	});
	
		$(function(){
	
		})
</script>












