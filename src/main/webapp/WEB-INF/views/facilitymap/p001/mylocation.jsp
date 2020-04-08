<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

#btnStart {
	padding: 25px 30px;
}

#btnStop {
	padding: 25px 30px;
}
</style>
<meta charset="UTF-8">
<title>DingPet_산책하기</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d603c9ceea19aeba68479415b917d4"/>
<script>
	// 버튼 이벤트 추가  
	function bodyInit() {
		document.getElementById("btnTest1").addEventListener("click", btnTest);
		document.getElementById("btnTest3").addEventListener("click", btnTest3);
		document.getElementById("btnTest4").addEventListener("click", btnTest4);
		document.getElementById("btnTest5").addEventListener("click", btnTest5);
		document.getElementById("btnStop")
				.addEventListener("click", clearWatch);
	}
</script>
</head>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<body onload='bodyInit()'>
	<section class="site-blocks-cover overflow-hidden bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-12 align-self-center">
					<!-- 임시 메뉴 -->
					<button onclick="findLocation()">현재 위치의 위도와 경도</button>
					<p id="myLocation"></p>
					<p id="moveLocation"></p>

					<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

					<ul>
						<li>위도:<span id="latitude"></span></li>
						<li>경도:<span id="longitude"></span></li>
					</ul>
					<div class="btn-group">
						<input id="btnStart" type="button" value=" START " /> 
						<input id="btnStop" type="button" value=" STOP " /> 
						<input id="btnTest1" type="button" value="테스트 1" /> 
						<input id="btnTest3" type="button" value="테스트 3" /> 
						<input id="btnTest4" type="button" value="테스트 4" /> 
						<input id="btnTest5" type="button" value="테스트 5" />
					</div>
					<div id="map" style="width: 100%; height: 350px;"></div>
					<script src="${pageContext.request.contextPath}/resources/js/mapPoint.js" type="text/javascript"/>
					<p>
						<em>지도 Start 클릭하면 선 그리기가 시작되고<br>Stop 버튼을 클릭하면 선 그리기가
							종료됩니다
						</em>
					</p>
				</div>
			</div>
		</div>
	</section>
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>