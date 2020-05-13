<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

	<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
    <!--탭 메뉴 -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	
				
<!--====  str of contents  ====-->
<section style="padding-top:87px">
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
                  	<h1 class="mb-2 color_white">확인 요청 목록</h1>
        </div>
    </div>
    
	<div class="row ">
		<!-- 페이지 정보 div -->
		
			<div class="container ">
				<div class="row">
					<div class="col-xs-12  m-5">
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
							<div class="tab-pane mt-5 mb-3 fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								
								<c:choose>
									<c:when  test = "${empty myList }">
										<h2 class = "section_space color_black text_center">확인할 요청이 없습니다.</h2>
									</c:when>
									<c:otherwise>
										<c:forEach items = "${myList}" var = "myList">
											<div class = "my-5">
												<div class="shadow_around no_round_border w-90 mx-auto my-2">
													<a class ="no_text_deco" target = "_blank" href="/lostpets/p001/view?board_id=${myList.board_id}">
															<div class="flex_row py-5 mx-auto w-75">
																<div class="w-25 d-inline-block">
																	<img class=".nav-pills" style="width: 150px; height: 150px;" src='/resources/images/dog2.jpg'>
																</div>
																<div class="w-75 pl-3 pt-3 d-inline-block">
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
														</a>
														<hr class = "hr_style mb-3 w-75">
													<!-- 요청 목록 -->
													<div class = "w-90 mx-auto my-2 request_wrap">
													<!-- 
														<div class = "arrow_div">
															<div class = "arrow_left_background flex_row">
																<i class="fas fa-chevron-left arrow"></i>
															</div> 
															<div class ="arrow_right_background flex_row">
																<i class="fas fa-chevron-right arrow"></i>
															</div>
														</div>
													 -->
												<div class="pb-3">
													<ul class = "requests flex_row_start o_hidden">
													<c:forEach items="${requestList}" var="request">
														<c:if test="${myList.board_id == request.receiver_b_id }">
															<li class = "requestListItem">
															<div class="m-3 request_box soft_shadow no_round_border" style="width: 300px; height : 450px;">
																<div class=" d-inline-block ">
							
																	<a class="no_text_deco" target="_blank" href="/lostpets/p001/view?board_id=${request.board_id}">
																		<div class=" round_top_border o_hidden">
																			<img class="round_top_border" style="width: 100%; height: 200px;" src='/resources/images/dog2.jpg'>
																		</div>
							
																		<div class="p-3  o_hidden" style = "height: 190px;">
																			<p class="text_overflow"> <strong>${request.title}</strong> </p>
																			<p class="pl-2">
																				<span class="tag">견종</span><span> </span> <span>${request.dog_breed}</span>
																				<span class="pl-2"></span> 
																			</p>
																			<p class="pl-2">	
																				<span class="tag">성별</span><span></span>
																				<span>${request.dog_sex}</span>
																			</p>
																			<p class="pl-2">
																				<span class="tag ">실종 장소</span><span> </span><span class = "text_overflow_wrap">${request.found_location}</span>
																			</p>
																		</div>
																	</a>
							
																	<div class="flex_row b_round_border">
																		<button data-board_id="${myList.board_id }" data-request_id="${request.request_id }" data-sender_id = "${myList.member_id} " 
																		 data-receiver_id = "${request.member_id}"class="confirmRequest confirm_left"><strong>완료</strong></button>
																		<button data-request_id="${request.request_id }" class="deleteRequest confirm_right"><strong>삭제</strong></button>
																	</div>
							
																</div>
															</div></li>
														</c:if>
													</c:forEach>
												</ul>
											</div>

										</div>
									</div>
									
									</div>	
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
					<hr class = "hr_style mb-3 w-75">
					<!-- Pagination -->
					<div>
							<nav class = "pagination_nav"aria-label="Page navigation example">
								<ul class="pagination">
									<c:if test="${pagination.prev }">
										<li class="page-item"><a class="page-link"
											href="#	aria-label= "Previous"> <span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
										</a></li>
									</c:if>
									<c:forEach var="num" begin="${pagination.startPage }"
										end="${pagination.endPage }">
										<li class="page-item ${pagination.cri.pageNum == num ? "active" : "" }"><a
											class="page-link" href="${num }">${num }</a></li>
									</c:forEach>
									<c:if test="${pagination.next }">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												<span class="sr-only">Next</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					<!--pagination ends  -->
					</div>

							<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
							<!-- 내용이 없는 경우 -->
								<c:if test="${empty list }">
									<c:out value="비어있음" />
								</c:if>
								
								<!-- 내용 표시 -->
								<div class = "list_content pl-5  pb-3 mb-3" >
									<c:forEach items="${list}" var="list" begin ="1" end ="5">
										<div class="w-40 col-xs-12 col-md-6 col-sm-6 wow soft_border fadeInUp m-4 animated hover_shadow"
											data-wow-duration="300ms" data-wow-delay="0ms"
											style=" visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
											<a class="move" href='<c:out value = "${list.board_id}"/>'>
											<div class="flex_column">
												<div class="mb-2">
													<img alt="image" width="100%" height="60%" src="/resources/images/blue.jpg">
												</div>
												<div class="text_left w-100 pl-3">
													<p class = "text_overflow"><strong><c:out value="${list.title }" /></strong></p>
													<p class = "pl-2"><span class="tag">견종</span><span> </span><c:out value="${list.dog_breed}" /></p>
													<p class = "pl-2"><span class="tag">성별</span><span></span> <c:out value="${list.dog_sex}" /></p>
													<p class = "pl-2">
														<span class="tag">발견장소</span><span></span>
														<c:out value="${list.found_location}" />
													</p>
												</div>
											</div>
											</a>
										</div>
									</c:forEach>
								</div>
							<hr class = "hr_style mb-3 w-75">
							<!-- Pagination -->
								<div>
										<nav class = "pagination_nav"aria-label="Page navigation example">
											<ul class="pagination">
												<c:if test="${pagination.prev }">
													<li class="page-item"><a class="page-link"
														href="#	aria-label= "Previous"> <span aria-hidden="true">&laquo;</span>
															<span class="sr-only">Previous</span>
													</a></li>
												</c:if>
												<c:forEach var="num" begin="${pagination.startPage }"
													end="${pagination.endPage }">
													<li class="page-item ${pagination.cri.pageNum == num ? "active" : "" }"><a
														class="page-link" href="${num }">${num }</a></li>
												</c:forEach>
												<c:if test="${pagination.next }">
													<li class="page-item"><a class="page-link" href="#"
														aria-label="Next"> <span aria-hidden="true">&raquo;</span>
															<span class="sr-only">Next</span>
													</a></li>
												</c:if>
											</ul>
										</nav>
									</div>
									<!-- pagination ends -->
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

<script type = "text/javascript" src = "/resources/js/request.js"></script>

<script>
	$(function(){
		//완료 버튼 >> 완료 처리 : lost_found에서 status y로 변경(y이면 글에 완료됐다는 표시해주기), 완료 테이블에 해당 글 lost_id, find_id, 컬럼으로 두 개의 board_id 매핑 저장, 완료 날짜 저장	
		$(".confirmRequest").click(function(){
			var board_id = $(event.target).attr('data-board_id');
			var request_id = $(event.target).attr('data-request_id');
			var sender_id = $(event.target).attr('data-sender_id');
			var receiver_id = $(event.target).attr('data-receiver_id');
			
			var ids = {
					board_id : board_id,
					request_id : request_id
			}
			
			console.log("request_id = " + ids.request_id);
			console.log("board_id = " + ids.board_id);
			var parent_div = $(event.target).parents(".request_box");
	
			if(confirm('정말 완료하시겠어요?')){
				requestService.confirm(ids, function(){
					console.log(parent_div);
					parent_div.hide('slow');
					alert('축하드려요! 완료 처리 되었습니다.');
				});
				
			}
		});
		
		//아니에요 버튼 >> 요청 목록에서 삭제 ajax로
		$(".deleteRequest").click(function(){
			var request_id = $(event.target).attr('data-request_id');
			console.log("request_id = " + request_id);
			
			var parent_div = $(event.target).parents(".request_box");
			
			if(confirm('정말 삭제하시겠어요?')){
				requestService.remove(request_id, function(){
					parent_div.hide('slow');
					
				});
			}
		});
		
	});
</script>

<script>
	$(function(){
		
		
	});
</script>

<!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>