<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>
<style>

.heading-section{
	width: 100%;
	display: block;
}

.reservation-row{
	display: inline-block;
	width: 100%;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

.reservation-list{
	display: flex;
    border: solid 1px gray;
    margin: 25px;
    border-radius: 15px;
}
.card-body{
	display:inline-block;
	width: 60%;
	padding: 15px;
}

.crop{	
	display: inline-block;
	max-width: 205px;
	max-height: 145px;
	overflow: hidden;

}

.card-img-top{
	padding: 15px;
}

.crop img{

    max-height: initial;

    margin-top: -15%;

}

.reserved-date{
	display: inline-block;
	margin-top: 0px;
	padding: 0px 10px
}



.cancel-btn{
	display: inline-block;
    width: 12%;
    padding: 1.5% 1%;

}

.btn-danger{
	border-radius: 15px;
}

.btnform{
	padding: 10px 0px
}

</style>
<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-3" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-2">예약 정보</h2>                          
                        </div>
                        <div class="reservation-row">
	                        <div class="col-xs-12  m-5">
								<!-- 탭 메뉴 -->							
								<nav>
									<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
										<a class="nav-item nav-link active show" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><strong>임시보호</strong></a> <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"><strong>실종견 찾기</strong></a>
									</div>
								</nav>
								
								<!-- 탭 내용 -->
								
								<div class="list-container">
									<div class="list-div">
										<c:forEach var="list" items="${mySitterList }">
											<div class="reservation-list">
			                            		<!-- 사진 -->
			                            		<div class="crop">
			                                    	<img class="card-img-top" src="/resources/images/person_8.jpg"> <!-- C:\test\pic\ff8fe0c3-e64d-462d-ab7a-fb4152345112profile_pngguru.com (7).png -->
				                                </div>
				                                <div class="card-body">
				                                	<!-- 주문 번호 -->
													<p class="card-text">예약 번호 : ${list.order_ID }</p>
				                                
				                                	<!-- 닉네임 / 예약일시 -->
				                                	<div class="reserved-date-div" align="center">
				                                	
				                                		<h5 class="" style="margin-top: 0px">펫시터 - ${list.sitter_NickName }</h5>
				                                	
					                                	<h5 class="reserved-date" >시작 ${list.start_Date } ${list.start_Time }:00</h5>
					                                	<h5 class="reserved-date"> - </h5>
					                                	<h5 class="reserved-date">종료 ${list.end_Date } ${list.end_Time }:00</h5>
				                                    </div>
				                                    <!-- 주소 -->
				                                    <!-- 버튼 -->
				                                    
				                                </div>
				                                <div class="cancel-btn">
													<form class="btnform" action="/petsitting/p003/logregister" method="post">
														<input type="hidden" name="reservation_ID" value="${list.order_ID }">
					                                    <button class="btn btn-danger">일지등록</button>
				                               		</form>
				                               		<form class="btnform" action="/petsitting/p003/loglookup" method="post">
														<input type="hidden" name="reservation_ID" value="${list.order_ID }">
					                                    <button class="btn btn-danger">일지조회</button>
				                               		</form>
				                               		 
					                                <form class="btnform" action="kakaoPayCancel" method="post" onsubmit="return check()">
					                                  
					                                    <input type="hidden" class="order_ID" name="order_ID" value="${list.order_ID }">
														<button class="btn btn-danger">예약취소</button>
				                               		
				                               		</form>
			                               		</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!--====  end of contents  ====--> 
	<script>
		function check(){
			
			var result = confirm("예약을 취소하시겠습니까?");
			
			if(result){
				return true;
			}else{
				return false;
			}
		}
	
	</script>
<%@include file="../../includes/footer.jsp"%>
