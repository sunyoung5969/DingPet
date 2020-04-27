<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<div class="main">
	<section class="sign-in">
		<div class="container">
			<div class="signin-content">
				<div class="signin-form">
				
				<h2>정보조회를 위해 비밀번호를 한 번 더 입력하세요</h2>	
				<form method="post" action="toMyinfo">
					<input type="password" name="member_pwd">
					<input type="submit" value="확인">
				</form>
				
				</div>
			</div>
		</div>
	</section>
</div>

<%@include file="../../includes/footer.jsp"%>
