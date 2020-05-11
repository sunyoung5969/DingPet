<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function cancleBtn(){
    	return location.href='/';
    }
   
</script>

<div class="main">
	<section class="signup">
		<div class="container">
			<div class="signup-content">
				<div class="change-form">
				
				<h2 class="form-title">펫시터 정보 조회</h2>
					
				<form method="POST" class="register-form" id="register-form" action="apply">
              		
					<div class="form-group">
					성별<br>
					여성<input type="radio" id="sex" name="sex" value="F" checked="checked"/>
					남성<input type="radio" id="sex" name="sex" value="M" />
					</div>
                        
					<div class="form-group">
					생년월일<input type="date" name="date_of_birth" id="date_of_birth" min="2020-01-01" placeholder="Your DOB" required/>
					</div>
                            
					<div class="form-group">
					직업<input type="text" name="profession" id="profession" placeholder="Your job" maxlength="10" required/>
					</div>
	
					<div class="form-group" id="address">
					주소<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호">
						<input id = "post_btn" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						 
						<input type="text" id="sample4_roadAddress" name="address1" placeholder="도로명주소"> 
						<input type="text" id="sample4_jibunAddress" name="address2" placeholder="지번주소">
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" id="sample4_detailAddress" name="address3" placeholder="상세주소" maxlength="50">
						<input type="text" id="sample4_extraAddress" name="address4" placeholder="참고항목">
					</div>

					<div class="form-group">
					활동가능시간<input type="text" name="active_hours" id="time" placeholder="Your time available" required/>
					</div>
                            
					<div class="form-group">
                    Q1. 펫시터를 지원하게 된 동기가 무엇인가요?<br>
					<input type="text" name="answer1" id="firstA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
					</div>
                         
					<div class="form-group">
                    Q2. 현재 강아지를 기르고 계신가요? <br>
					<input type="text" name="answer2" id="secA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
					</div>
                         
					<div class="form-group">
                    Q3. 다른 사람의 강아지를 돌봐준 경험이 있나요? <br>
					<input type="text" name="answer3" id="thirdA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
					</div>
                  
					<div class="form-group form-button">
					<input type="submit" name="apply" id="apply" class="form-submit" value="신청" />
					<input type="submit" name="cancle" id="cancle" class="form-submit" onClick="cancleBtn()" value="취소" />
					</div>
                    
                    <div class="form-group form-button">
					<input type="hidden" id="member_id" name="member_id" value="${customers.member_id}">  
					</div>
					
				</form>    
				</div>
			</div>
		</div>
	</section>
	</div>




<%@include file="../../includes/footer.jsp"%>
