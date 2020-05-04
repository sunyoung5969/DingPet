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
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
		<div class="row ">
			<!-- 페이지 정보 div -->
			<div class="col-xs-12 features">
				 <div class="pt-5 pb-5  mt-5 text-center heading-section">
                  	<h2 class="text-black mb-2">유기견 찾기</h2>
                 </div>
				<!-- <p><c:out value = "${customers.member_id}"/></p> -->
				 <div class = "d-flex justify-content-end mr-5 pr-3">
				 	<a id = "lost_write" href="" class="btn_a"><span class="sub_txt">등록하기 <img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span> </a>
				</div>
			</div>
			
			<script type="text/javascript">
				var loggedInId = '${customers.member_id}';	
			
				$(document).ready(function(){
					$("#lost_write").on("click", function(){
						if(!loggedInId){
							alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
							(this).setAttribute("href", "/customers/p001/signin");
						}else{
							(this).setAttribute("href", "/lostpets/p001/write");
						}
					});
				});
			</script>
			
				<div class="container ">
					<div class="row">
						<div class="col-xs-12  m-5">
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
														<p><strong><c:out value="${list.title }" /></strong></p>
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
														<p><strong><c:out value="${list.title }" /></strong></p>
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
								</div>
							</div>
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


<!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>
