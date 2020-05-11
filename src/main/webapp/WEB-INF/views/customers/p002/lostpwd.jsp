<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">



<div class="main">
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		
		<h2 class="form-title">비밀번호 찾기</h2>

		<form action="lostpwd" method="post" name="findPwForm">
			<div><h4 align="center">아이디와 가입할 때 입력하신 메일주소를 기입하세요.</h4></div>
			아이디<input type="text" name="member_id" id="member_id" />
			이메일<input type="email" name="member_email" id="member_email" />
			<input type="button" value="비밀번호 찾기" onClick="find_pw()" class="btn btn-primary" />
		</form>
		
		<h3>${yesID}</h3>
		<h3>${noID}</h3>

		
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

	</div>	
	</div>
	</div>
	</section>
</div>


<%@include file="../../includes/footer.jsp"%>