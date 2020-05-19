<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">





    <!--====  str of contents  ====-->
    <section class = "nanumbarungothic" style="padding-top:87px">
        <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/com.jpg'); 
        	transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-5 pb-5" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="color_dark_blue narrow mb-2" style="font-family:GmarketSansBold; font-size:35px;">완료 후기</h2>
                        </div>
                    </div>
                    <!-- 제목, 작성자, 작성일시-->
                    <div class="ml-3 mr-3 mt-3 align-self-center pb-3">
	                	<h2 class = "mb-2 color_blue" ><c:out  value = "${completed.match_title}"/></h2>
	                    <div class = "top_info">
		    	            <span><strong><c:out value = "${completed.receiver_nick}님, ${completed.sender_nick }님"/></strong></span>
		    	            <span id = "board_date"></span>
	                    </div>
                   	</div>
                   	<hr class = "hr_style">
                    <div class="col-12 row pt-3 dp-webkit ">
                            <div class="image-block bg-about w-100 text_center" >
                            	<c:set var = "photo_path" value = "https://www.dingpet.shop/lost/${completed.photo_name}" />
                                <img class="img-fluid m-auto" src="${completed.photo_name != null ? photo_path : '/resources/images/blue.jpg'}"  style = "max-width: 900px; height: 400px;">
                            </div>
                    </div>
                     <div class="col-12 row pt-3 dp-webkit ">
                    	<div class="align-self-center w-100 ">
                     		<!-- 내용 -->
                     		<h3 class = "color_blue mt-3">내용</h3>	
		                    <div class = "round_border mt-3 mb-4">
                     		<div class="m-5">
			                    	<pre class = "h6" style = "border : none !important;"><c:out  value = "${completed.match_content}"/></pre>
		                    </div>
		                    <!-- 내용 끝 -->
                        </div>
                    
                     
					<!-- buttons -->
					<div class="text-center pt-3 pb-5">
						<form id='operForm' action='completedList' method='get'>
							<input type="hidden" name="pageNum" value="${cri.pageNum }"> 
							<input type="hidden" name="amount" value="${cri.amount }">
							<button data-oper="list" class="btn-sm btn btn-primary mr-3">목록으로</button>
						</form>
					</div>
					<!-- buttons end--> 
					</div>
					</div>
            </div>
        </div>
      </section>
					
			
    <!--====  end of contents  ====-->    

<%@include file="../../includes/footer.jsp"%>