<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<div class="main">  
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		
		<h2 class="form-title pb-3">펫시터 신청 목록</h2>
		<div class="row">
		<div class="col-lg-12">
		<div class="panel-heading">관리자의 승인을 기다리고 있는 사용자 목록입니다.</div>
		<div class="panel-body">
			<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
			<thead>
				<tr>
				<th>NO</th>
				<th>MEMBER ID</th>
				<th>STATUS</th>
				</tr>
			</thead>
			
			<c:forEach items="${list}" var="board" varStatus="status">
				<tr>
					<th>${status.count}</th>
					<th><a href='petSitterForm?member_id=<c:out value="${board.member_id}" />'>
					<c:out value="${board.member_id}" /></a>
					</th>
					<th><c:out value="${board.member_type}" /></th>
				</tr>
			</c:forEach>
			
			</table>
		</div>
		</div>
		</div>


			 
	</div>
	</div>
	</div>
	</section>
</div>


<%@include file="../../includes/footer.jsp"%>
