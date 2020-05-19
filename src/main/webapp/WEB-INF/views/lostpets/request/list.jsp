<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

	<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/carousel.css">
    <!--탭 메뉴 -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	
				
<!--====  str of contents  ====-->
<section style="padding-top:87px">
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/main.jpg'); height : 400px;transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto color_white">
             <h1 style="font-family:GmarketSansBold;">요청 목록</h1>
             <p style="font-size:1.1em;">받은 요청과 보낸 요청을 조회하고 관리할 수 있습니다. </p>
        </div>
    </div>
    
	<!-- 페이지 정보 div -->
	<div class="m_container color: color_black">
		<div class="row">
			<div class="col-xs-12  m-5">
			<!-- 
				<div class ="flex_row_between"><!-- 설명 section wrap 
					<div class = "pb-3"><!-- 타이틀, span 
						<h1 class="color_dark_blue narrow">요청 목록</h1>
						<span  class = "pl-2 d-inline-block color_grey">받은 요청과 보낸 요청을 조회하고 관리할 수 있습니다.</span>
					</div>
				</div><!-- 설명 section wrap ends
			 -->
				<!-- 탭 메뉴 -->
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">
						<strong>받은 요청</strong></a>
						<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">
						<strong>보낸 요청</strong></a>
					</div>
				</nav>
				
				<!-- 받은 요청 탭 내용 -->
				<div class="col-xs-12 tab-content py-3 px-3 mb-5 px-sm-0 soft_shadow " id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						<c:choose>
							<c:when  test = "${empty myList }">
								<h2 class = "section_space color_black text_center">확인할 요청이 없습니다.</h2>
							</c:when>
							<c:otherwise>
								<c:forEach items = "${myList}" var = "myList">
									<div class = "my-5">
										<div class="shadow_around no_round_border w-90 mx-auto my-2">
											<a class ="no_text_deco" target = "_blank" href="/lostpets/p001/view?board_id=${myList.board_id}">
												<div class="py-4 w-70">
													<div class="soft_border_orange flex_row p-3 mt-5 mb-3 mx-auto w-75">
														<div class="m-3 w-100">
															<div class="w-30 d-inline-block text_center v_center">
																<img style="width: 180px; height: 130px; border-radius:10px;" src="https://www.dingpet.shop/lost/${myList.front_name}">
															</div>
															<div class="w-70 pl-3 pt-3 d-inline-block v_center">
																<p class = "text_overflow"> <strong>${myList.title}</strong> </p>
																<p class="pl-2">
																	<span class="tag">견종</span><span> </span> <span>${myList.dog_breed}</span> 
																	<span class="pl-2"></span> 
																	<span class="tag">성별</span><span></span> <span>${myList.dog_sex}</span>
																</p>
																<p class="pl-2">
																	<span class="tag">실종 장소</span><span> </span><span>${myList.found_location}</span>
																</p>
															</div>
														</div>
													</div>
												</div>
											</a>
											<div class="text_center pb-4" ><img style = "width:70px;" style = ""src="/resources/images/icon/from.png"></div>
										<!-- 요청 목록 -->
										<div class = "w-90 mx-auto my-2 request_wrap">
										<div class="pb-3 list_wrap">
											<ul class = "requests flex_row_start o_hidden">
											<c:forEach items="${requestFrom}" var="requestFrom">
												<c:if test="${myList.board_id == requestFrom.receiver_b_id }">
													<li class = "requestListItem">
														<div class="m-3 request_box soft_shadow no_round_border" style="width: 300px; height : 450px;">
															<a class="no_text_deco" target="_blank" href="/lostpets/p001/view?board_id=${requestFrom.board_id}">
																<div class=" round_top_border o_hidden">
																	<img class="round_top_border" style="width: 100%; height: 200px;" src='https://www.dingpet.shop/lost/${requestFrom.front_name}'>
																</div>
					
																<div class="p-3  o_hidden" style = "height: 190px;">
																	<p class="text_overflow"> <strong>${requestFrom.title}</strong> </p>
																	<p class="pl-2">
																		<span class="tag">견종</span><span> </span> <span>${requestFrom.dog_breed}</span>
																		<span class="pl-2"></span> 
																	</p>
																	<p class="pl-2">	
																		<span class="tag">성별</span><span></span>
																		<span>${requestFrom.dog_sex}</span>
																	</p>
																	<p class="pl-2">
																		<span class="tag ">실종 장소</span><span> </span><span class = "text_overflow_wrap">${requestFrom.found_location}</span>
																	</p>
																</div>
															</a>
					
															<div class="flex_row b_round_border">
																<button class="confirmRequest confirm_left"><strong>맞아요!</strong></button>
																<button data-request_id="${requestFrom.request_id}" class="deleteRequest confirm_right"><strong>아니에요</strong></button>
															</div>
															<%@include file="../../lostpets/request/confirmationModal.jsp"%>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
										<div class="list_nav">
											<i class="fas fa-chevron-left  arrow_prev_o"></i>
											<i class="fas fa-chevron-right  arrow_next_o"></i>
										</div>	
									</div>

								</div>
							</div>
							
						</div>	
				</c:forEach>
			</c:otherwise>
		</c:choose>
			
			</div>
			<!-- @@@@@Tab menu separation@@@@@ -->
			<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				<c:choose>
					<c:when  test = "${empty myRequest }">
						<h2 class = "section_space color_black text_center">확인할 요청이 없습니다.</h2>
					</c:when>
					<c:otherwise>
						<c:forEach items = "${myRequest}" var = "myRequest">
							<div class = "my-5">
								<div class="shadow_around no_round_border w-90 mx-auto my-2">
									<a class ="no_text_deco" target = "_blank" href="/lostpets/p001/view?board_id=${myRequest.board_id}">
										<div class="py-4">	
											<div class="soft_border_blue flex_row p-3 mt-5 mb-3 mx-auto w-75">
												<div class="m-3 w-100">
													<div class="w-30 d-inline-block text_center v_center">
														<img style="width: 180px; height: 130px; border-radius:10px;" src='https://www.dingpet.shop/lost/${myRequest.front_name}'>
													</div>
													<div class="w-70 pl-3 pt-3 d-inline-block v_center">
														<p class = "text_overflow"> <strong>${myRequest.title}</strong> </p>
														<p class="pl-2">
															<span class="tag">견종</span><span> </span> <span>${myRequest.dog_breed}</span> 
															<span class="pl-2"></span> 
															<span class="tag">성별</span><span></span> <span>${myRequest.dog_sex}</span>
														</p>
														<p class="pl-2">
															<span class="tag">실종 장소</span><span> </span><span>${myRequest.found_location}</span>
														</p>
													</div>
												</div>
											</div>
										</div>
									</a>
							      	<div class="text_center pb-4" ><img style = "width:70px;" style = ""src="/resources/images/icon/to.png"></div>
									<!-- 요청 목록 -->
									<div class = "w-90 mx-auto my-2 request_wrap">
										<div class="pb-3 list_wrap">
											<ul class = "requests flex_row_start o_hidden">
											<c:forEach items="${requestTo}" var="requestTo">
												<c:if test="${myRequest.board_id == requestTo.sender_b_id }">
													<li class = "requestListItem">
														<div class="m-3 request_box soft_shadow no_round_border" style="width: 300px; height : 450px;">
															<a class="no_text_deco" target="_blank" href="/lostpets/p001/view?board_id=${requestTo.board_id}">
																<div class=" round_top_border o_hidden">
																	<img class="round_top_border" style="width: 100%; height: 200px;" src='https://www.dingpet.shop/lost/${requestTo.front_name}'>
																</div>
					
																<div class="p-3  o_hidden" style = "height: 190px;">
																	<p class="text_overflow"> <strong>${requestTo.title}</strong> </p>
																	<p class="pl-2">
																		<span class="tag">견종</span><span> </span> <span>${requestTo.dog_breed}</span>
																		<span class="pl-2"></span> 
																	</p>
																	<p class="pl-2">	
																		<span class="tag">성별</span><span></span>
																		<span>${requestTo.dog_sex}</span>
																	</p>
																	<p class="pl-2">
																		<span class="tag ">실종 장소</span><span> </span><span class = "text_overflow_wrap">${requestTo.found_location}</span>
																	</p>
																</div>
															</a>
					
															<div class="flex_row b_round_border">
																<button data-request_id="${requestTo.request_id}" class="deleteRequest requestCancel"><strong>요청 취소</strong></button>
															</div>
						
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
										<div class="list_nav">
											<i class="fas fa-chevron-left  arrow_prev "></i>
											<i class="fas fa-chevron-right  arrow_next"></i>
										</div>	
									</div>

						</div>
					</div>
					
					</div>	
			</c:forEach>
		</c:otherwise>
		</c:choose>
			</div>
		</div>
					
				</div>
			</div>
		</div>
</section>



<!-- 데이터 전송용 get form -->
<form id='actionForm' action="/lostpets/p001/list" method='get'>
	<input type="hidden" name="pageNum" value="${pagination.cri.pageNum }">
	<input type="hidden" name="amount" value="${pagination.cri.amount }">
</form>

		<script type="text/javascript">
			var loggedInId = '${customers.member_id}';	
		
			$(document).ready(function(){
				
				if(!loggedInId){
					$("#lost_write, #to_request_list").on("click", function(){
						alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
						(this).setAttribute("href", "/customers/p001/signin");
					});
					/*	
					$("#to_request_list").click(function(){
						alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
						(this).setAttribute("href", "/customers/p001/signin");
					})*/
					}else{
						$("#lost_write").on("click", function(){
							(this).setAttribute("href", "/lostpets/p001/write");
						});
						
						$("#to_request_list").click(function(){
							(this).setAttribute("href", "/lostpets/p001/request?member_id=" + loggedInId);
						});
					}
			});
		</script>

		<script type="text/javascript">
		
		$(document).ready(function() {
		
			var actionForm = $("#actionForm");
		
			$(".page-item a").on("click",function(e) {
				e.preventDefault();
				actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
		
			$(".move")	.on(	"click",function(e) {
				e.preventDefault();
				actionForm.append("<input type = 'hidden' name = 'board_id' value = '"
					+ $(this).attr("href")+ "'>");
				actionForm.attr("action", "view");
				actionForm.submit();
			});
		});
		</script>

<script type = "text/javascript" src = "/resources/js/carousel.js"></script>
<script type = "text/javascript" src = "/resources/js/request.js"></script>

		<script>
		$(function(){
			
			//아니에요 버튼 >> 요청 목록에서 삭제 ajax로
			$(".deleteRequest").click(function(){
				var request_id = $(event.target).attr('data-request_id');
				console.log("request_id = " + request_id);
				
				var parent_li = $(event.target).parents("li");
				
				if(confirm('정말 삭제하시겠어요?')){
					requestService.remove(request_id, function(){
						parent_li.hide('slow');
						
					});
				}
			});
			
		});
		</script>
		
		<script>
			
		
		</script>


<!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>