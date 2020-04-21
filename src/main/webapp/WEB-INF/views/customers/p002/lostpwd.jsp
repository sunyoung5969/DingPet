<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">	
			function find_pw(){
				
				var findPw = document.findPwForm;
				var cust_id = findPw.member_id.value;
				var cust_email = findPw.member_email.value;
				
				if((cust_id == '' || cust_id.lenth == 0) || 
				(cust_email == '' || cust_email.length == 0)){
					alert("아이디와 이메일을 모두 입력해주셔야 합니다");
				}else{
					findPw.method = "post";
					findPw.action = "lostpwd";
					findPw.submit();
				}
			}
		</script>


</head>
<body>
<h3><a href="/">메인으로가기</a></h3>
<H6>${test2 }</H6>

<h1>비밀번호 찾기</h1>

		<form action="lostpwd" method="post" name="findPwForm">
			아이디<input type="id" name="member_id" id="member_id" />
			이메일<input type="email" name="member_email" id="member_email" />
			<input type="button" value="pw찾기" onClick="find_pw()" />
		</form>
		
		<h3>${yespw}</h3>
		<h3>${nopw}</h3>

</body>
</html>