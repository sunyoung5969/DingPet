<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    <% 
    String id = request.getParameter("member_id");
    String pw = request.getParameter("member_pw");
    String nick = request.getParameter("member_nickname");
    String email = request.getParameter("member_email");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <H1>${info }</H1> -->

<a href="/">메인으로가기</a>

<p> <%=id %> </p>
<p> <%=pw %> </p>
<p> <%=nick %> </p>
<p> <%=email %> </p>

</body>
</html>