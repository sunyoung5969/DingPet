<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">	
	function find_pw(){
		var findPw = document.findPwForm;
		var cust_id = findPw.member_id.value;
		var cust_email = findPw.member_email.value;
				
		if((cust_id == '' || cust_id.lenth == 0) || (cust_email == '' || cust_email.length == 0)){
			alert("아이디와 이메일을 모두 입력해주셔야 합니다");
		}else{
			findPw.method = "post";
			findPw.action = "lostpwd";
			findPw.submit();
		}
	}
</script>	 


<div class="main">

<!-- Sing in Form -->
	<section class="sign-in">
		<div class="container">
			<div class="signin-content">
			
				<div class="signin-form">
				<h2 class="form-title">비밀번호 찾기</h2>
				
				<form action="lostpwd" method="post" name="findPwForm">
				아이디<input type="id" name="member_id" id="member_id" />
				이메일<input type="email" name="member_email" id="member_email" />
				<input type="button" value="pw찾기" onClick="find_pw()" />
				</form>
		
				<h3>${yespw}</h3>
				<h3>${nopw}</h3>		 
				</div>
				
			</div>
		</div>
	</section>
</div>

<%@include file="../../includes/footer.jsp"%>
