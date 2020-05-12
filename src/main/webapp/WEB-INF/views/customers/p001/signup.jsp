<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	//pw일치체크 함수
	function passwordCheck() {
		var member_pwd = $('#member_pwd').val();
		var re_member_pwd = $('#re_member_pwd').val();
	
		if (member_pwd != re_member_pwd) {
			$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');
		}else{
			$('#passwordCheckMessage').html('');
		}
	}
   
 	//id중복체크 함수
	function id_Check(){
		var memberID = $('#member_id').val();
		$.ajax({
			type:"post",
			url:"/customers/p001/possibleId",
			data: {id : memberID},
			success: function(data, textStatus){
				if(data == "usable"){
					$('#idCheckMessage').html('사용가능한 아이디');
				}else{
					$('#idCheckMessage').html('사용불가능한 아이디');
				}
			}
		})
	}
 	
	//email중복체크 함수
	function email_Check(){
 		
		var memberEmail = $('#member_email').val();
	
		$.ajax({
			type:"post",
			url:"/customers/p001/possibleEmail",
			data: {email : memberEmail},
			success: function(data, textStatus){
				if(data == "usable"){
					$('#emailCheckMessage').html('사용가능한 이메일');
				}else{
					$('#emailCheckMessage').html('사용불가능한 이메일');
				}
			}
		})
	}

	//가입취소 버튼
	function cancleBtn(){
		return location.href='/';
	}
	
</script>

<div class="main">
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		<h2 class="form-title pb-3">일 반 회 원 가 입</h2>
			
		<form method="POST" class="register-form" id="register-form" action="signup" enctype="multipart/form-data">	
		<!-- 일반회원 정보입력 -->
			<div class = "flex-row">
			<h3 class = "color_blue d-inline">회원 정보</h3>
			<p class = "ml-2 d-inline">(*필수 입력 항목)</p>
			</div>
				
			<div class = "round_border mt-3 mb-4">
			<div class = "m-5">
				<div class="form-group" name="memberID">
				<strong>*아이디</strong>
				<input type="text" id="member_id" name="member_id" maxlength="20" placeholder="Your ID" autofocus required/>
				<div id="idCheckMessage" class="color_blue"></div>
				<input type="button" value="ID중복체크" id="idCheck" onclick="id_Check()" /> 
				</div>
		
				<div class="form-group">
				<strong>*비밀번호</strong>
				<input type="password" name="member_pwd" id="member_pwd" maxlength="20" placeholder="Your Password" required/>
				</div>
		
				<div class="form-group">
				<strong>*비밀번호 확인</strong>
				<input type="password" name="re_member_pwd" id="re_member_pwd" placeholder="Repeat your Password"
					   onkeyup="passwordCheck()" required />
				<div id="passwordCheckMessage" class="color_blue"></div>
				</div>
		
				<div class="form-group">
				<strong>*이름</strong>
				<input type="text" name="member_name" id="member_name" maxlength="20" placeholder="Your Name" required />
				</div>
		
				<div class="form-group">
				<strong>*닉네임</strong>
				<input type="text" name="member_nickname" id="member_nickname" maxlength="20" placeholder="Your Nickname" required />
				</div>
					
				<div class="form-group">
				<strong>*연락처</strong>
				<input type="text" name="member_contact" id="member_contact" maxlength="20" placeholder="Your Contact Info." required />
				</div>
							
			 	<!--
				<div class="form-group">
				연락처
            	<select id="member_contact01" name="member_contact01">
                <option value="010" selected>010</option>
                <option value="011">011</option>
                <option value="016">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            	</select>
            	- <input id="member_contact02" name="member_contact02" type="text" maxlength="4">
            	- <input id="member_contact03" name="member_contact03" type="text" maxlength="4">
        		</div>
				-->	
					
				<div class="form-group">
				<strong>*이메일</strong>
				<input type="email" name="member_email" id="member_email" maxlength="40" placeholder="Your Email" required />
				<div id="emailCheckMessage" class="color_blue"></div>
				<input type="button" value="EMAIL중복체크" id="emailCheck" onclick="email_Check()" />
				</div>
				
				<!--
				<div class="form-group">
				이메일
        		<input type="text" id="member_email" name="member_email" maxlength="20" autocomplete="off"><span>@</span>
            	<input id="member_email_domain" name="member_email_domain" list="domains" placeholder="도메인입력/선택">
            	<datalist id="domains">
                <option value="naver.com">
                <option value="daum.net">
                <option value="gmail.com">
                <option value="yahoo.co.kr">
            	</datalist>
            	<br>
            	-->
            	
				<div class="filebox">
				<strong>프로필 사진</strong>
				<input type="file" name="file" id="member_photo" accept="image/*" />
				</div>
				<div class="img_wrap">
				<img id="img">
				</div>
				
				<script>
				var sel_file;

				$(document).ready(function(){
					$("#member_photo").on("change", handleImgFileSelect);
					});

					function handleImgFileSelect(e){
					var files = e.target.files;
					var filesArr = Array.prototype.slice.call(files);

					filesArr.forEach(function(f){
						sel_file = f;

						var reader = new FileReader();
						reader.onload = function(e){
							$('#img').attr("src", e.target.result);
					}
					reader.readAsDataURL(f);
					});
				}
				</script>
				
			</div>
			</div>
				
			<!-- 수평선 긋기 -->
			<hr class = "hr_style mt-5 mb-5">
				
			<!-- 반려동물 정보입력 -->
			<h3 class = "color_blue mt-5 d-inline">반려견 정보</h3>
				<div onclick="dog_plus_btn()" class="far fa-plus-square" style="font-size:24px"></div>
				<div onclick="dog_minus_btn()" class="far fa-minus-square" style="font-size:24px"></div>
			
			<div id = "dog_info" class = "round_border mt-3 mb-4 pb-3">
			<div class = "m-5">
				<div class="form-group">
				<strong>반려견 이름</strong>
				<input type="text" id="dog_name" name="dog_name" maxlength="30" placeholder="Dog Name" />
				</div>
		
				<div class="form-group">
				<strong>견종</strong>
				<input type="text" id="dog_breed" name="dog_breed" maxlength="20" placeholder="Dog Breeds" />
				</div>
				
				<div class="form-group">
				<strong>반려견 성별</strong> &nbsp;&nbsp;&nbsp;
				수컷<input type="radio" id="dog_sex" name="dog_sex" value="수컷" />
				암컷<input type="radio" id="dog_sex" name="dog_sex" value="암컷"/>
				</div>
		
				<div class="form-group">
				<strong>반려견 크기</strong> &nbsp;&nbsp;&nbsp;
				<select id="dog_size" name="dog_size">
					<option value="대형" selected>대형견</option>
					<option value="중형">중형견</option>
					<option value="소형">소형견</option>
				</select>
				</div>
				
				<div class="form-group">
				<strong>활동성</strong>
        		<input type="range" name="activity_level" min="0" max="100" step="10" oninput="document.getElementById('value').innerHTML=this.value;">
        		활동점수:<span id="value"></span>
    			</div>
		
				<div class="form-group">
				<strong>특이사항</strong>
				<input type="text" id="dog_note" name="dog_note" maxlength="100" placeholder="Remark" />
				</div>
			</div>
			</div>
			
			<div id="addInfo"></div>
			<!-- /.반려동물 정보입력 -->
			
			
			<!-- 가입&취소 버튼 -->
			<div class="form-group form-button" align="center">  
				<input type="submit" name="signup" id="signup" class="form-submit" value="가입하기" /> 
				<input type="button" name="signup" class="form-submit" onclick="cancleBtn()" value="취소하기" />
			</div>	
		</form>
	
			<div class = "pt-3 flex_row" align="center">
				이미 회원이신가요? <a href="signin" class="term-service color_blue">로그인하기</a>
			</div>
	</div>	
	</div>
	</div>
	</section>
</div>

			<!-- 반려견 정보  toggle
			<script>
			$(document).ready(function(){
				$("#dog_toggle_btn").on("click", function(){
					$("#dog_info").slideToggle("slow", "swing");
				});
			});
			</script> -->		
 
			<!-- 반려견 정보 추가/삭제 -->	
 			<script>
 			function dog_plus_btn(){
 				var div = document.createElement('div');
 				div.innerHTML = document.getElementById('dog_info').innerHTML;
 				document.getElementById('addInfo').appendChild(div);
 			}
 		
 			function dog_minus_btn(obj){
 				var parent = document.getElementById('addInfo');
 				parent.removeChild(parent.childNodes[0]);
 			}
			</script>
	
<%@include file="../../includes/footer.jsp"%>