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
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/lost.jpg'); height : 400px;transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
             <h1 class=" color_white" style="font-family:GmarketSansBold;">반려견 찾기</h1>
             <span  class = "pl-2 d-inline-block  color_white "style="font-size:1.1em;">잃어버린 반려견을 찾고 계신가요? 딩펫이 도와드릴게요!</span>
        </div>
    </div>
    

	<div class="row ">
		<!-- 페이지 정보 div -->
		
			<div class="m_container  o_hidden">
				<div class="">
					<div class="col-xs-12 ">
						
						<div class = "section_space"><!-- section wrap -->
							<div class ="flex_row_between"><!-- 설명 section wrap -->
								<div class = "d-inline-block"><!-- 타이틀, span -->
									<h1 class="color_dark_blue narrow" style="font-family:GmarketSansBold;">반려견 찾기</h1>
									<span  class = "pl-2 d-inline-block color_grey">잃어버린 반려견을 찾고 계신가요? 딩펫이 도와드릴게요!</span>
								</div>
								<div class = "d-inline-block pr-5">
									<button class="blueBtn mapBtn mr-3">지도로 보기</button>
									<button class="blueBtn write">등록하기</button>
								</div>
							</div><!-- 설명 section wrap ends-->
							<div class = "pt-3"><!-- list wrap -->
								<ul class = "requests flex_row_start_wrap o_hidden">
									<c:forEach items="${findList}" var="findList"> 
										<li class ="requestListItem my-4 div_33">
											<a class="move" href='<c:out value = "${findList.board_id}"/>'>
												<div class = "fair_border hover_shadow">
													<div ><!-- img div -->
														<img src = "https://www.dingpet.shop/lost/${findList.front_name}" style = "width : 400px; height : 250px;">
													</div>
													<div style = "width : 400px;" class = "p-3"><!-- 내용 -->
														<p  style = "width : 100%;" class="text_overflow"><strong><c:out value="${findList.title }" /></strong></p>
														<p class = "pl-2"><span class="tag">견종</span><span> </span><c:out value="${findList.dog_breed}" /></p>
														<p class = "pl-2"><span class="tag">성별</span><span></span> <c:out value="${findList.dog_sex}" /></p>
														<p class = "pl-2">
															<span class="tag">실종 장소</span><span></span>
															<c:out value="${findList.found_location}" />
														</p>
													</div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<div><!-- Pagination starts -->
								<nav class = "pagination_nav"aria-label="Page navigation example">
									<ul class="pagination">
										<c:if test="${find_pagination.prev }">
											<li class="page-item"><a class="page-link" href="#	aria-label= "Previous"> <span aria-hidden="true">&laquo;</span>
													<span class="sr-only">Previous</span> </a>
											</li>
										</c:if>
										<c:forEach var="num" begin="${find_pagination.startPage }" end="${find_pagination.endPage }">
											<li class="page-item ${find_pagination.cri.pageNum == num ? "active" : "" }"><a class="page-link" href="${num }">${num }</a> </li>
										</c:forEach>
										<c:if test="${find_pagination.next }">
											<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													<span class="sr-only">Next</span> </a>
											</li>
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

<form id='actionForm' action="/lostpets/p001/findList" method='get'>
	<input type="hidden" name="pageNum" value="${find_pagination.cri.pageNum }">
	<input type="hidden" name="amount" value="${find_pagination.cri.amount }">
</form>

<script type="text/javascript">
	var loggedInId = '${customers.member_id}';	

	$(document).ready(function(){
		if(!loggedInId){
			$(".write").on("click", function(){
				alert("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동합니다.");
				location.href = "/customers/p001/signin";
			});
		}else{
			$(".write").on("click", function(){
				location.href = "/lostpets/p001/write";
				(this).setAttribute("href", "/lostpets/p001/write");
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
<%@include file="../p002/map.jsp"%>
<%@include file="../../includes/footer.jsp"%>
