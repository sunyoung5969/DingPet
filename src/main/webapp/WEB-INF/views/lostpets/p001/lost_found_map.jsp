<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
	
	
	 <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);">
			<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
                  	<h1 class="mb-2 color_white">임시보호 견 상세 정보</h1>
           	</div>	
        </div>
	<div class="container ">
		<div class="row">
			<div class="col-xs-12  m-5">
				<div id = "whole_map_container" style = "width : 1200px; height : 1000px;"></div>
				
			</div>
		</div>
	</div>
</section>
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fffa8a8e4c6b7163952ecf2f1685ecd9&libraries=services"></script>
	<script src = "${pageContext.request.contextPath}/resources/js/lost_found_map.js"></script>
	
	
	
	   <!--====  end of contents  ====-->    

<%@include file="../../includes/footer.jsp"%>