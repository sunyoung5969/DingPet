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
<section style="padding-top:87px" class = "nanumbarungothic">
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); height : 300px;transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
                  	<h1 class="mb-2 color_white">유기견 찾기</h1>
        </div>
    </div>
    
      <div class="carousel-testimonial owl-carousel">
	   	<c:forEach var="list" items="${list }">
	   	 	<div class="item">
	    		<div class="testimonial-box d-flex" style="min-height: 215px;">
	                <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/82.jpg)">
	                </div>
	                <div class="text pl-4">
	                    <span class="quote"><i class="fa fa-quote-left"></i></span>
	                    <p>${list.title }</p>
	                    <p class="name">${list.member_id }</p>
	                    <span class="position">${list.board_date }</span>
	                </div>
	            </div>
	           </div>
	   	</c:forEach>
   	</div>
    

		<div class="row ">
		<!-- 페이지 정보 div -->
			<div class="m_container  o_hidden black">
				<div class="">
					<div class="col-xs-12 ">
						<div class = "section_space"><!-- section wrap -->
							<div class ="flex_row_between"><!-- 설명 section wrap -->
								<a href = "/lostpets/p001/completedList">
									<div class = "d-inline-block"><!-- 타이틀, span -->
										<h2 class="d-inline-block 700">완료 목록</h2>
										<span class ="pl-2"><small><img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr">&nbsp;바로 가기</small></span>
										<p  class = "pl-2">딩펫을 통해 가족과 재회하고 행복을 되찾은 반려견들을 만나보세요!</p>
									</div>
								</a>
								<div class = "d-inline-block pr-5">
									<a id = "write" href="" class="btn_a no_text_deco"><span class="sub_txt ">등록하기 <img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span> </a>
								</div>
							</div><!-- 설명 section wrap ends-->
							<div><!-- list wrap -->
								<c:choose>
									<c:when test ="${empty list }">
										<h2 class = "text_center">아직 작성된 글이 없습니다.</h2>
									</c:when>
									<c:otherwise>
										<ul class = "requests flex_row_start o_hidden">
											<c:forEach items="${list}" var="list">
												<li class ="requestListItem my-3 div_33">
												<a class = " no_text_deco" href = "#">
														<div class = "fair_border hover_shadow">
															<div ><!-- img div -->
																<img src = "/resources/images/dog.jpg" style = " height : 250px;">
															</div>
															<div style = "max-width : 400px;"class = "p-3"><!-- 내용 -->
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
												</li>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						
						<div class = "section_space_bottom"><!-- section wrap -->
							<div class ="flex_row_between"><!-- 설명 section wrap -->
								<a href = "/lostpets/p001/lostList">
									<div class = "d-inline-block"><!-- 타이틀, span -->
										<h2 class="d-inline-block">주인 찾기</h2>
										<span class ="pl-2"><small><img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr">&nbsp;바로 가기</small></span>
										<p  class = "pl-2">유기견을 임시보호 하고 계신가요? 딩펫에서 쉽고 빠르게 주인을 찾아보세요!</p>
									</div>
								</a>
								<div class = "d-inline-block pr-5">
									<a id = "write" href="" class="btn_a no_text_deco"><span class="sub_txt ">등록하기 <img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span> </a>
								</div>
							</div><!-- 설명 section wrap ends-->
							<div><!-- list wrap -->
								<ul class = "requests flex_row_start o_hidden">
									<c:forEach items="${list}" var="list">
										<li class ="requestListItem my-3 div_33">
											<a class = "no_text_deco" href = "#">
												<div class = "fair_border hover_shadow">
													<div ><!-- img div -->
														<img src = "/resources/images/dog.jpg" style = " height : 250px;">
													</div>
													<div style = "width : 400px;" class = "p-3"><!-- 내용 -->
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
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						
						<div class = "section_space_bottom"><!-- section wrap -->
							<div class ="flex_row_between"><!-- 설명 section wrap -->
								<a href = "/lostpets/p001/findList">
									<div class = "d-inline-block"><!-- 타이틀, span -->
										<h2  class="d-inline-block">반려견 찾기</h2>
										<span class ="pl-2"><small><img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr">&nbsp;바로 가기</small></span>
										<p  class = "pl-2">잃어버린 반려견을 찾고 계신가요? 딩펫이 도와드릴게요!</p>
									</div>
								</a>
								<div class = "d-inline-block pr-5">
									<a id = "write" href="" class="btn_a no_text_deco"><span class="sub_txt ">등록하기 <img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span> </a>
								</div>
							</div><!-- 설명 section wrap ends-->
							<div><!-- list wrap -->
								<ul class = "requests flex_row_start o_hidden">
									<c:forEach items="${list}" var="list">
										<li class ="requestListItem my-3 div_33">
											<a class = "no_text_deco" href = "#">
												<div class = "fair_border hover_shadow">
													<div ><!-- img div -->
														<img src = "/resources/images/blue.jpg" style = " height : 250px;">
													</div>
													<div style = "width : 400px;" class = "p-3"><!-- 내용 -->
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
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						
						
						
						
						
						
						
							<!-- @@@@@@@@ -->
							<!-- 탭 메뉴 -->
							<nav>
								<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
									<a class="nav-item nav-link active" id="nav-home-tab"
										data-toggle="tab" href="#nav-home" role="tab"
										aria-controls="nav-home" aria-selected="true"><strong>임시보호</strong></a> <a
										class="nav-item nav-link" id="nav-profile-tab"
										data-toggle="tab" href="#nav-profile" role="tab"
										aria-controls="nav-profile" aria-selected="false"><strong>실종견 찾기</strong></a>
								</div>
							</nav>
							
							<!-- 탭 내용 -->
							<div class="col-xs-12 tab-content py-3 px-3 mb-5 px-sm-0 blue_border soft_shadow " id="nav-tabContent">
								<div class="tab-pane mt-5 mb-3 fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
									
									<!-- 내용이 없는 경우 -->
									<c:if test="${empty list }">
										<c:out value="비어있음" />
									</c:if>
									
									<!-- 내용 표시 -->
									<div class = "list_content pl-5 pb-3 mb-3" >
										<c:forEach items="${list}" var="list">
											<div class="w-40 col-xs-12 col-md-6 col-sm-6 wow soft_border fadeInUp m-4 animated hover_shadow"
												data-wow-duration="300ms" data-wow-delay="0ms"
												style=" visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
												<a class="move" href='<c:out value = "${list.board_id}"/>'>
												<div class="flex_column">
													<div class="mb-2">
														<img alt="image" width="100%" height="60%" src="/resources/images/dog.jpg">
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
								<!-- @@@@@@@@ -->
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
		}else{
			$("#lost_write").on("click", function(){
				(this).setAttribute("href", "/lostpets/p001/write");
			});
			
			$("#to_request_list").click(function(){
				(this).setAttribute("href", "/lostpets/request/list?member_id=" + loggedInId);
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
			actionForm.append("<input type = 'hidden' name = 'board_id' value = '" + $(this).attr("href")+ "'>");
			actionForm.attr("action", "view");
			actionForm.submit();
		});
	});
</script>


<!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>
