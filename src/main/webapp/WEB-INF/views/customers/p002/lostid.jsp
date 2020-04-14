<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="../../includes/header.jsp"%>

<h1>아이디 찾기</h1>

		
			<div>가입할 때 입력하신 메일주소를 기입하세요.</div>
			<input type="email" name="member_email" id="member_email" />
			<input type="button" value="ID찾기" onClick="findId()" />
			<div id="message"></div>
		
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    	<script type="text/javascript">
			function findId(){
				var _email = $("#member_email").val();
				
				if(_email == ''){
					alert("이메일을 입력하세요");
					return;
				}
				
				
				$.ajax({
					type:"post",
					async: false,
					url: "http://localhost:8080/customers/p002/lostid",
					data: {email: _email},
					success: function(data, textStatus){
						if(data == "usable"){
							alert(data);
						}else{
							alert("입력하신 이메일을 찾을 수 없어요");
						}
					}
				})
				
			}
		</script>
		

<%@include file="../../includes/footer.jsp"%>