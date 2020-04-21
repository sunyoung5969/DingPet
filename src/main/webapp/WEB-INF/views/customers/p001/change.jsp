<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DingPet SignIn</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
    
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
</script>
    
</head>
<body>

     <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                
                
                    <div class="change-form">
                        <h2 class="form-title">펫시터 전환 신청</h2>
                        
                        <form method="POST" class="register-form" id="register-form" 
                        action="signup">
                        
                           <div class="form-group">
                           <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                이름<input type="text" id="name" name="member_name" placeholder="Your Name" required/>
                           </div>
                            
                            <div class="form-group">
                                <label for="contact"><i class="zmdi zmdi-lock"></i></label>
                               연락처<input type="text" name="member_contact" id="contact" placeholder="Password" required/>
                            </div>                   
                            
                            
                            <div class="form-group">
                                <label for="gender"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                성별<input type="text" name="sex" id="gender" placeholder="Your Name" required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="dob"><i class="zmdi zmdi-email"></i></label>
                                생년월일<input type="number" name="date_of_birth" id="dob" placeholder="Your DOB" required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="job"><i class="zmdi zmdi-email"></i></label>
                                직업<input type="text" name="profession" id="job" placeholder="Your job" required/>
                            </div>
	
							<div class="form-group">
								<label for="add"><i class="zmdi zmdi-email"></i></label> 
								주소
									<input type="text" id="sample4_postcode" placeholder="우편번호">
									<input id = "post_btn"type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
									<input type="text" id="sample4_roadAddress" placeholder="도로명주소"> 
									<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
									<span id="guide" style="color: #999; display: none"></span> 
									<input type="text" id="sample4_detailAddress" placeholder="상세주소" maxlength="50">
									<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							</div>


							<div class="form-group">
                                <label for="time"><i class="zmdi zmdi-email"></i></label>
                               활동가능시간<input type="text" name="active_hours" id="time" placeholder="Your address" required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="firstA"><i class="zmdi zmdi-email"></i></label>
                        Q1. 다른 사람의 강아지를 돌봐준 경험이 있나요?<br>
                        <input type="text" name="answer1" id="firstA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
                         </div>
                         
                         <div class="form-group">
                       			 <label for="secA"><i class="zmdi zmdi-email"></i></label>
                        Q2. 다른 사람의 강아지를 돌봐준 경험이 있나요? <br>
                        <input type="text" name="answer2" id="secA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
                         </div>
                         
                         <div class="form-group">
                        		<label for="thirdA"><i class="zmdi zmdi-email"></i></label>
                        Q3. 다른 사람의 강아지를 돌봐준 경험이 있나요? <br>
                        <input type="text" name="answer3" id="thirdA" placeholder="50자 이내로 기입하세요" maxlength="100" required/>
                            </div>
                  
                            
                            <div class="form-group form-button">
                                <input type="submit" name="apply" id="apply" class="form-submit" value="신청" />
                                <input type="reset" name="cancle" id="cancle" class="form-submit" value="취소" />
                            </div>
                            
                        </form>    
                    </div>
                    
                    
                </div>
            </div>
        </section>

    </div>
    

    <!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

    
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>