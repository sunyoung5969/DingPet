<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/790887e3ce.js" crossorigin="anonymous"></script>
<style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-size:12px;}
.map_wrap {position:relative;width:1200px;height:700px;}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	top: 30px;
	right: 200px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px 10px;
	border: 1px solid #088cf3;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#zero{
	position: absolute;
	bottom : 30px;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px 10px;
	border: none;
	text-align : center;
}

#category {position:absolute;top:30px;left:150px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;
padding-inline-start:0px;}
#category li {float:left;list-style: none;width:100px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:60px;height: 60px;}
#category li .category_bg {background:url('/resources/images/bg/sprite1.png') no-repeat;}
#category li .whole {background-position: -0px 0;}
#category li .lost {background-position: -0px -65px;}
#category li .find {background-position: 0px -130px;}
.placeinfo_wrap {position:absolute;bottom:50px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color: #2C2A2A;text-decoration: none;}
.placeinfo a, .placeinfo span {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.tag{padding: 3px 10px; background: #eee;}
.pl-2{margin-bottom:5px;}
.myBtn{position: absolute; cursor: pointer; right: 138px; top: 200px; color: #FFF; z-index: 1; font-size: 30px; background-color: #088cf3; padding: 5px; border-radius: 10px;}

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
	width: 1500px; /* Could be more or less, depending on screen size */
}

#closeBtn{
font-size:1em;
padding:0.5rem 1rem;
}

.fa-times{
	position : absolute;
	right:10px;
	top : 19px;
}

</style>

<!-- 확인 요청 모달 -->
<div id="modal" class="modal">
	<div class="modal-content">
		<div class="section_space_top text_center">
			<h2 class ="color_dark_blue narrow" style="font-family:GmarketSansBold;">실종견 지도</h2>
			<p  class = "pl-2 color_grey">카테고리를 클릭하시면 실종견 정보를 한눈에 보여드립니다.</p>
		</div>
		<div class = "content_area pt-3">
			<section class="nanumbarungothic">
				<div id="map_wrap" class="mt-3" style="position: relative;">
					<ul id="category" class="flex_column">
						<!-- <li id="whole" data-order="0"> <span class="category_bg whole "></span> 전체 보기</li> -->
				        <li id="lost" data-order="1"> <span class="category_bg lost "></span> 주인 찾기 </li>
			    	    <li id="find" data-order="2"> <span class="category_bg find"></span> 반려견 찾기 </li>
					</ul>
					<div id="map" style="width: 1200px; height: 700px;"class="m-auto"></div>
					<div class="hAddr">
						<span id="centerAddr"></span>
					</div>
					<div id = "zero" style="display:none;"><span>현재 지도 내에 표시할 결과가 없습니다.</span></div>
					<i class="fas fa-map-marker-alt myBtn" onclick='getLocation()' title="내 위치로"></i>
				</div>
			</section>
			<div class="section_space text-center">
				<button type = "button"id = "closeBtn" class="btn btn-primary">닫기</button> 
			</div>
		</div>
	</div>
</div>



<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fffa8a8e4c6b7163952ecf2f1685ecd9&libraries=services"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/lost_found_map.js?v=<%=System.currentTimeMillis() %>"></script>

