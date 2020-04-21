<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">	
		function find_id(){
			var findId = document.findIdForm;
			var cust_id = findId.member_email.value;
			
			if(cust_id == '' || cust_id.length == 0){
				alert("이메일을 입력해주세요");
			}else{
				findId.method = "post";
				findId.action = "lostid";
				findId.submit();
			}
		}
	</script>

	
</head>
<body>

<h3><a href="/">메인으로가기</a></h3>

	<form action="lostid" method="post" name="findIdForm">
		<div>가입할 때 입력하신 메일주소를 기입하세요.</div>
		<input type="email" name="member_email" />
		<input type="button" onClick="find_id()" value="ID찾기" />
	</form>
	
	<h3>${_id} </h3>
	<h3>${no} </h3>
	
	
</body>
</html>