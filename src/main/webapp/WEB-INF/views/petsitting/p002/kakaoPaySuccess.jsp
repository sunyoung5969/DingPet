<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kakaoPaySuccess.css?v=3">

</head>
<body onbeforeunload="closedPopup()">
	<div class='payment_info-title'>
		<h1 align='center'>결 제 정 보</h1>
	</div>
	
	<div class='payment-info-contents--container'>
		<div class='payment-info-contents'>
			<table>
				<tr>
					<td align='center' class='info-name'>결 제 일 시</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.payment_Date}</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>주문번호</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.order_ID}</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>상품명</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.item_Name}</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>부 과 세</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.vat } 원</td>
				</tr>
				<tr>
					<td align='center' class='info-name'>총 결제 금액</td>
					<td> : </td>
					<td align='center' class='info-data'>${info.total_amount} 원</td>
				</tr>
			</table>
			
			<div align='center' class='closed-div'>
				<button class='closed-btn' onclick="closedPopup()">확 인</button>
			</div>
		</div>
		<div class='background-gradation'>
		
		</div>
		<div class='img-div'>
			<img class='img-bottom' src="https://i.imgur.com/irDyXI6.png?1">
		</div>
		
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/profilelookup.js?v=10"></script>
</body>
</html>