<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../includes/header.jsp"%>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/">
 -->
 
<style>

.page-title{
    font-size: 28px;
    font-weight: 600;
    padding-top: 10px;
    padding-bottom: 15px;
    width: 67%;
    left: 75px;
    display: inline-block;
    position: relative;
}

.walkform{
    display: inline-block;
    float: right;
}

.walkbtn{
	background: #fff;
    border: solid 1px #30a430 !important;
    color: #30a430 !important;
    box-shadow: none !important;
}

.info-part1{

	padding: 20px;
}

.title-container{
	padding: 25px 0;
}

.log-container{
	min-height: 15vh;
    border: solid 1px;
    border-color: gray;
    border-radius: 10px;
    margin-top: 3vh;
    margin-bottom: 3vh;
}


.log-time{
    margin: 0;
    padding: 7px 7px;
}

.log-tilte{
    margin: 0px;
    padding: 5px;
}

.log-content-div{
	text-align: center;
    padding-bottom: 15px;
    padding-left: 10px;
    padding-right: 10px;}

.log-content{
    font-size: 13px;
}

.log-pic{
	width: 100%;
	padding: 10px;
}

.map-div{
	width: 94% !important;
	margin: 10px;
}

@media screen and (max-width: 770px) {
	
	.main-raised {
	   margin: -10% 3% 7%
	}
	
	.info-part1{
		padding: 0px;
	}
	
	.page-title{
		font-size: 4vw !important;
		left: 0px;
    	width: 100%;
	}
	
	.walkform{
		display: block;
		float: none;
		text-align: center;
		width: 100%;
	}
	.walkbtn{
		width: 88%;
	}
	
}

@media screen and (max-width: 425px) {
	
	.page-title{
		font-size: 5vw !important; 
	}

}




</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--====  str of contents  ====-->
	<section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
			<div class="profile-content">
				<div class="container pb-5">
						<div class="title-container">
							<div class="text-center heading-section">
								<h2 class="page-title">일지 등록 페이지입니당</h2>
								<form action="/petsitting/p003/logregister" class="walkform" align="right">
			                       	<input type="hidden" name="reservation_ID" value="${reservation_ID }">
			                       	<input type="submit" class="walkbtn" value='일지 작성'>
								</form>
							</div>
	                    </div>
	                   	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d603c9ceea19aeba68479415b917d4"></script>
						
						<div class="info-part1">
							<div class="info-part1--contents" align="center">
								<input type="hidden" class="register" value=${regitser }>
								<input type="hidden" class="receive_ID" value=${receive_ID }>
								<input type="hidden" class="walkcount" value="${count }">
								<% int i = 0; %>
								<c:forEach var="list" items="${list }" varStatus="statuss">
									<input type="hidden" class="log_ID" name="log_ID" value="${list.log_ID }">
									<input type="hidden" class="locationJSON_<%=i %>" value='${list.locationJSON }'>
									<div class="log-container">
										<div>
											<h3 class="log-time" align="left"> ${list.log_Date } </h3>
										</div>
										<div>
											<h5 class="log-tilte">${list.log_Title }</h5>
										</div>
										<c:if test="${list.log_Type == 'nomal'}">
										<div>
											<img class="log-pic" src="/resources/images/dogger_img_sm_4.jpg">
										</div>
										</c:if>
										<c:if test="${list.log_Type == 'walk' }">
											<div class="map-div" id="map_<%=i++ %>" value="${list.log_ID }" style="width: 100%; height: 350px;"></div>
										</c:if>
										<div class="log-content-div">
											<small class="log-content">${list.log_Content }</small>
										</div>
									</div>
								</c:forEach>
											
						<script>
							function map (){

							// ------------------------ 중심 좌표 구하기 ------------------------------
								//var map = new Array();
								var latArr = new Array();	// 위도 담을 배열
								var litArr = new Array();	// 경도 담을 배열
								var minLat = '';			// 위도 중 제일 작은 값
								var maxLat = '';			// 위도 중 제일 큰 값
								var minLit = '';			// 경도 중 제일 작은 값
								var maxLit = '';			// 경도 중 제일 큰 값

								var count = $(".walkcount").val();
								console.log(count)
								var logID = '';
								for(var i=0; i<count; i++){
									latArr = [];
									litArr = [];
									//console.log($(".locationJSON_"+i).val().toString())
									var strJSON = $(".locationJSON_"+i).val();	// JSON 문자열 가져오기
									var jsonOb = '';
									
									var jsonparse = JSON.parse(strJSON);		// JSON문자열 파싱
									
									for(var j=0; j<jsonparse.count; j++){
										jsonOb = jsonparse['location_'+j];		// JSON안의 객체 가져오기
									
										latArr.push(jsonOb.lat);				// 위도들 배열에 담기
										litArr.push(jsonOb.lit);				// 경도들 배열에 담기
									}
									latArr.sort();		// 정렬
									litArr.sort();		// 정렬
									
									minLat = latArr[0];
									minLit = litArr[0];
									maxLat = latArr[latArr.length-1];
									maxLit = litArr[litArr.length-1];
									
									var centerLat = parseFloat(minLat) + ((maxLat - minLat) / 2);	// 위도 중심좌표 구하기
									var centerLit = parseFloat(minLit) + ((maxLit - minLit) / 2);	// 경도 중심좌표 구하기

								// ---------------------------------------------------------------------									
									
						      		logID = "map_";
						      		logID += i;
						      		console.log(logID);
							  		var mapContainer = document.getElementById("map_"+i) // 지도를 표시할 div
							  		console.log("맵컨테이너" + mapContainer)
							  		//centerLat *= 1;
							  		//centerLit *= 1;
							  		console.log("센터값 머들어가 = "+centerLat)
							  		console.log("센터값 머들어가 = "+centerLit)
							  		mapOption = {
							  		center : new kakao.maps.LatLng(centerLat, centerLit), // 지도의 중심좌표
							  		level : 5		// 지도의 확대 레벨
							  		};
							  		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							  		
							  		
							  		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
							  		var linePath = new Array();
							  		
							  		for(var k=0; k<jsonparse.count; k++){
							  			linePath.push(new kakao.maps.LatLng(jsonparse['location_'+k].lat, jsonparse['location_'+k].lit));
							  		}

							  		console.log(linePath)

							  		// 지도에 표시할 선을 생성합니다
							  		var polyline = new kakao.maps.Polyline({
							  			path : linePath,			// 선을 구성하는 좌표배열 입니다
							  			strokeWeight : 5,			// 선의 두께 입니다
							  			strokeColor : '#37c5be',	// 선의 색깔입니다
							  			strokeOpacity : 0.7,		// 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
							  			strokeStyle : 'solid'		// 선의 스타일입니다
							  		});

							  		// 지도에 선을 표시합니다
							  		polyline.setMap(map);
								}
							}
							
					    </script>
								<script>map()</script>
								
								<div class="log-container">
									<input type="hidden" class="log_ID" name="log_ID">
									<div>
										<h3 class="log-time" align="left"> 2020/05/01 14:44 </h3>
									</div>
									<div>
										<h5 class="log-tilte"> 일 지 타 이 틀</h5>
									</div>
									<div>
										<img class="log-pic" src="/resources/images/dogger_img_sm_4.jpg">
									</div>
									<div class="log-content-div">
										<small class="log-content"> 일지 내용 입니다 여기에 적어주세요 뭐했는지 여기에 내용이 나옵니다일지 내용 입니다 여기에 적어주세요 뭐했는지 여기에 내용이 나옵니다일지 내용 입니다 여기에 적어주세요 뭐했는지 여기에 내용이 나옵니다</small>
									</div>
								</div>
								
								<div class="log-container">
									<div>
										<h3 class="log-time" align="left"> 2020/05/01 14:44 </h3>
									</div>
									<div>
										<h5 class="log-tilte"> 일 지 타 이 틀</h5>
									</div>
									<div class="map-div" id="map" style="width: 100%; height: 350px;"></div>
									<div class="log-content-div">
										<small class="log-content"> 일지 내용 입니다 여기에 적어주세요 뭐했는지 여기에 내용이 나옵니다일지 내용 입니다 여기에 적어주세요 뭐했는지 여기에 내용이 나옵니다일지 내용 입니다 여기에 적어주세요 뭐했는지 여기에 내용이 나옵니다</small>
									</div>
								</div>
							
							</div>
						</div>						
					
					</form>
				</div>
			</div>
		</div>
	</section>


    <!--====  end of contents  ====--> 
<%@include file="../../includes/footer.jsp"%>
	<script>

		setTimeout(function() {
			if($(".register").val()=='Y'){
				console.log("여기타니??222222")
				formnotice();
				console.log("여기타니??333333333")
			}
		}, 500);
				
		
		function formnotice(){
			
			var noticeData = {
				"notice_Type" : "일지",						// 알림 유형(예약, 유기견찾기, 유기견보호)
				"member_ID" : $(".receive_ID").val(),		// 받는 사람의 아이디
				"sender_ID" : $(".member_ID").val(),		// 보내는 사람의 아이디
	/*알림내용*/	"notice_Contents" : "새로운 일지가 등록 되었습니다.",
				"url" : "petsitting/p003/loglookup?reservation_ID=" + $(".reservation_ID").val()	// 알림 메시지 클릭 시 이동할 매핑주소
			}
			console.log("1111111111111111111111111111111")
			//스크랩 알림 DB저장
			$.ajax({
				type : 'post',
				url : '/common/notice/setNotice',		// 알림 데이터 디비에 삽입하는 곳으로 매핑
				data : noticeData,
				dataType : 'json',
				async: false,
				success : function(data){
					console.log("22222222222222222222222222222")
					
					if(socket){		// 열려있는 소켓이 있으면
						console.log("3333333333333333333333333333333333")

						// websocket에 보내기 (reserved, 보내는사람, 받는사람, 예약번호)
						let socketMsg = "reserved,"+ $(".member_ID").val()+","+$(".receive_ID").val()+","+"20938123";
						console.log("msg : " + socketMsg);	// 실시간 알림메시지 확인
						socket.send(socketMsg);				// 실시간 알림 메시지 전송
						console.log("44444444444444444444444444444444444")

					}
				},
				error : function(err){
					console.log(err);
				}
			});
		}
</script>