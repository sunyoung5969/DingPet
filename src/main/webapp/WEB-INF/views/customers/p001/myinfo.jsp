<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
    		
		var formObj = $("form");
    		
		$('input').on("click", function(e){
    			
			e.preventDefault(); //기본 동작 막음    			
    		var operation = $(this).data("oper");
    		console.log(operation);
    			
    		if(operation === 'withdraw'){
    			formObj.attr("action", "/customers/p001/withdraw");
    			alert("잘가요안녕");
    		}else if(operation  === 'change'){
    			formObj.attr("action", "/customers/p001/change");
    			alert("펫시터신청페이지로 이동합니다");
    		}
    		
    			formObj.submit();
    		});
    });
    </script>


<div class="main">  
	<section class="signup">
	<div class="sign_container m-auto w-50">
	<div class="signup-content d-block" >
	<div class="w-75 m-auto">
		<h2 class="form-title pb-3">마이페이지</h2>
			
		<form method="post" action="myinfo">
			<div class = "flex-row">
			<h3 class = "color_blue d-inline">회원 정보</h3>
			</div>
			<br>
			
			<div class="form-group">
			<strong>아이디</strong>
			<input type="text" name="member_id" value="<c:out value="${customers.member_id}" />" readonly="readonly" />
			</div>

			<div class="form-group">
			<strong>비밀번호</strong>
			<input type="text" name="member_pwd"  maxlength="20" value="<c:out value="${customers.member_pwd}" />" />
			</div>
       
			<div class="form-group">
			<strong>이름</strong>
			<input type="text" name="member_name" maxlength="20" value="<c:out value="${customers.member_name}" />" />
			</div>
                            
			<div class="form-group">
			<strong>닉네임</strong>
			<input type="text" name="member_nickname"  maxlength="20" value="<c:out value="${customers.member_nickname}" />" />
   			</div>
                            
			<div class="form-group">
			<strong>연락처</strong>
			<input type="text" name="member_contact" maxlength="20" value="<c:out value="${customers.member_contact}" />" />
			</div>
                            
			<div class="form-group">
			<strong>이메일</strong>
			<input type="text" name="member_email"  maxlength="20" value="<c:out value="${customers.member_email}" />" >
			</div>
			<br>
			
			<div class="filebox">
			<strong>프로필 사진</strong>
			<input type="file" name="file" accept="image/*" value="<c:out value="${customers.member_photo}" />" >
			</div>
			
			<script>
			var sel_file;

			$(document).ready(function(){
				$("#member_photo").on("change", handleImgFileSelect);
				});

				function handleImgFileSelect(e){
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);

				filesArr.forEach(function(f){
					sel_file = f;

					var reader = new FileReader();
					reader.onload = function(e){
						$('#img').attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
				});
			}
			</script>
			<br>
			<br>
			<!-- 반려동물 정보 -->
			<div class = "flex-row">
			<h3 class = "color_blue d-inline">반려견 정보</h3>
			</div>
			<br>
			               
			<div class="form-group">
			<strong>반려견 이름</strong>
			<input type="text" id="dog_name" name="dog_name" maxlength="30" value="<c:out value="${dogs.dog_name}" />" />
			</div>
						
			<div class="form-group">
			<strong>견종</strong>
			<input type="text" id="dog_breed" name="dog_breed" maxlength="30" value="<c:out value="${dogs.dog_breed}" />" />
			</div>
							
			<div class="form-group">
			<strong>반려견 성별</strong>
			<input type="text" id="dog_sex" name="dog_sex" value="<c:out value="${dogs.dog_sex}" />" />
			</div>
							
			<div class="form-group">
			<strong>반려견 크기</strong>
			<input type="text" id="dog_size" name="dog_size" value="<c:out value="${dogs.dog_size}" />" />
			</div>
							
			<div class="form-group">
			<strong>활동성</strong>
			<input type="text" name="activity_level" value="<c:out value="${dogs.activity_level}" />" />
			</div>
							
			<div class="form-group">
			<strong>특이사항</strong>
			<input type="text" id="dog_note" name="dog_note" maxlength="100" value="<c:out value="${dogs.dog_note}" />" />
			</div>   
 			
 			<div class="form-group form-button" align="center">                    
			<input type="button" data-oper='modify' class="form-submit" value="정보수정">
			<input type="button" data-oper='withdraw' class="form-submit" value="회원탈퇴">
			<input type="button" data-oper='change' class="form-submit" value="기분전환">
			</div>
		</form>   
						 
	</div>
	</div>
	</div>
	</section>
</div>

<%@include file="../../includes/footer.jsp"%>
