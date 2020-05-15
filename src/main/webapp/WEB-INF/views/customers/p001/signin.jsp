<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/sign.css">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>

<div class="main">
	<section class="sign-in">
		<div class="container sign_container">
			<div class="signin-content">

				<div class="signin-image">
					<figure>
						<img class="signinImg"
							src="${pageContext.request.contextPath}/resources/images/sign/signin-image.png"
							alt="sing up image">
					</figure>
				</div>

				<div class="signin-form">
					<h2 class="form-title">로 그 인</h2>

					<form class="register-form" id="login-form" action="signin"
						method="post">
						<div class="form-group">
							<label for="your_id"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <strong>아이디</strong>
							<input type="text" name="member_id" id="member_id"
								placeholder="Your ID" required />
						</div>


						<label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <strong>패스워드</strong>
						<input type="password" name="member_pwd" id="member_pwd"
							placeholder="Your Password" required />


						<div id="failMessage" style="color: blue">${fail}</div>

						<div class="form-group  display-flex-center">
							<input type="submit" name="signin" id="signin"
								class="btn btn-primary" value="로그인" />
						</div>

						<!--  
            <div class="form-group">
            <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
            <label for="remember-me" class="label-agree-term"><span><span></span></span>로그인 상태 유지</label>
            </div>
            -->
					</form>

					아직 회원이 아니세요?<a href="/customers/p001/signup">회원가입</a>&nbsp;&nbsp;&nbsp;
					<a href="/customers/p002/lostid">아이디 찾기</a>/<a
						href="/customers/p002/lostpwd">비밀번호 찾기</a> <br> <br>

					<div class="form-group">
						<!-- 네아로 -->
						<div id="naver_id_login" style="text-align: center">
							<a href="${url}"> <img width="223"
								src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>
						<br>
						<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

						<!-- 카카오 -->
						<div style="text-align: center">
							<a id="kakao-login-btn"></a>
						</div>
						<a href="http://developers.kakao.com/logout"></a>
						<script type='text/javascript'>
							Kakao.init('131b594651bf35bbd6dbf4facaa65f7c'); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함

							//카카오 로그인 버튼을 생성합니다. 
							Kakao.Auth
									.createLoginButton({
										container : '#kakao-login-btn',
										success : function(authObj) {
											Kakao.API
													.request({
														url : 'http://localhost:8765',
														success : function(res) {
															console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
															console
																	.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
															console
																	.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
															// res.properties.nickname으로도 접근 가능 )
															console
																	.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력

															var kakaonickname = res.properties.nickname; //카카오톡 닉네임을 변수에 저장 (닉네임 값을 다른페이지로 넘겨 출력하기 위해서)

															window.location
																	.replace("http://"
																			+ window.location.hostname
																			+ ((location.port == "" || location.port == undefined) ? ""
																					: ":"
																							+ location.port)
																			+ "/hansub_project/home?kakaonickname="
																			+ kakaonickname);
															//로그인 결과 페이지로 닉네임 값을 넘겨서 출력시킨다.,
														}
													})
										},
										fail : function(error) {
											alert(JSON.stringify(error));
										}
									});
						</script>
					</div>

					<!-- 구글
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
             -->
				</div>
			</div>
		</div>
	</section>
</div>

<%@include file="../../includes/footer.jsp"%>