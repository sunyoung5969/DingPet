<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<section class="site-section container pt-7">
	<div class="row ">
		<div class="features">
			<div class="t_bar">
				<div class="sub_title">주인을 찾습니다</div><p>유기견을 보호하고 계신가요? 하루 빨리 주인을 찾을 수 있게, 지금 바로 게시글을 등록해주세요!</p>
				<a href="/lostpets/p001/write" class="btn_a"><span class="sub_txt">등록하기
					<img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span>
				</a>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-xs-12 ">
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
						<div class="tab-content py-3 px-3 px-sm-0 border_top" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								
								<!-- 내용이 없는 경우 -->
								<c:if test="${empty list }">
									<c:out value="비어있음" />
								</c:if>
								
								<!-- 내용 표시 -->
								<div class = "list_content" >
									<c:forEach items="${list}" var="list">
										<div class="col-md-6 col-sm-6 wow fadeInUp animated"
											data-wow-duration="300ms" data-wow-delay="0ms"
											style="visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
											<div class="media service-box">
												<div class="pull-left">
													<img alt="image" width="124px" height="124px"
														src="/resources/images/signup-image.png">
												</div>
												<div class="media-body">
													<a class="move" href='<c:out value = "${list.board_id}"/>'>
														<h4 class="media-heading">
															<c:out value="${list.title }" />
														</h4>
													</a>
													<p>
														<span class="tag">견종</span><span></span>
														<c:out value="${list.dog_breed}" />
													</p>
													<p>
														<span class="tag">성별</span><span></span>
														<c:out value="${list.dog_sex}" />
													</p>
													<p>
														<span class="tag">발견장소</span><span></span>
														<c:out value="${list.found_location}" />
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							
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

							<div class="tab-pane fade" id="nav-profile" role="tabpanel"
								aria-labelledby="nav-profile-tab">Et et consectetur ipsum
								labore excepteur est proident excepteur ad velit occaecat qui
								minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim
								pariatur veniam sunt est aute sit dolor anim. Velit non irure
								adipisicing aliqua ullamco irure incididunt irure non esse
								consectetur nostrud minim non minim occaecat. Amet duis do nisi
								duis veniam non est eiusmod tempor incididunt tempor dolor ipsum
								in qui sit. Exercitation mollit sit culpa nisi culpa non
								adipisicing reprehenderit do dolore. Duis reprehenderit occaecat
								anim ullamco ad duis occaecat ex.</div>
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
