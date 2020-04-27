<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">

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
				<p class = "ml-2 d-inline">*필수 입력 항목입니다.</p>
				</div>
				
				<div class = "round_border mt-3 mb-4">
				<div class = "m-5">
					<div class="form-group" name="memberID">
					아이디<input type="text" id="member_id" name="member_id" maxlength="20" placeholder="Your ID" autofocus required/>
					<input type="button" value="ID중복체크" id="idCheck" onclick="id_Check()" /> 
					<div id="idCheckMessage" class="color_blue"></div>
					</div>
		
					<div class="form-group">
					비밀번호<input type="password" name="member_pwd" id="member_pwd" maxlength="20" placeholder="Your Password" required/>
					</div>
		
					<div class="form-group">
					비밀번호 확인<input type="password" name="re_member_pwd" id="re_member_pwd" placeholder="Repeat your Password"
									onkeyup="passwordCheck()" required />
					<div id="passwordCheckMessage" class="color_blue"></div>
					</div>
		
					<div class="form-group">
					이름<input type="text" name="member_name" id="member_name" maxlength="20" placeholder="Your Name" required />
					</div>
		
					<div class="form-group">
					닉네임<input type="text" name="member_nickname" id="member_nickname" maxlength="20" placeholder="Your Nickname" required />
					</div>
					
					
					<div class="form-group">
					연락처<input type="text" name="member_contact" id="member_contact" maxlength="20" placeholder="Your Contact Info." required />
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
					이메일<input type="email" name="member_email" id="email" maxlength="40" placeholder="Your Email" required />
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
            		딩펫소식을 이메일로 받아보시겠습니까?<input type="radio" name="smsYn" value="Y"checked>수신
            		<input type="radio" name="smsYn" value="N">미수신
					</div>
					-->
					
					<!-- 
					<div class="filebox">
					포르필 사진<input type="file" name="member_photo" id="member_photo" accept="image/*" />
					</div>
					-->		
					
				</div>
				</div>
			
				<!-- 수평선 긋기 -->
				<hr class = "hr_style mt-5 mb-5">
				
<!-- 반려동물 정보입력 -->
			<div>
				<h3 class = "color_blue mt-5 d-inline">반려견 정보</h3>
				<div id = "dog_toggle_btn" class = "ml-2">
				<!-- +아이콘 -->
				<i class="far fa-plus-square"></i>
				<i class="far fa-minus-square"></i>
				</div>
			</div>
			<div id="addInfo"></div>
			
			<div id = "dog_info" class = "round_border mt-3 mb-4 pb-3" style = "display:none">
			<div class = "m-5">
				<div class="form-group">
				반려견 이름<input type="text" id="dog_name" name="dog_name" maxlength="10" placeholder="Dog Name" />
				</div>
		
				<div class="form-group">
				견종<input type="text" id="dog_breed" name="dog_breed" maxlength="10" placeholder="Dog Breeds" />
				</div>
				
				<div class="form-group">
				반려견 성별<br>
				수컷<input type="radio" id="dog_sex" name="dog_sex" value="수컷" checked="checked"/>
				암컷<input type="radio" id="dog_sex" name="dog_sex" value="암컷"/>
				</div>
		
				<div class="form-group">
				반려견 크기<br>
				대형견<input type="radio" id="dog_size" name="dog_size" value="대형" checked="checked"/>
				중형견<input type="radio" id="dog_size" name="dog_size" value="중형" />
				소형견<input type="radio" id="dog_size" name="dog_size" value="소형" />
				</div>
				
				<div class="form-group">
				활동성<br>
        		<input type="range" name="activity_level" min="0" max="100" step="10" oninput="document.getElementById('value').innerHTML=this.value;">
        		활동점수:<span id="value"></span>
    			</div>
		
				<div class="form-group">
				특이사항<input type="text" id="dog_note" name="dog_note" maxlength="100" placeholder="Remark" />
				</div>
				
				<!-- 
				<div class="filebox">
				사진<input type="file" name="dog_photo" id="dog_photo" accept="image/*">
				</div>
				 -->
				
			</div>
			</div>

<!-- 사진미리보기 JS -->
			<script>
				var upload = document.querySelector('#member_photo');
				upload.addEventListener('change', function(e) {
	
				//FileReader 객체 생성
				var reader = new FileReader();
		
				// reader 시작시 함수 구현
				reader.onload = function(aImg) {
				$("#preview").attr("src", aImg.target.result);
				}
		
				reader.readAsDataURL(e.target.files[0]);
				
				})
			</script>

			
			<!-- 수평선 긋기 -->
			<hr class = "hr_style mt-5 mb-5 ">
			
			<!-- 가입&취소 버튼 -->
			<div class = "w-50 m-auto pt-3 pb-5">
			<div class="form-group form-button flex_row">
				<input type="submit" name="signup" id="signup" class="basic_btn btn btn-primary" value="가입하기" /> 
				<input type="button" name="signup" class="basic_btn btn btn-primary" onclick="cancleBtn()" value="취소하기" />
			</div>
			</div>
			
			</form>
		</div>
		
			<div class = "pt-3 flex_row">
			<div class="form-group text_center">
			이미 회원이신가요? <br><a href="signin" class="term-service color_blue">로그인 하기</a>
			</div>
			</div>
			
	</div>

<!-- 반려견 정보  toggle
			<script>
			$(document).ready(function(){
				$("#dog_toggle_btn").on("click", function(){
					$("#dog_info").slideToggle("slow", "swing");
				});
			});
			</script>
 -->		

 			<script>
			document.getElementById("dog_toggle_btn").addEventListener("click", function(e){
				var target = document.querySelector("#dog_info").cloneNode(true);
				document.querySelector("#addInfo").innerHTML += target.innerHTML;
			})
			</script>
			


			<!-- 강아지사진
			<div class="signup-image">
				<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sign/signup-image.png" alt="sing up image">
				</figure>
				<figure>
				<img id="preview" alt="sing up image">
				</figure>
			</div>
			-->
			    
		</div>
		</section>
	</div>


<%@include file="../../includes/footer.jsp"%>