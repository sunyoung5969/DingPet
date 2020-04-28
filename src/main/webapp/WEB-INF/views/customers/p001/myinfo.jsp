<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sign.css">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
    		
		var formObj = $("form");
    		
		$('button').on("click", function(e){
    			
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
        <!-- Sign up form -->
		<section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                    
                        <h2 class="form-title">나 의 정 보</h2>
			
						<form method="post" action="myinfo">
						
							<div class="form-group">
							아이디<input type="text" name="member_id" value="<c:out value="${customers.member_id}" />" readonly="readonly" />
							</div>

   							<div class="form-group">
					     	비밀번호<input type="text" name="member_pwd"  maxlength="10" value="<c:out value="${customers.member_pwd}" />" />
                            </div>
       
                            <div class="form-group">
						   	이름<input type="text" name="member_name" value="<c:out value="${customers.member_name}" />" readonly="readonly" />
                            </div>
                            
                            <div class="form-group">
							닉네임<input type="text" name="member_nickname"  maxlength="5" value="<c:out value="${customers.member_nickname}" />" />
                            </div>
                            
                            <div class="form-group">
							이메일<input type="text" name="member_email"  maxlength="20" value="<c:out value="${customers.member_email}" />" >
                            </div>
                            
	<!-- 반려동물 정보입력 -->
							<div class="form-group">
							반려견 이름<input type="text" id="dog_id" name="dog_id" maxlength="10" placeholder="Dog Name" />
							</div>
							
							<div class="form-group">
							반려견 종류<input type="text" id="dog_type" name="dog_type" maxlength="10" placeholder="Dog Breeds" />
							</div>
							
							<div class="form-group">
							반려견 크기<input type="text" id="dog_size" name="dog_size" maxlength="10" placeholder="Dog Size" />
							</div>
							
							<div class="form-group">
							특이사항<input type="text" id="dog_size" name="dog_size" maxlength="10" placeholder="Remark" />
							</div>   
							                         
							<div class="form-group">
							사진<input type="file" name="member_email" value="<c:out value="${customers.member_photo}" />" >
                            </div>
                                               
                            <button type="submit" data-oper='modify' class="form-group form-button">정보수정</button>
							<button type="submit" data-oper='withdraw' class="form-group form-button">회원탈퇴</button>
							<button type="submit" data-oper='change' class="form-group form-button">회원전환</button>	
						</form>   
						 
					</div>
				</div>
			</div>
		</section>
    </div>


<%@include file="../../includes/footer.jsp"%>
