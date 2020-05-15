<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
-->
<style>
	
</style>
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
				if(data == "id needed"){
					$('#idCheckMessage').text('아이디를 입력하세요');
				}else if(data == "usable"){
					$('#idCheckMessage').text('사용가능한 아이디입니다');
					$("#idCheckMessage").val('Y');
				}else{
					$('#idCheckMessage').text('사용불가능한 아이디입니다');
					$("#idCheckMessage").val('N');
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
				
				if(data == "email needed"){
					$('#emailCheckMessage').text('이메일을 입력하세요');
				}else if(data == "usable"){
					$('#emailCheckMessage').text('사용가능한 이메일입니다');
					$("#emailCheckMessage").val('Y');
				}else{
					$('#emailCheckMessage').text('사용불가능한 이메일입니다');
					$("#emailCheckMessage").val('N');
				}
			}
		})
	}

	//가입취소 버튼
	function cancleBtn(){
		return location.href='/';
	}
	
	//onsubmit 버튼
	function btnCheck(){
		console.log("@@@@onsubmit@@@@@");
		
		if($("#idCheckMessage").val() == ''){
			console.log("아이디 중복확인 안했어")
			alert("아이디 중복확인을 하세요")
			return false;
		}else if($("#idCheckMessage").val() == 'N'){
			console.log("아이디 중복된다")
			alert("이미 사용중인 아이디입니다. 다른 아이디를 입력하세요.")
			return false;
		}else if($("#emailCheckMessage").val() == ''){
			console.log("이메일 중복확인 안했어")
			alert("이메일 중복확인을 하세요")
			return false;
		}else if($("#emailCheckMessage").val() == 'N'){
			console.log("이메일 중복된다")
			alert("이미 사용중인 이메일입니다. 다른 이메일 주소를 입력하세요.")
			return false;
		}else{
			return true;
		}
		return false;
	}
	
	//인증번호 전송
	function auth(){
		//1. 인증번호 입력칸, 확인 버튼 생성
		$("#auth").append(
		'<input type="text" id="authid" maxlength="8" placeholder="8자리 입력" style="width:47%; display:inline;"/> <input type="button" onclick="auth_check()" value="인증번호확인" style="width:50%; display:inline; color:black; padding:6px; font-size:12px">'
		);
		
		//2. 인증번호 전송
		var emailForAuth = $('#member_email').val();
		$.ajax({
			type:"post",
			url:"/customers/p001/auth_email",
			data: {emailAuth : emailForAuth},
			success: function(data, textStatus){
				$('#hiddenAuthNo').val(data);
				$('#emailCheckMessage').text('인증번호가 전송되었습니다.')
			}
		});
	}
	
	//인증번호 확인
	function auth_check(){
		
		var idCheck = $('#authid').val();
		var idAuth = $('#hiddenAuthNo').val();
		
		if(idCheck == idAuth){
			alert("인증완료");
		}else{
			alert("인증오류");
		}
	}
	
</script>

<div class="main">
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		<h2 class="form-title pb-3">일 반 회 원 가 입</h2>
			
		<form method="POST" class="register-form" id="register-form" action="signup" onsubmit="return btnCheck()" enctype="multipart/form-data">	
		<!-- 일반회원 정보입력 -->
			<div class = "flex-row">
			<h3 class = "color_blue d-inline">회원 정보</h3>
			<p class = "ml-2 d-inline">(*필수 입력 항목)</p>
			</div>
				
			<div class = "round_border mt-3 mb-4">
			<div class = "m-5">
				<div class="form-group" name="memberID">
            	<strong style="display: block;">*아이디</strong> 
            	<input type="text" id="member_id" name="member_id" maxlength="20" placeholder="Your ID" autofocus required
            	style = "width: 47%; display: inline;" />
            	<input type="button" value="ID중복체크" id="idCheck" onclick="id_Check()" 
            	style = "width: 50%; display: inline; color:black; padding:6px; font-size:12px" /> 
            	<div id="idCheckMessage" style="color: blue;"></div>
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
				
				<div class="form-group">
				<strong style="display: block;">*이메일</strong>
				<input type="email" name="member_email" id="member_email" maxlength="40" placeholder="Your Email" required
				style = "width: 47%; display: inline;" />
			
				<input type="button" value="EMAIL중복체크" id="emailCheck" onclick="email_Check()"
				style = "width: 25%; display: inline; color:black; padding:6px; font-size:12px" /> 
				
				<input type="button" value="인증번호전송" onclick="auth(); this.onclick=null;"
				style = "width: 25%; display: inline; color:black; padding:6px; font-size:12px" /> 
				<div id="emailCheckMessage" style="color:blue"></div>
				
				<div id="auth"></div>
				<input type="hidden" id="hiddenAuthNo" name="hiddenAuthNo">
				
				</div>
				
				<div class="filebox">
				<strong style="display:block">프로필 사진</strong>
					<div class="img_wrap" style="border:10px; min-height:150px; border:solid 1px #757575; overflow:hidden !important">
						<img id="img" style="width:100%; height:100%; padding:0px">
					</div>
				<input type="file" name="file" id="member_photo" accept="image/*" />	
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
			
			<div id = "dog_info" class = "round_border mt-3 mb-4 pb-3"
			style="padding-bottom:0px !important; margin:0px !important">
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
				<strong style="display:block; padding-bottom:10px">반려견 성별</strong>
				<select id="dog_sex" name="dog_sex"
				style="width:100%; padding: 6px 0px;
				background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;">
					<option value="수컷" selected>수컷</option>
					<option value="암컷">암컷</option>
				</select>
				</div>
		
				<div class="form-group">
				<strong style="display:block; padding-bottom:10px">반려견 크기</strong>
				<select id="dog_size" name="dog_size"
				style="width:100%; padding: 6px 0px;
				background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;">
					<option value="대형" selected>대형견</option>
					<option value="중형">중형견</option>
					<option value="소형">소형견</option>
				</select>
				</div>
				
				<div class="form-group">
				<strong style="display:block; padding-bottom:10px">활동성</strong>
        		<input type="range" name="activity_level" min="0" max="100" step="10" oninput="document.getElementById('value').innerHTML=this.value;"
        		style="background-color: aliceblue;">
        		활동점수:<span id="value"></span>
    			</div>
		
				<div class="form-group">
				<strong>특이사항</strong>
				<input type="text" id="dog_note" name="dog_note" maxlength="100" placeholder="Remark" />
				</div>
			</div>
			<hr align="center" style="border:solid 1px aliceblue; width:50%">
			</div>
			
			<div id="addInfo"></div>
			<!-- /.반려동물 정보입력 -->
			
			
			<!-- 가입&취소 버튼 -->
			<div class="form-group form-button" align="center">  
				<input type="submit" name="signup" id="signup" class="form-submit" value="가입하기" 
				style="margin:0px" /> 
				<input type="button" name="signup" class="form-submit" onclick="cancleBtn()" value="취소하기"
				style="margin:0px" />
			</div>	
			<hr align="center" style="border:solid 1px aliceblue; width:50%">
		</form>
	
			<div class = "pt-3 flex_row" align="center" style="padding:0px !important;">
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