<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" class="reservation_ID" name="reservaion_ID" value="${vo.reservation_ID }">
	<input type="hidden" class="locationJSON" name="locationJSON" value='${vo.locationJSON }'>
	<div id="map" style="width: 100%; height: 350px;"></div>
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=120117830cb36f64bd2dd6f74cd41ec0&libraries=services"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/pathline.js?v=15"></script>

	<script>pathLine()</script>
</body>
</html>