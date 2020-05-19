<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">

<style>
.map_wrap {position:relative;width:100%;}
 .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;
    	border: 1px solid #088cf3;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
</style>



    <!--====  str of contents  ====-->
    <section class = "nanumbarungothic" style="padding-top:87px">
        <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); 
        	transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-5 pb-5" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h1 class="color_dark_blue narrow mb-2" style="font-family:GmarketSansBold;">반려견 찾기 상세 정보</h1>
                        </div>
                    </div>
                    <!-- 제목, 작성자, 작성일시-->
                    <div class="ml-3 mr-3 mt-3 align-self-center pb-3">
	                	<h2 class = "mb-2 color_blue" ><c:out  value = "${board.title}"/></h2>
	                    <div class = "top_info">
		    	            <span><strong><c:out value = "${board.member_nickname}"/></strong></span>
		    	            <span id = "board_date"></span>
	                    </div>
                   	</div>
                   	<hr class = "hr_style">
                    <div class="col-12 row pt-3 dp-webkit ">
                            <div class="image-block bg-about w-100 text_center" >
                                <img class="img-fluid m-auto" src="https://www.dingpet.shop/lost/${board.front_name}"  style = "max-width:900px;height: 400px;">
                            </div>
                    </div>
                     <div class="col-12 row pt-3 dp-webkit ">
                    	<div class="align-self-center w-100 ">
                    		<!-- 반려견 정보 -->
                    		<h3 class = "color_blue mt-5">반려견 정보</h3>
                    		<div class = "round_border mt-3 mb-4">
	                            <div class = "flex_row mx-5 mt-3">
		                            <div class="nav-tabs d-inline-block w-50">
		                            	<div class="mt-1 color_blue pt-3 pb-3"><strong>이름</strong> </div>
		                                <div class="pl-3 pb-3">
		                                    <span class="h6"><c:out  value = "${board.dog_name}"/></span>
		                                </div>
		                            </div>
		                            <div class="nav-tabs d-inline-block w-50">
				                    	<div class="mt-1 color_blue pt-3 pb-3"><strong>견종</strong> </div>
				                        <div class="pl-3 pb-3">
				                            <span class="h6"><c:out  value = "${board.dog_breed}"/></span>
				                        </div>
				                    </div>
				                </div>
	
				                <div class = "flex_row mx-5">
		                            <div class="nav-tabs d-inline-block w-50">
				                    	<div class="mt-1 color_blue pt-3 pb-3"><strong>성별</strong> </div>
				                        <div class="pl-3 pb-3">
				                            <span class="h6"><c:out  value = "${board.dog_sex}"/></span>
				                        </div>
				                    </div>
		                            <div class="nav-tabs d-inline-block w-50">
				                    	<div class=" mt-1 color_blue pt-3 pb-3"><strong>크기</strong> </div>
				                        <div class="pl-3 pb-3">
				                            <span class="h6"><c:out  value = "${board.dog_size}"/></span>
				                        </div>
				                    </div>
			                    </div>
			                    <div class="nav-tabs mx-5 mb-5">
			                    	<div class=" mt-1 color_blue pt-3 pb-3"><strong>특이사항</strong> </div>
			                        <div class="ml-2 pb-3">
			                            <span class="h6"><c:out  value = "${board.dog_note}"/></span>
			                        </div>
			                    </div>
		                    </div>
		                    <!-- 반려견 정보 끝  -->
		                    <!-- 발견 정보 -->
							<h3 class = "color_blue mt-5">실종 정보</h3>	
		                    <div class = "round_border mt-3 mb-4">
			                    <div class = "m-5 flex_row">
			                    	<div class = "col-xs-12 w-50 d-inline-block">
			                    	<div class = "map_wrap">
				                    	<div id = "lost_map_display" style = "width : 400px; height : 400px;"></div>
				                    	<div class="hAddr"><span id="centerAddr"></span> </div>
			                    	</div>
			                    	</div>
			                    	<div class = " col-xs-12 w-40 d-inline-block">
				                    	<div class = "flex_row_align_center">
				                            <div class="nav-tabs">
				                            	<div class=" mt-1 color_blue pt-3 pb-3"><strong>실종 날짜</strong> </div>
				                                <div class="pl-3 pb-3">
				                                    <span class="h6"><c:out  value = "${board.found_date}"/></span>
				                                </div>
				                            </div>
				                            <div class="nav-tabs">
				                            	<div class=" mt-1 color_blue pt-3 pb-3"><strong>실종 장소</strong> </div>
				                                <div class="pl-3 pb-3">
				                                    <span class="h6"><c:out  value = "${board.found_location}"/></span>
				                                </div>
				                            </div>
			                    		</div>
			                    	</div>
	                            </div>
                     		</div>
                     		<!-- 발견 정보 끝-->
                     		<!-- 내용 -->
                     		<h3 class = "color_blue mt-5">내용</h3>	
		                    <div class = "round_border mt-3 mb-4">
                     		<div class="m-5">
			                    	<pre class = "h6" style = "border : none !important;"><c:out  value = "${board.content}"/></pre>
		                    </div>
		                    <!-- 내용 끝 -->
                        </div>
                     
                    
		            <!-- 확인요청 --> 
					<%@include file="../../lostpets/p001/requestModal.jsp"%>
					<div class = "small_space">
	                    <hr class = "hr_style">
					</div>
					<!-- 댓글 -->              
                    <%@include file="../../lostpets/p001/reply.jsp"%>
                     
					<!-- buttons -->
					<div class="text-center pb-5">
						<button data-oper="list" class="btn-sm btn btn-primary mr-3">목록으로</button>
						<c:choose >
							<c:when test = "${customers.member_id == board.member_id}"> 
								<button data-oper="modify" class="btn-sm btn btn-primary">수정</button>
								<button data-oper="delete" class="btn-sm btn btn-primary">삭제</button>
							</c:when>
							<c:when test = "${not empty customers.member_id}">
								<button id="confirmation_request" class="btn btn-primary">확인 요청</button>
							</c:when>
						</c:choose>
					</div>
					<!-- buttons end--> 
					</div>
					</div>
            </div>
        </div>
      </section>
					
					<!--submitting hidden parameters -->
					<form id='operForm' action='modify' method='get'>
						<input type="hidden" id="board_id" name="board_id" value="${board.board_id }" />
						<input type="hidden" id="dog_id" name="dog_id" value="${board.dog_id }" />
						<input type="hidden" name="pageNum" value="${cri.pageNum }"> 
						<input type="hidden" name="amount" value="${cri.amount }">
					</form>
					<!-- submitting hidden parameters ends -->
					
					<!-- 버튼 처리 -->
					<script type="text/javascript">
                     	$(document).ready(function(){
                        	var operForm = $("#operForm");
                            //수정 버튼
                            $("button[data-oper = 'modify']").on("click", function(e){
	                            	operForm.attr("action", "modify").submit();
                            });
                            //삭제 버튼
                            $("button[data-oper = 'delete']").on("click", function(e){
                            	if(confirm("정말 삭제하시겠어요?")){
                            		operForm.attr({action : 'delete', method : 'post'}).submit();
                            	}else{
                            		return;
                            	}
                            })
                            //목록으로 버튼        		
                           	$("button[data-oper = 'list']").on("click", function(e){
                           		 operForm.find("#dog_id").remove();
                                 operForm.find("#board_id").remove();
                                 operForm.attr("action", "list").submit();
                            });
                     	});
		           	</script>
		           	<!-- 버튼 처리 끝 -->
					
					
					
					

	<!-- 발견장소 표시용 카카오맵 API -->
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fffa8a8e4c6b7163952ecf2f1685ecd9&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('lost_map_display'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${board.found_location}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">발견 장소</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		
	    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	    kakao.maps.event.addListener(map, 'idle', function() {
	        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	    });
	    
	    
	    function searchAddrFromCoords(coords, callback) {
	        // 좌표로 행정동 주소 정보를 요청합니다
	        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	    }

	    function searchDetailAddrFromCoords(coords, callback) {
	        // 좌표로 법정동 상세 주소 정보를 요청합니다
	        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    }

	    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	    function displayCenterInfo(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var infoDiv = document.getElementById('centerAddr');

	            for(var i = 0; i < result.length; i++) {
	                // 행정동의 region_type 값은 'H' 이므로
	                if (result[i].region_type === 'H') {
	                    infoDiv.innerHTML = result[i].address_name;
	                    break;
	                }
	            }
	        }    
	    }
		</script>			                    	
			
    <!--====  end of contents  ====-->    

<%@include file="../../includes/footer.jsp"%>