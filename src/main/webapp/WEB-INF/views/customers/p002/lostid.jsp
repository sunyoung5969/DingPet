<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">



<div class="main">
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		
		<h2 class="form-title">아이디 찾기</h2>

		<form action="lostid" method="post" name="findIdForm">
			<div><h4 align="center">가입할 때 입력하신 메일주소를 기입하세요.</h4></div>
			<input type="email" name="member_email" />
			<div style="color:blue">${yesID} ${noID}</div>
			
			<input type="button" onClick="find_id()" value="아이디 찾기" class="btn btn-primary"
			style="margin-top:5px" />
		</form>
		
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

	</div>	
	</div>
	</div>
	</section>
</div>


<%@include file="../../includes/footer.jsp"%>