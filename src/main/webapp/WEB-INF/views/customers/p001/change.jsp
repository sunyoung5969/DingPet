<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.11
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
    
    /*
    function applyBtn(){
    	alert("펫시터 회원 신청이 완료되었습니다.");
    	return location.href='/';
    }
    */
    
    function cancleBtn(){
    	return location.href='/';
    }
</script>

<div class="main">
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		<h2 class="form-title">펫시터 전환 신청</h2>
					
		<form method="POST" class="register-form" id="register-form" action="apply">    		
			<div class="form-group">
			<strong>성별</strong> &nbsp;&nbsp;&nbsp;
			여성<input type="radio" id="sex" name="sex" value="F" />
			남성<input type="radio" id="sex" name="sex" value="M" />
			</div>
                        
			<div class="form-group">
			<strong>생년월일</strong>
			<input type="date" name="date_of_birth" id="date_of_birth" min="2020-01-01" placeholder="Your DOB" required/>
			</div>
                            
			<div class="form-group">
			<strong>직업</strong>
			<input type="text" name="profession" id="profession" placeholder="Your job" maxlength="10" required/>
			</div>
	
			<div class="form-group" id="address">
			<strong>주소</strong>
			<input type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호">
			<input id = "post_btn" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						 
			<input type="text" id="sample4_roadAddress" name="address1" placeholder="도로명주소"> 
			<input type="text" id="sample4_jibunAddress" name="address2" placeholder="지번주소">
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" id="sample4_detailAddress" name="address3" placeholder="상세주소" maxlength="50">
			<input type="text" id="sample4_extraAddress" name="address4" placeholder="참고항목">
			</div>

			<div class="form-group">
			<strong>활동가능시간</strong>
			<input type="text" name="active_hours" id="time" placeholder="Your time available" required/>
			</div>
                            
			<div class="form-group">
			<strong>펫시터 전환 여부의 지표가 될 자료입니다. 성실하게 작성해 주세요.</strong>
			<br>
        	Q1. 펫시터를 지원하게 된 동기가 무엇인가요?<br>
			<input type="text" name="answer1" id="firstA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
			<br>           
        	Q2. 현재 강아지를 기르고 계신가요? <br>
			<input type="text" name="answer2" id="secA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
			<br> 
        	Q3. 다른 사람의 강아지를 돌봐준 경험이 있나요? <br>
			<input type="text" name="answer3" id="thirdA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
			</div>
                  
			<div class="form-group form-button" align="center">
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
