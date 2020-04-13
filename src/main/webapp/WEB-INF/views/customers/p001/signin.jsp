<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DingPet SignIn</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
    
    
</head>
<body>

	<!-- 
	<form action="${contextPath}/min" method="get">
		<input type="text" id="mem_id">
		<input type="submit" value="로그인">
	</form>
	 -->
	 
    <div class="main">

        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="${pageContext.request.contextPath}/resources/images/sign/signin-image.png" alt="sing up image"></figure>
                        <a href="signup" class="signup-image-link">회원가입</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">로 그 인</h2>
                        
                        
                        <form method="POST" class="register-form" id="login-form" action="signin">
                            
                            <div class="form-group">
                                <label for="your_id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                아이디<input type="text" name="member_id" id="member_id" placeholder="Your ID"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                패스워드<input type="password" name="member_pwd" id="member_pwd" placeholder="Password"/>
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                            
                        </form>
                        
                        
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
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