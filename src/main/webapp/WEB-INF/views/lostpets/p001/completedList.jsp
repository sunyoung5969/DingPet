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
    

	<div class="row ">
		<!-- 페이지 정보 div -->
		<div class="col-xs-12 features">

			 <div class = "flex_row mr-5 pr-3">
			 	<a id = "to_request_list"  href="" class="btn_a"><span class="sub_txt">요청 목록 <img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span> </a>

			 	<a id = "lost_write" href="" class="btn_a"><span class="sub_txt">등록하기 <img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span> </a>
			</div>
		</div>
		
			<div class="m_container  o_hidden">
				<div class="">
					<div class="col-xs-12 ">
						
						<div class = "section_space"><!-- section wrap -->
							<div><!-- title section starts-->
								<h2 class = "">완료 목록</h2>
								<span  class = "pl-2">딩펫을 통해 가족과 재회하고 행복을 되찾은 반려견들을 만나보세요!</span>
							</div><!-- title section ends-->
							<div class = "pt-3"><!-- list wrap -->
								<c:choose>
									<c:when test ="${empty completedList }">
										<h2 class = "text_center">아직 작성된 글이 없습니다.</h2>
									</c:when>
									<c:otherwise>
										<ul class = "requests flex_row_start_wrap o_hidden">
											<c:forEach items="${lostList}" var="lostList">
												<li class ="requestListItem my-4 div_33">
													<a class="move" href='<c:out value = "${lostList.board_id}"/>'>
														<div class = "fair_border hover_shadow">
															<div ><!-- img div -->
																<img src = "/resources/images/dog.jpg" style = " height : 250px;">
															</div>
															<div class = "p-3"><!-- 내용 -->
																<p  class="text_overflow"><strong><c:out value="${lostList.title }" /></strong></p>
																<p class = "pl-2"><span class="tag">견종</span><span> </span><c:out value="${lostList.dog_breed}" /></p>
																<p class = "pl-2"><span class="tag">성별</span><span></span> <c:out value="${lostList.dog_sex}" /></p>
																<p class = "pl-2">
																	<span class="tag">발견장소</span><span></span>
																	<c:out value="${lostList.found_location}" />
																</p>
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
										<c:if test="${lost_pagination.prev }">
											<li class="page-item"><a class="page-link"
												href="#	aria-label= "Previous"> <span aria-hidden="true">&laquo;</span>
													<span class="sr-only">Previous</span>
											</a></li>
										</c:if>
										<c:forEach var="num" begin="${lost_pagination.startPage }" end="${lost_pagination.endPage }">
											<li class="page-item ${lost_pagination.cri.pageNum == num ? "active" : "" }"><a
												class="page-link" href="${num }">${num }</a></li>
										</c:forEach>
										<c:if test="${lost_pagination.next }">
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

<form id='actionForm' action="/lostpets/p001/lostList" method='get'>
	<input type="hidden" name="pageNum" value="${lost_pagination.cri.pageNum }">
	<input type="hidden" name="amount" value="${lost_pagination.cri.amount }">
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
		actionForm.attr("action", "view");
		actionForm.submit();
	});
});
</script>


<!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>
