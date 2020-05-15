<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="test" onsubmit="frmSubmit()">
	<input type="text" name="a">
	<input type="submit">
</form>

<script>
	function frmSubmit(){
		
		if(a.value == ''){
			alert("a없어");
			return false;
		}
		
		return true;
	}
</script>

</body>
</html>