<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>DingPet_시설지도</title>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}
.hAddr {
	position:absolute;
	right:30px;
	top:30px;
	border-radius: 2px;
	background:#fff;
	background:rgba(255,255,255,0.8);
	z-index:1;
	padding:5px 10px;
	border: 1px solid #088cf3;}
#centerAddr {
	display:block;
	margin-top:2px;
	font-weight: normal;}
.map_wrap {
	position: relative;
	width: 100%;
	height: 700px;
}

#category {
	position: absolute;
	top: 30px;
	left: 30px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://www.dingpet.shop/imgs/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

.btnWrap{
	position:absolute;
	right: 30px;
	bottom:30px;
	z-index:1;
}

.myBtn{
	font-size: 16px;
    border-radius: 30px !important;
    background-color : #088cf3;
    border:none;
}

.m_container{
	height:auto;
}
</style>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
</head>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<body>
<div style="padding-top:87px" class = "nanumbarungothic section_space_bottom">
	    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/fa.jpg'); height : 400px;transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
             <h1 class=" color_white" style="font-family:GmarketSansBold; font-size:2.5rem !important">동반시설 지도</h1>
             <p  class = "pl-2 d-inline-block  color_white " style="font-size:18px;">애견동반 플레이스를 소개해드립니다.</p>
        </div>
    </div>
</div>
	
	
	<section class="site-blocks-cover overflow-hidden ">
		<div class="m_container" style="height:100%;">
				<div class="col-md-12 align-self-center" style="height:100%;">
					<!-- 임시 메뉴 -->
					<p style="margin-top: -12px">
					</p>					
					<input type="hidden" name="lat" id="latitude">
					<input type="hidden" name="lit" id="longitude">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 700px; position: relative; overflow: hidden;"></div>
						<ul id="category">
							<li id="HP9" data-order="2"><span class="category_bg pharmacy"></span>
							병원</li>
							<li id="HP2" data-order="0"><span class="category_bg bank"></span>
							약국</li>
							<li id="CA7" data-order="4"><span class="category_bg cafe"></span>
							카페</li>
							<li id="RE7" data-order="3"><span class="category_bg oil"></span>
							식당</li>
							<li id="HT7" data-order="5"><span class="category_bg store"></span>
							호텔</li>
						</ul>
						<div class="hAddr"><span id="centerAddr"></span> </div>
						<div class="btnWrap">
							<input class="myBtn" id="mylocation" type="button" value=" 내 현재 위치로 이동 " />
						</div>
					</div>

				</div>
		</div>
	</section>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d603c9ceea19aeba68479415b917d4&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/resources/js/facilitymap.js?v=<%=System.currentTimeMillis() %>" type="text/javascript"></script>
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>