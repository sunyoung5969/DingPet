<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DingPet SignIn</title>

<!-- Main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sign.css">


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function fn_process() {

		var _id = $("#member_id").val();

		if (_id == '') {
			alert("ID를 입력하세요");
			return;
		}

		$.ajax({
			type : "post",
			url : "/customers/p001/mem",
			data : {
				id : _id
			},
			success : function(data, textStatus) {
				if (data == "usable") {
					$('#btn_duplicate').prop("disabled", true); //.prop("disabled", true) 버튼 비활성화
					alert("사용가능한 id입니다");
				} else {
					alert("사용 불가능한 id입니다");
				}
			}
		})
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
</head>

<body>
	<div class="main">
		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">일 반 회 원 가 입</h2>
						<form method="POST" class="register-form" id="register-form"
							action="signup" enctype="multipart/form-data">

							<div class="form-group">
								<label for="new_id"><i
									class="zmdi zmdi-account material-icons-name"></i> </label> 아이디<input
									type="text" id="member_id" name="member_id" maxlength="20"
									placeholder="Your ID" required /> <input type="button"
									value="ID중복체크" id="btn_duplicate" onClick="fn_process()" />
							</div>

							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> 비밀번호<input
									type="password" name="member_pwd" id="member_pwd"
									maxlength="20" placeholder="Your password" required />
							</div>

							<div class="form-group">
								비밀번호 확인 <input type="password" name="re_member_pwd"
									id="re_member_pwd" placeholder="Repeat your password"
									onkeyup="passwordCheck()" required />
								<div id="passwordCheckMessage" class="color_blue"></div>
							</div>

							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i> </label> 이름<input
									type="text" name="member_name" id="member_name" maxlength="10"
									placeholder="Your name" required />
							</div>


							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i> </label> 닉네임<input
									type="text" name="member_nickname" id="member_nickname"
									maxlength="10" placeholder="Your nickname" required />
							</div>


							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> 이메일<input
									type="email" name="member_email" id="email" maxlength="20"
									placeholder="Your email" required />
							</div>


							<div class="filebox">
								사진 <input type="file" name="photo" id="member_photo" accept="image/*">

								<!-- 사진미리보기 JS -->
								<script>
									var upload = document
											.querySelector('#member_photo');

									upload.addEventListener('change', function(
											e) {

										//FileReader 객체 생성
										var reader = new FileReader();

										// reader 시작시 함수 구현
										reader.onload = function(aImg) {
											$("#preview").attr("src",
													aImg.target.result)
										}

										reader.readAsDataURL(e.target.files[0])
									})
								</script>
							</div>


							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="가입하기" />
							</div>
					</div>


					<div class="form-group">
						저는 기존 회원입니다. <a href="signin" class="term-service">로그인하기</a>
					</div>

					</form>
				</div>

				<div class="signup-image">
					<figure>
						<img
							src="${pageContext.request.contextPath}/resources/images/sign/signup-image.png"
							alt="sing up image">
					</figure>
					<figure>
						<img id="preview" alt="sing up image">
					</figure>
				</div>

			</div>
	</div>
	</section>
	</div>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>