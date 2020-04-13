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

<h1>아이디 찾기</h1>

		<form action="lostid" method="post">
			<div>가입할 때 입력하신 메일주소를 기입하세요.</div>
			<input type="email" name="member_email" id="member_email" />
			<input type="submit" value="ID찾기" />
		</form>

</body>
</html>