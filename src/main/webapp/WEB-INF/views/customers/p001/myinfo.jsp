<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DingPet SignIn</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
    
    <!-- JS -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		
    		var formObj = $("form");
    		
    		$('button').on("click", function(e){
    			
    			e.preventDefault(); //기본 동작 막음
    			
    			var operation = $(this).data("oper");
    			console.log(operation);
    			
    			if(operation === 'withdraw'){
    				formObj.attr("action", "/customers/p001/withdraw");
    				alert("잘가요안녕");
    			}else if(operation  === 'change'){
    				formObj.attr("action", "/customers/p001/change");
    				alert("펫시터신청페이지로 이동합니다");
    			}
    			formObj.submit();
    		});
    	});
    </script>
  
</head>

<body>
	<div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                
                    <div class="signup-form">
                        <h2 class="form-title">나 의 정 보</h2>
			
			<form method="post" action="myinfo">
			
                            <div class="form-group">
                                <label for="new_id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                아이디<input type="text" name="member_id" value="<c:out value="${customers.member_id}" />" readonly="readonly" />
                             </div>

   							<div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                비밀번호<input type="text" name="member_pwd" value="<c:out value="${customers.member_pwd}" />" />
                            </div>
       
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                닉네임<input type="text" name="member_nickname" value="<c:out value="${customers.member_nickname}" />" >
                            </div>
                            
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                이메일<input type="text" name="member_email" value="<c:out value="${customers.member_email}" />" >
                            </div>

                  
               <!-- 
               				<div class="form-group form-button">
                                <input type="submit" class="form-submit" value="정보수정">
                            </div>    
                            
                            <div class="form-group form-button">
                                <input type="button" onClick="withdraw()" id="withdrawBtn" class="form-submit" value="회원탈퇴" />
                            </div>
               
                            <div class="form-group form-button">
                                <input type="button" onClick="change()" class="form-submit" value="회원전환" />
                            </div>
                -->
                            
                            
                            <button type="submit" data-oper='modify' class="form-group form-button">정보수정</button>
							<button type="submit" data-oper='withdraw' class="form-group form-button">회원탈퇴</button>
							<button type="submit" data-oper='change' class="form-group form-button">회원전환</button>	
            </form>    
                      
                    </div>
                   
                    
                </div>
            </div>
        </section>

    </div>
    
    


 
</body>
</html>