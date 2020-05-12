<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<style>
	body{
		overflow: hidden;
	}
	
	#header li a{
		color:#3d3d3d;
	}
	
	#header li a:hover{
		color:#adadad;
	}
	
	.wrap{
		text-align: center;
		
		position: absolute;
		top: 120px;
	}
	
	.wrap h2{
		margin: 20px auto;
	}
	
	.table{	
		width: 80%;
		margin: 0 auto;
		text-align: center;
	}
	.table, tr, td, th{
		border: 1px solid #3d3d3d;
		border-collapse:collapse;
		
	}
	
	thead tr{
		height: 40px;
	}
	
	tbody tr{
		height: 34px;
	}
	
	button{
		width:50%;
		text-align: center;
		
		color:#fff;
		background-color: #3d3d3d;
		
		border: 0;
		height: 25px;
	}
	
	tfoot tr{
		height: 36px;
	}
	
	.wrap_table{
		width: 89%;
		overflow:hidden;
		position:absolute;
		top: 160px;
		left:5%;
	}
	
	.text-center{
	
		margin-top:10px;
	}
	.pagination{
		width: 60%;
		margin: 0 auto;
		
		text-align: center;
	}
	.pagination li{
		display: inline-block;
		padding: 10px 5px 0 5px;
	}
	
	.cre{
		float:right;
	
		width: 120px;
		height: 30px;
		
		padding-top:10px;
		margin-right: 10%;
		
		text-align: center;
		border: 1px solid #ededed;
	}
	
	.cre a:hover{
		text-decoration: none;
		color: #aeaeae;
	}
	
	#container2{
		background: none;
	}
	
	#container2 .btn{
		width: 210px;
		height: 50px;
		
		color:#fff;
		background-color:#3d3d3d;
		
		border: 0;
	}
	
	.cre_tit{
		margin: 20px auto;

	}
	
	.lab{
		margin-right: 50px;
	}
	
	#roomName{
		margin-left: 9px;
	}
	
	.form{
		margin-bottom : 5px;
	}
	
	.btn2{
		margin-top:1px;
	}
	
	.form div {
		margin: 20px;
	}
	

</style>
<%-- <jsp:include page ="/WEB-INF/views/common/header.jsp" flush="false" />  --%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<div id="container2">
<div class="wrap loginwrap">
<h1 class="cre_tit">채팅방 생성</h1>
<form method="post">
   <input type='hidden' name='room_owner' value='${customers.member_id }' />    
   <input type="hidden" name='page' value='${cri.page }'/>
   <input type="hidden" name='perPageNum' value='${cri.perPageNum }'/>
   <div class="form">
      <div>
         <label class="lab">방 제목</label>
         <input type="text" name="roomName" id="roomName" placeholder="유저이름 를 설정하세요"/>
         <label class="lab">상대 유저</label>
         <input type="text" name="roomMember" id="roomMember" placeholder="유저ID 를 설정하세요"/>
      </div>      
   </div>
   <div>
      <button type='submit' class="btn">방 만들기</button>
      <input type='reset' class="btn2 btn" value="초기화" />
   </div>
</form>
</div>
</div>