<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><a href="/">메인으로가기</a></h3>
<H6>${test2 }</H6>

<h1>비밀번호 찾기</h1>

		<form action="lostpwd" method="post">
			아이디<input type="id" name="member_id" id="member_id" />
			이메일<input type="email" name="member_email" id="member_email" />
			<input type="submit" value="pw찾기" />
		</form>
</body>
</html>