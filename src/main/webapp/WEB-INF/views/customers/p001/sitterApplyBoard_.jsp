<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<div class="main">

	<div align="center">
	<p><h3><strong>펫시터 신청이 완료 되었습니다.<br>관리자 승인 후 펫시터 활동이 가능합니다.</strong></h3></p>
	<a href="/">홈페이지로 이동</a>	
	<br><br>
	<figure>
	<img class="signinImg" 
		 src="${pageContext.request.contextPath}/resources/images/sign/dingpet02.jpg"
		 style="border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;">
	</figure>
	</div>

</div>

<style>
	.signinImg{ 
				width:50%;
	}
</style>

<%@include file="../../includes/footer.jsp"%>
