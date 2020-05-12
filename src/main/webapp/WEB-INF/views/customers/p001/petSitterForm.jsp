<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
	
	var formObj = $("form");
		
	$('input').on("click", function(e){
			
	e.preventDefault(); //기본 동작 막음   
			
		var operation = $(this).data("oper");
		console.log(operation);
			
		if(operation === 'approval'){
			formObj.attr("action", "/customers/p001/approval");
			alert("펫시터회원 승인완료");
			//return location.href='/customers/p001/admin_board';
			
		}else if(operation  === 'reject'){
			formObj.attr("action", "/customers/p001/reject");
			alert("펫시터회원 승인거절");
			//return location.href='/customers/p001/admin_board';
		}
		
			formObj.submit();
			return location.href='/customers/p001/admin_board';
		});
});
   
</script>

<div class="main">
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
				
				<h2 class="form-title">펫시터 신청서</h2>
					
				<form method="POST" class="register-form" id="register-form" action="apply">
              		<div class="form-group">
					<strong>아이디</strong>
					<input type="text" name="member_id" value="<c:out value="${info.member_id}" />" readonly="readonly" />
					</div>
       
					<div class="form-group">
					<strong>이름</strong>
					<input type="text" name="member_name" maxlength="20" value="<c:out value="${info.member_name}" />" />
					</div>
                            
					<div class="form-group">
					<strong>닉네임</strong>
					<input type="text" name="member_nickname"  maxlength="20" value="<c:out value="${info.member_nickname}" />" />
   					</div>
                            
					<div class="form-group">
					<strong>연락처</strong>
					<input type="text" name="member_contact" maxlength="20" value="<c:out value="${info.member_contact}" />" />
					</div>
                            
					<div class="form-group">
					<strong>이메일</strong>
					<input type="text" name="member_email"  maxlength="20" value="<c:out value="${info.member_email}" />" >
					</div>
              		
					<div class="form-group">
					<strong>성별</strong>
					<input type="text" id="sex" name="sex" value="<c:out value="${info.sex}" />" />
					</div>
                        
					<div class="form-group">
					<strong>생년월일</strong>
					<input type="text" name="date_of_birth" id="date_of_birth" value="<c:out value="${info.date_of_birth}" />" />
					</div>
                            
					<div class="form-group">
					<strong>직업</strong>
					<input type="text" name="profession" id="profession" value="<c:out value="${info.profession}" />" />
					</div>
	
					<div class="form-group" id="address">
					<strong>주소</strong>   
					<input type="text" id="sample4_postcode" name="zipcode" value="<c:out value="${info.zipcode}" />">
					<input type="text" id="sample4_roadAddress" name="address1" value="<c:out value="${info.address1}" />"> 
					<input type="text" id="sample4_jibunAddress" name="address2" value="<c:out value="${info.address2}" />">
					<span id="guide" style="color: #999; display: none"></span> 
					<input type="text" id="sample4_detailAddress" name="address3" value="<c:out value="${info.address3}" />">
					<input type="text" id="sample4_extraAddress" name="address4" value="<c:out value="${info.address4}" />">
					</div>

					<div class="form-group">
					<strong>활동가능시간</strong>
					<input type="text" name="active_hours" id="time" value="<c:out value="${info.active_hours}" />">
					</div>
					<br>
					
					<div class="form-group">
                    <strong>Q1. 펫시터를 지원하게 된 동기가 무엇인가요?</strong><br>
					<input type="text" name="answer1" id="firstA" value="<c:out value="${info.answer1}" />">
					</div>
                         
					<div class="form-group">
                    <strong>Q2. 현재 강아지를 기르고 계신가요?</strong><br>
					<input type="text" name="answer2" id="secA" value="<c:out value="${info.answer2}" />">
					</div>
                         
					<div class="form-group">
                    <strong>Q3. 다른 사람의 강아지를 돌봐준 경험이 있나요?</strong><br>
					<input type="text" name="answer3" id="thirdA" value="<c:out value="${info.answer3}" />"/>
					</div>
                  
					<div class="form-group form-button" align="center">
					<input type="submit" data-oper='approval' class="form-submit" value="승인" />
					<input type="submit" data-oper='reject' class="form-submit" value="거절" />
					</div>
				</form>  
				  
				</div>
			</div>
		</div>
	</section>
</div>


<%@include file="../../includes/footer.jsp"%>
