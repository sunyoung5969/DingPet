<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

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
                            
				
				<label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
				<strong>패스워드</strong>
				<input type="password" name="member_pwd" id="member_pwd" placeholder="Your Password"  required/>
				
				
				<div id="failMessage" style="color:blue">${fail}</div>
												
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
				
				<!-- 네아로 -->
				<div id="naver_id_login" style="text-align:center"><a href="${url}">
      			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
      			<br>
				
				
				<button type="button" id="loginBtn" class="btn btn-block btn-danger">
				<i class="fab fa-google-plus mr-2">GOOGLE</i>
				</button>
				<script>					
					$("#loginBtn").click(function(){										
					location.href = 
					"https://accounts.google.com/o/oauth2/auth?client_id=" + "948646401869-qaq88t7sfvadvgitpmdit2sjod3dccei.apps.googleusercontent.com"
					+ "&redirect_uri=" + "http://localhost:8765/customers/p001/callback"
					+ "&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&approval_prompt=force&access_type=offline";
					});
					
				</script>
				
		</div>
	</div>
	</div>
	</section>
</div>
				
<%@include file="../../includes/footer.jsp"%>
