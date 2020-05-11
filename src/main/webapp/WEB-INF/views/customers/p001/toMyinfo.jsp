<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">



<div class="main">
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		
		<div><h4 align="center">개인정보조회를 위해 비밀번호를 한 번 더 입력하세요</h4></div>

		<form method="post" action="toMyinfo">
		<input type="password" name="member_pwd">
		<input type="submit" value="확인" class="btn btn-primary">
		<input type="hidden" id="member_id" name="member_id" value="${customers.member_id}">  
		</form>

	</div>	
	</div>
	</div>
	</section>
</div>


<%@include file="../../includes/footer.jsp"%>