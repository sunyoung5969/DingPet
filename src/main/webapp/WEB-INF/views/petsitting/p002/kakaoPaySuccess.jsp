<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결 제 정 보</h1>
	
	결제일시 : ${info.payment_Date}<br><br>
	주문번호 : ${info.order_ID}<br><br>
	상품명 : ${info.item_Name}<br><br>
	부과세 : ${info.vat }<br><br>
	결제금액 : ${info.total_amount}<br><br>
ㄴ
</body>
</html>