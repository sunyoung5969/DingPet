<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
	 
    <div class="main">

        <!-- Sing in Form -->
        <section class="sign-in">
            <div class="container sign_container">
                <div class="signin-content ">
					<div class="signin-image">
                        <figure><img class="signinImg" src="${pageContext.request.contextPath}/resources/images/sign/signin-image.png" alt="sing up image"></figure>
                    </div>
                    <div class="signin-form">
                        <h2 class="form-title">로 그 인</h2>
                        
                        <form method="POST" class="register-form" id="login-form" action="signin">                    
                            <div class="form-group">
                                <label for="your_id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                아이디<input type="text" name="member_id" id="member_id" placeholder="Your ID"  required/>
                            </div>
                            
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                패스워드<input type="password" name="member_pwd" id="member_pwd" placeholder="Password"  required/>
                            </div>
                                                                                    
                            <div class="form-group  display-flex-center">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>   
                            
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>로그인 상태 유지</label>
                            </div>
                            
                        <a href="/customers/p001/signup">회원가입</a>
                        <a href="/customers/p002/lostid">아이디 찾기</a>
                        <a href="/customers/p002/lostpwd">비밀번호 찾기</a>
                            
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

<%@include file="../../includes/footer.jsp"%>
