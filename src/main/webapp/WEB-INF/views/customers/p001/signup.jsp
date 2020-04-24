<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
   
   //id중복체크 함수
   function fn_process() {
      var _id = $("#member_id").val();

      if (_id == '') {
         alert("ID를 입력하세요");
         return;
      }
      
      $.ajax({
          type : "post",
          url : "/customers/p001/mem",
          data : {id : _id},
          success : function(data, textStatus) {
                   if (data == "usable") {
                   //$('#btn_duplicate').prop("disabled", true); //.prop("disabled", true) 버튼 비활성화
                   alert("사용가능한 id입니다");
                   } else {
                   alert("사용 불가능한 id입니다");
                   }
                }
       })
   }
   
   //pw일치체크 함수
   function passwordCheck() {
      var member_pwd = $('#member_pwd').val();
      var re_member_pwd = $('#re_member_pwd').val();

      if (member_pwd != re_member_pwd) {
         $('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');
      } else {
         $('#passwordCheckMessage').html('');
      }
   }
   
   //가입취소 버튼
   function cancleBtn(){
      return location.href='/';
   }


	function passwordCheck() {
		var member_pwd = $('#member_pwd').val();
		var re_member_pwd = $('#re_member_pwd').val();

		if (member_pwd != re_member_pwd) {
			$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');
		} else {
			$('#passwordCheckMessage').html('');
		}
	}
</script>

   <div class="main">
      <!-- Sign up form -->
      <section class="signup">
         <div class="sign_container m-auto w-50">
            <div class="signup-content d-block" >
				<div class="w-75 m-auto">
					<h2 class="form-title pb-3">일 반 회 원 가 입</h2>
					<form method="POST" class="register-form" id="register-form" action="signup" enctype="multipart/form-data">
						<div class = "flex-row"><h3 class = "color_blue d-inline">회원 정보</h3><p class = "ml-2 d-inline">*필수 입력 항목입니다.</p></div>
						<div class = "round_border mt-3 mb-4">
							<div class = "m-5">
								<div class="form-group">
									아이디<input type="text" id="member_id" name="member_id" maxlength="10" placeholder="Your ID"  required/> 
									<input type="button" value="ID중복체크" id="btn_duplicate" onClick="fn_process()" />
								</div>
		
								<div class="form-group">
									비밀번호<input type="password" name="member_pwd" id="member_pwd" maxlength="10" placeholder="Your Password" required/>
								</div>
		
								<div class="form-group">
									비밀번호 확인<input type="password" name="re_member_pwd" id="re_member_pwd" placeholder="Repeat your Password"
										onkeyup="passwordCheck()"  required/>
									<div id="passwordCheckMessage" class="color_blue"></div>
								</div>
		
								<div class="form-group">
									이름<input type="text" name="member_name" id="member_name" maxlength="5" placeholder="Your Name" required/>
								</div>
		
								<div class="form-group">
									닉네임<input type="text" name="member_nickname" id="member_nickname" maxlength="5" placeholder="Your Nickname" required/>
								</div>
		
								<div class="form-group">
									이메일<input type="email" name="member_email" id="email" maxlength="40" placeholder="Your Email"  required/>
								</div>
								
								<div class="filebox">
									사진<input type="file" name="photo" id="member_photo" accept="image/*" required>
								</div>
							</div>
						</div>
						<hr class = "hr_style mt-5 mb-5">
						<!-- 반려동물 정보입력 -->
						<div><h3 class = "color_blue mt-5 d-inline">반려견 정보</h3><div id = "dog_toggle_btn" class = "ml-2"><i class="far fa-plus-square"></i></div>
						<p class = "ml-2 d-inline">버튼을 누르면 입력창이 열립니다. </p></div>
						<div id = "dog_info" class = "round_border mt-3 mb-4 pb-3" style = "display:none">
							<div class = "m-5">
								<div class="form-group">
									반려견 이름<input type="text" id="dog_id" name="dog_id" maxlength="10" placeholder="Dog Name" />
								</div>
		
								<div class="form-group">
									반려견 견종<input type="text" id="dog_type" name="dog_type" maxlength="10" placeholder="Dog Breeds" />
								</div>
		
								<div class="form-group">
									반려견 크기<input type="text" id="dog_size" name="dog_size" maxlength="10" placeholder="Dog Size" />
								</div>
		
								<div class="form-group">
									특이사항<input type="text" id="" name="dog_size" maxlength="10" placeholder="Remark" />
								</div>
		
								<div class="filebox">
									사진<input type="file" name="photo" id="pet_photo" accept="image/*">
								</div>
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

			<script>
				//반려견 정보 토글
				$(document).ready(function(){
					$("#dog_toggle_btn").on("click", function(){
						$("#dog_info").slideToggle("slow", "swing");
					});
				});
				
			</script>
				<!-- 강아지사진 -->
               <!--  
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