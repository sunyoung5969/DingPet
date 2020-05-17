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
	width: 50%; /* Could be more or less, depending on screen size */
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

#front_view{
    width : 300px;
    height : 200px;}

.form


</style>



<!-- 확인 요청 모달 -->
<div id="modal" class="modal">
	<div class="modal-content">
		<div class="text_center py-3">
			<h2 class ="color_dark_blue narrow" style="font-family:GmarketSansBold;">완료 처리</h2>
			<span class = "color_grey">축하합니다! 간단한 후기를 등록하시면 매칭이 완료됩니다.</span>
		</div>
		<form method="post" action="/lostpets/request/complete" method="post" enctype="multipart/form-data" >
			<div class = "content_area pt-3">
				<div class="form-group row">
					<label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">제목</label>
					<div class="col-md-6"> <input type = "text" name = "match_title" class="form-control"required></div>
				</div>
				<div class="form-group row">
					<label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">후기</label>
					<div class="col-md-6">
						<textarea rows="6" cols="30" placeholder="" name = "match_content" class="form-control" required></textarea>
					</div>
				</div>
					<div class="form-group row uploadDiv">
						<label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">사진</label>
						<div class="col-md-6">
						<input type = "file" name = "photo" id = "frontImage" accept = "image/*" required title = "사진을 업로드 해주세요.">
						<img id='front_view' style ="display:none;" src = ""></div>
					</div>
			</div>
			<input type = "hidden" name = "request_id" value="${requestFrom.request_id }">
			<input type = "hidden" name = "member_id" value="${customers.member_id}">
			<input type = "hidden" name = "sender_b_id" value="${myList.member_id}">
			<input type = "hidden" name = "receiver_b_id" value="${requestFrom.member_id}">
			<div class="py-5 flex_row">
				<button type = 'submit'  id="complete" data-board_id="${myList.board_id }" data-request_id="${requestFrom.request_id }" data-sender_id = "${myList.member_id} " 
								 data-receiver_id = "${requestFrom.member_id}"class="btn btn-primary mr-3" style="padding:10px 30px;">완료하기</button>
				<button type = "button"id = "closeBtn" class="btn btn-primary" style="padding:10px 30px;">닫기</button> 
			</div>
		</form>
	</div>
</div>

		
	





<script>
    var upload = document.querySelector('#frontImage');
 	
    upload.addEventListener('change',function (e) {
    	
        var get_file = e.target.files;
        console.log(get_file)
        
        //FileReader 객체 생성
        var reader = new FileReader();
        
        // reader 시작시 함수 구현
        reader.onload = function(aImg){
        	console.log(1);
	        $("#front_view").attr("src", aImg.target.result);
        }
        reader.readAsDataURL(e.target.files[0])
        
        $("#front_view").show();
    });
</script>

<script>

	var loggedIn_id = '${customers.member_id}';
	var modal = $("#modal");
	var window = $(window);
	var content_area = $(".content_area");
	
	$(function(){
		//완료 버튼 누르면 모달 팝업		
		$(".confirmRequest").on("click", function(){
				modal.css("display", "block");
		});
		
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
		/*
			//완료 버튼 >> 완료 처리 : lost_found에서 status y로 변경(y이면 글에 완료됐다는 표시해주기), 완료 테이블에 해당 글 lost_id, find_id, 컬럼으로 두 개의 board_id 매핑 저장, 완료 날짜 저장	
			$("#complete").on('click', function(){
		
				var board_id = $(event.target).attr('data-board_id');
				var request_id = $(event.target).attr('data-request_id');
				var sender_id = $(event.target).attr('data-sender_id');
				var receiver_id = $(event.target).attr('data-receiver_id');
				
				var ids = {
						board_id : board_id,
						request_id : request_id
				}
				
				console.log("request_id = " + ids.request_id);
				console.log("board_id = " + ids.board_id);
		
					requestService.confirm(ids, function(){
						console.log('축하드려요! 완료 처리 되었습니다.');
					});
					
			});*/
	});
	
</script>
<script type = "text/javascript" src = "/resources/js/request.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/notice.js" ></script>











