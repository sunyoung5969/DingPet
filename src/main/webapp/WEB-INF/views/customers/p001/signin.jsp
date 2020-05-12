<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<div class="main">
	<section class="sign-in">
	<div class="container sign_container">
	<div class="signin-content">

		<div class="signin-image">
		<figure><img class="signinImg" src="${pageContext.request.contextPath}/resources/images/sign/signin-image.png" alt="sing up image">
		</figure>
		</div>
	
		<div class="signin-form">
			<h2 class="form-title">로 그 인</h2>
			
        	<form class="register-form" id="login-form" action="signin" method="post">                   
				<div class="form-group">
				<label for="your_id"><i class="zmdi zmdi-account material-icons-name"></i></label>
				<strong>아이디</strong>
				<input type="text" name="member_id" id="member_id" placeholder="Your ID" required/>
				</div>
                            
				<div class="form-group">
				<label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
				<strong>패스워드</strong>
				<input type="password" name="member_pwd" id="member_pwd" placeholder="Password"  required/>
				</div>
				
				<div id="failMessage"><font color=blue>${fail}</font></div>
												
				<div class="form-group  display-flex-center">
				<input type="submit" name="signin" id="signin" class="btn btn-primary" value="로그인"/>
				</div>   
				
				
				<!--  
				<div class="form-group">
				<input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
				<label for="remember-me" class="label-agree-term"><span><span></span></span>로그인 상태 유지</label>
				</div>
				-->
			</form>
			
				아직 회원이 아니세요?<a href="/customers/p001/signup">회원가입</a>&nbsp;&nbsp;&nbsp;
				<a href="/customers/p002/lostid">아이디 찾기</a>/<a href="/customers/p002/lostpwd">비밀번호 찾기</a>
				<br>
				<br>
			
			
			<div class="form-group socialimage">
				<!-- 구글 로그인 버튼 -->
				<button class="btn btn-danger btn-round" style="width: 100%">
				<i class="fab fa-google-plus mr-2"></i>GOOGLE
				</button>
				<!-- 페이스북 로그인 버튼 -->
				<button class="btn btn-primary btn-round" style="width: 100%">
				<i class="fa fa-facebook" aria-hidden="true"></i> FACEBOOK
				</button>
				<!-- 네이버 로그인 버튼 -->
				<button class="btn btn-success btn-round" style="width: 100%">
				<i class="fa fa-naver" aria-hidden="true"></i>NAVER
				</button>
				<!-- 카카오톡 로그인 버튼 -->
				<button class="btn btn-warning btn-round" style="width: 100%">
				<i class="fa fa-kakaotalk" aria-hidden="true"></i>KAKAOTALK
				</button>
			</div>
			
			
			
			<!-- 구글 로그인 -->
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script>
			$("#loginBtn").click(function(){
				location.href = "https://accounts.google.com/o/oauth2/auth?client_id="+"948646401869-qaq88t7sfvadvgitpmdit2sjod3dccei.apps.googleusercontent.com"
				+ "&redirect_uri="+"http://localhost:8765/customers/p001/callback"
				+ "&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&approval_prompt=force&access_type=offline";
			});
			</script>

			
		</div>
	</div>
	</div>
	</section>
</div>
				
<%@include file="../../includes/footer.jsp"%>
