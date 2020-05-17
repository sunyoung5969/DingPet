<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<!-- lost_found.CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
<style>
	.map_wrap {position:relative;width:100%;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;
    	border: 1px solid #088cf3;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; }
    
    #lost_map_guide{
    	position: absolute;
    	left : 10px;
    	background:rgba(255,255,255,0.8)
    	;z-index:1;
    	padding:5px;
    }
    
	#address_display{
		width : 70% !important;
	}
	    
    #address_display:read-only{
    	background: #fff;
    }
    
    .addressBtn{
    	padding : 10px 30px !important;
    	margin-left : 20px;
    }
    
    .fileDrop{
    	width : 400px;
    	height : 300px;
    	border : 1px solid #088cf3;
    }
    
    #front_view{
    width : 400px;
    height : 300px;}
    
    
</style>


<!--====  str of contents  ====-->
<section style="padding-top: 87px">
	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);">
	</div>
	<div class="main main-raised">
		<div class="profile-content">
			<div class="container">
				
				<div class="row justify-content-center pt-5 pb-5" data-aos="fade-up">
					<div class="text-center heading-section">
						<h2 class="text-black mb-2" style="font-family:GmarketSansBold;">주인 찾기 / 반려견 찾기 등록</h2>
					</div>
				</div>

				<div class="card-body pd40">
					<form id="lost_found_form" action="/lostpets/p001/write" method="post" enctype="multipart/form-data">
						<div class="form-group row">
							<label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">카테고리</label>
							<div class="col-md-6">
								<input type="radio" id="tempshelters-title" class="form-control" name="category" value="lost" required> 
								<label for="lost">주인 찾기 등록</label>&nbsp;&nbsp; 
								<input type="radio" id="tempshelters-title" class="form-control" name="category" value="find" required> 
								<label for="find">반려견 찾기 등록</label>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">제목</label>
							<div class="col-md-6">
								<input type="text" id="tempshelters-title" class="form-control"
									name="title" placeholder="제목을 입력하세요" maxlength="200" autofocus
									required>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">견종</label>
							<div class="col-md-6">
								<input list = "dog_breed" class="form-control" name="dog_breed" maxlength="30" placeholder="목록에서 선택해주세요" 
								pattern = "믹스견|그 외|골든 리트리버|닥스훈트|도베르만|래브라도 리트리버|말티즈|미니어쳐 핀셔|불독|비글|비숑 프리제|사모예드|스피츠|시바|시추|
								시베리안 허스키|알래스칸 말라뮤트|요크셔 테리어|웰시 코기|저먼 셰퍼드|진돗개|치와와|코카 스파니엘" required title = "목록에서 선택해주세요">
								<datalist id = "dog_breed">
									<option value ="믹스견" readonly>
									<option value ="그 외">
									<option value ="골든 리트리버">
									<option value ="닥스훈트">
									<option value ="도베르만">
									<option value ="래브라도 리트리버">
									<option value ="말티즈">
									<option value ="미니어쳐 핀셔">
									<option value ="불독">
									<option value ="비글">
									<option value ="비숑 프리제">
									<option value ="사모예드">
									<option value ="스피츠">
									<option value ="시바">
									<option value ="시추">
									<option value ="시베리안 허스키">
									<option value ="알래스칸 말라뮤트">
									<option value ="요크셔 테리어">
									<option value ="웰시 코기">
									<option value ="저먼 셰퍼드">
									<option value ="진돗개">
									<option value ="치와와">
									<option value ="코카 스파니엘">
								</datalist>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">이름</label>
							<div class="col-md-6">
								<input type="text" class="form-control" name="dog_name"
									maxlength="20" placeholder="예) 쪼롱이" required>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">성별</label>
							<div class="col-md-6">
								<input type="radio" class="form-control" name="dog_sex"
									value="암컷" required> <label for="암컷">암컷</label>&nbsp;&nbsp;
								<input type="radio" class="form-control" name="dog_sex"
									value="수컷"> <label for="수컷">수컷</label>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">크기</label>
							<div class="col-md-6">
								<input type="radio" class="form-control" name="dog_size"
									value="소형" required> <label for="소형">소형</label>&nbsp;&nbsp;
								<input type="radio" class="form-control" name="dog_size"
									value="중형"> <label for="중형">중형</label>&nbsp;&nbsp; <input
									type="radio" class="form-control" name="dog_size" value="대형">
								<label for="대형">대형</label>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">발견일시</label>
							<div class="col-md-6">
								<input type="date" id="found_date" class="form-control"
									name="found_date" min="2020-01-01" required>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">발견장소</label>
							<div class="col-md-6 flex ">
								<div class = "flex_row_start">
									<input type="text" class="form-control"  id="address_display" name="found_location" placeholder = "주소 검색 버튼을 클릭하세요" required>
									<input type = "button" class = "addressBtn btn btn-primary" onclick="DaumPostcode()" value = "주소 검색">
								</div>
								<div id = "map_wrap" class = "mt-3" style = "display:none; position:relative;">
									<div id="lost_map"  style = "width : 500px; height: 400px; display:none"></div>
									<div class="hAddr"><span id="centerAddr"></span> </div>
									<span id = "lost_map_guide" class = "color_blue" style = "display:none;">*지도에서 위치를 클릭해서 주소를 입력해주세요</span><br>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">특이사항</label>
							<div class="col-md-6">
								<input type="text" class="form-control" name="dog_note" maxlength="1000" placeholder = "예) 빨간 가슴줄을 하고 있었어요, 겁이 많아요">
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">내용</label>
							<div class="col-md-6">
								<textarea id="form_message" name="content" class="form-control"
									rows="6"
									placeholder="보호하고 있거나 찾고 있는 강아지에 대한 정보를 적어주세요.&#10;정보는 구체적일수록 좋습니다!"
									required></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label
								class="col-md-4 col-form-label text-md-right color_blue lost_found_label">사진</label>
							<div class="col-md-6">
								<!-- @@@@@@@@사진 첨부@@@@@@@@222 -->
								<div class = "uploadDiv">
									<input type = "file" name = "frontImage" id = "frontImage" accept = "image/*" required title = "사진을 업로드 해주세요.">
									<img id='front_view' style ="display:none;" src = "">
								</div>
							</div>
						</div>
						
						<input type="hidden" class="form-control" name="member_id" value="${customers.member_id }">
						<input type = "hidden" id = "coords"  name = "coords" value = "">
						<input type = "hidden" id = "lat" name = "y" >
						<input type = "hidden" id = "lng"  name = "x" >
						
						<div class="pb-5 pt-5 text-center">
							<button id = "submitBtn" type="submit" class="btn btn-primary">등록하기</button>
						</div>

					</form>
				</div>
				
				</div>
			</div>
		</div>
</section>
<!--====  end of contents  ====-->
	
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
				        $("#front_view").attr("src", aImg.target.result)
			        }
			        reader.readAsDataURL(e.target.files[0])
			        
			        $("#front_view").show();
			    })
			</script>

	<!-- readonly -->
	<script>
		$(function(){
		    $("#address_display").on('keydown paste', function(e){
		        e.preventDefault();
		    });
			
		});		
	</script>

	<!-- 데이트 피커 오늘 날짜로 기본값 설정 -->
		<script>
	    	$(document).ready(function(){
	    		var date = new Date();
	    		
	    		var day = date.getDate();
	    		var month = date.getMonth() + 1;
	    		var year = date.getFullYear();
	    		
	    		if(month < 10) month = "0" + month;
	    		if(day < 10) day = "0" + day;
	    		
	    		var today = year + "-" + month + "-" + day;
	    		$("#found_date").attr({value : today, max : today });
	    	});
	    </script>


    <!-- 주소 검색용 우편번호 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 주소 검색용 카카오맵 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fffa8a8e4c6b7163952ecf2f1685ecd9&libraries=services"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/lost_map.js" ></script>
    

<%@include file="../../includes/footer.jsp"%>