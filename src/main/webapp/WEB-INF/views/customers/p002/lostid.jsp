<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">	
	function find_id(){
		var findId = document.findIdForm;
		var cust_id = findId.member_email.value;
			
		if(cust_id == '' || cust_id.length == 0){
			alert("이메일을 입력해주세요");
		}else{
			findId.method = "post";
			findId.action = "lostid";
			findId.submit();
		}
	}
</script>	 

<div class="main">

<!-- Sing in Form -->
	<section class="sign-in">
		<div class="container">
			<div class="signin-content">
				<div class="signin-form">
				<h2 class="form-title">아이디 찾기</h2>

				<form action="lostid" method="post" name="findIdForm">
					<div>가입할 때 입력하신 메일주소를 기입하세요.</div>
					<input type="email" name="member_email" />
					<input type="button" onClick="find_id()" value="ID찾기" />
				</form>

				<h3>${_id} </h3>
				<h3>${no} </h3>		 
				</div>
			</div>
		</div>
	</section>
</div>

<%@include file="../../includes/footer.jsp"%>
