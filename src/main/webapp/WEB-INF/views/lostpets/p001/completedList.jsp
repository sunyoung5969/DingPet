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
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/com.jpg'); height : 400px;transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto color_white">
           	<h1  style="font-family:GmarketSansBold;">찾았어요</h1>
           	<span style="font-size:1.1em;">딩펫을 통해 가족과 재회하고 행복을 되찾은 반려견들을 만나보세요!</span>
        </div>
    </div>
    

	<div class="row ">
			<div class="m_container  o_hidden">
				<div class="">
					<div class="col-xs-12 ">
						
						<div class = "section_space"><!-- section wrap -->
							<!-- 
							<div><!-- title section starts
								<h2 class = "color_dark_blue narrow">완료 목록</h2>
								<span  class = "pl-2 color_grey">딩펫을 통해 가족과 재회하고 행복을 되찾은 반려견들을 만나보세요!</span>
							</div><!-- title section ends
							 -->
							<div class = "pt-3"><!-- list wrap -->
								<c:choose>
									<c:when test ="${empty completedList }">
										<h2 class = "text_center">아직 작성된 글이 없습니다.</h2>
									</c:when>
									<c:otherwise>
										<ul class = "requests flex_row_start_wrap o_hidden">
											<c:forEach items="${completedList}" var="completedList">
											<li class ="requestListItem my-3 div_33">
												<a class = " no_text_deco" href = "completedView?match_id=${completedList.match_id }">
													<div class = "fair_border hover_shadow">
														<div ><!-- img div -->
															<img src = "https://www.dingpet.shop/lost/${completedList.photo_name}" style = "width:400px; height : 250px;">
														</div>
														<div style = "max-width : 400px;"class = "p-3"><!-- 내용 -->
															<p class = "text_overflow"><strong><c:out value="${completedList.match_title }" /></strong></p>
															<p class = "pl-2">${completedList.receiver_nick }님, ${completedList.sender_nick }님</p>
														</div>
													</div>
												</a>
											</li>
										</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div><!-- list wrap ends-->
							
							<div><!-- Pagination starts -->
								<nav class = "pagination_nav"aria-label="Page navigation example">
									<ul class="pagination">
										<c:if test="${completed_pagination.prev }">
											<li class="page-item"><a class="page-link"
												href="#	aria-label= "Previous"> <span aria-hidden="true">&laquo;</span>
													<span class="sr-only">Previous</span>
											</a></li>
										</c:if>
										<c:forEach var="num" begin="${completed_pagination.startPage }" end="${completed_pagination.endPage }">
											<li class="page-item ${completed_pagination.cri.pageNum == num ? "active" : "" }"><a
												class="page-link" href="${num }">${num }</a></li>
										</c:forEach>
										<c:if test="${completed_pagination.next }">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													<span class="sr-only">Next</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div> <!-- pagination ends -->
						</div><!-- section wrap ends -->
					
				</div>
			</div>

		</div>
	</div>
</section>

<form id='actionForm' action="/lostpets/p001/completedList" method='get'>
	<input type="hidden" name="pageNum" value="${completed_pagination.cri.pageNum }">
	<input type="hidden" name="amount" value="${completed_pagination.cri.amount }">
</form>


<script>
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
		actionForm.attr("action", "completedview");
		actionForm.submit();
	});
});
</script>


<!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>
