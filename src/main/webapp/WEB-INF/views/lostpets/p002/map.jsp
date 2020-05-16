<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커 생성하기</title>
   	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style>
	.map_wrap {position:relative;width:100%;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px 10px;
    	border: 1px solid #088cf3;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; }
</style>
</head>

<body>
<div id = "map_wrap" class = "mt-3" style = "position:relative;">
	<div id="map" style="width:100%;height:700px;"></div>
	<div class="hAddr"><span id="centerAddr"></span> </div>
</div>

<input type = "text" id = "check" width="20">
<button onclick='getLocation()'>눌러바</button>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fffa8a8e4c6b7163952ecf2f1685ecd9&libraries=services"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/lost_found_map.js?v=<%=System.currentTimeMillis() %>" ></script>
</html>

