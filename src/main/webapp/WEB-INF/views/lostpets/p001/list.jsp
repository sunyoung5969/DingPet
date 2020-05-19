<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

	<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/carousel.css">
    <!--탭 메뉴 -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<!--====  str of contents  ====-->
<section style="padding-top:87px" class = "nanumbarungothic">
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/al.jpg'); height : 400px;transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto color_white">
             <h1 style="font-family:GmarketSansBold;">실종견 찾기</h1>
             <p style="font-size:1.1em;">잃어버린 반려견을 찾는 주인과 주인을 잃어버린 반려견을 이어드립니다.</p>
        </div>
    </div>

	<div class="row ">
	<!-- 페이지 정보 div -->
		<div class="m_container  o_hidden black">
				<div class="col-xs-12 ">
					<div class = "section_space"><!-- section wrap -->
						<div class ="flex_row_between"><!-- 설명 section wrap -->
							<a href = "/lostpets/p001/completedList">
								<div class = "d-inline-block"><!-- 타이틀, span -->
									<h1 class="d-inline-block color_dark_blue narrow" style="font-family:GmarketSansBold;">찾았어요</h1>
									<span class ="pl-2 color_grey"><small><img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr">&nbsp;바로 가기</small></span>
									<p  class = "pl-2 color_grey">딩펫을 통해 가족과 재회하고 행복을 되찾은 반려견들을 만나보세요!</p>
								</div>
							</a>
						</div><!-- 설명 section wrap ends-->
						<div class ="list_wrap"><!-- list wrap -->
							<c:choose>
								<c:when test ="${empty recentCompleted }">
									<h2 class = "text_center">아직 작성된 글이 없습니다.</h2>
								</c:when>
								<c:otherwise>
									<ul class = "requests flex_row_start o_hidden w-90 mx-auto">
										<c:forEach items="${recentCompleted}" var="recentCompleted">
											<li class ="requestListItem my-3 div_33">
												<a class = " no_text_deco" href = "/lostpets/p001/completedView?match_id=${recentCompleted.match_id }">
													<div class = "fair_border hover_shadow">
														<div ><!-- img div -->
															<img src = "https://www.dingpet.shop/lost/${recentCompleted.photo_name}" style = "width:400px; height : 250px;">
														</div>
														<div style = "max-width : 400px;"class = "p-3"><!-- 내용 -->
															<p class = "text_overflow"><strong><c:out value="${recentCompleted.match_title }" /></strong></p>
															<p class = "pl-2">${recentCompleted.receiver_nick }님, ${recentCompleted.sender_nick }님</p>
														</div>
													</div>
												</a>
											</li>
										</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>
							<div class="list_nav">
								<i class="fas fa-chevron-left  arrow_prev "></i>
								<i class="fas fa-chevron-right  arrow_next"></i>
							</div>
						</div>
					</div>
					
					<div class = "section_space_bottom"><!-- section wrap -->
						<div class ="flex_row_between"><!-- 설명 section wrap -->
							<a href = "/lostpets/p001/lostList">
								<div class = "d-inline-block"><!-- 타이틀, span -->
									<h1 class="d-inline-block color_dark_blue narrow" style="font-family:GmarketSansBold;">주인 찾기</h1>
									<span class ="pl-2 color_grey"><small><img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr">&nbsp;바로 가기</small></span>
									<p  class = "pl-2 color_grey">유기견을 임시보호 하고 계신가요? 딩펫에서 쉽고 빠르게 주인을 찾아보세요!</p>
								</div>
							</a>
							<div class = "d-inline-block pr-5">
								<button class="blueBtn mapBtn mr-3">지도로 보기</button>
								<button class="blueBtn write">등록하기</button>
							</div>
						</div><!-- 설명 section wrap ends-->
						<div class="list_wrap"><!-- list wrap -->
							<c:choose>
								<c:when test ="${empty recentLost }">
									<h2 class = "text_center">아직 작성된 글이 없습니다.</h2>
								</c:when>
								<c:otherwise>
									<ul class = "requests flex_row_start o_hidden w-90 mx-auto">
										<c:forEach items="${recentLost}" var="recentLost">
											<li class ="requestListItem my-3 div_33">
												<a class = "no_text_deco" href = "/lostpets/p001/view?board_id=${recentLost.board_id}">
													<div class = "fair_border hover_shadow">
														<div ><!-- img div -->
															<img src = "https://www.dingpet.shop/lost/${recentLost.front_name}" style = "width:400px; height : 250px;">
														</div>
														<div style = "width : 400px;" class = "p-3"><!-- 내용 -->
															<p class = "text_overflow"><strong><c:out value="${recentLost.title }" /></strong></p>
																<p class = "pl-2"><span class="tag">견종</span><span> </span><c:out value="${recentLost.dog_breed}" /></p>
																<p class = "pl-2"><span class="tag">성별</span><span></span> <c:out value="${recentLost.dog_sex}" /></p>
																<p class = "pl-2">
																	<span class="tag">발견 장소</span><span></span>
																	<c:out value="${recentLost.found_location}" />
																</p>
														</div>
													</div>
												</a>
											</li>
										</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>
							<div class="list_nav">
								<i class="fas fa-chevron-left  arrow_prev "></i>
								<i class="fas fa-chevron-right  arrow_next"></i>
							</div>	
						</div>
					</div>
					
					<div class = "section_space_bottom"><!-- section wrap -->
						<div class ="flex_row_between"><!-- 설명 section wrap -->
							<a href = "/lostpets/p001/findList">
								<div class = "d-inline-block"><!-- 타이틀, span -->
									<h1 class="d-inline-block color_dark_blue narrow" style="font-family:GmarketSansBold;">반려견 찾기</h1>
									<span class ="pl-2 color_grey"><small><img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr">&nbsp;바로 가기</small></span>
									<p  class = "pl-2 color_grey">잃어버린 반려견을 찾고 계신가요? 딩펫이 도와드릴게요!</p>
								</div>
							</a>
							<div class = "d-inline-block pr-5">
								<button class="blueBtn mapBtn mr-3">지도로 보기</button>
								<button class="blueBtn write">등록하기</button>
							</div>
						</div><!-- 설명 section wrap ends-->
						<div class="list_wrap"><!-- list wrap -->
							<c:choose>
								<c:when test ="${empty recentFind }">
									<h2 class = "text_center">아직 작성된 글이 없습니다.</h2>
								</c:when>
								<c:otherwise>
									<ul class = "requests flex_row_start o_hidden w-90 mx-auto">
										<c:forEach items="${recentFind}" var="recentFind">
											<li class ="requestListItem my-3 div_33">
												<a class = "no_text_deco" href = "/lostpets/p001/view?board_id=${recentFind.board_id}">
													<div class = "fair_border hover_shadow">
														<div ><!-- img div -->
															<img src = "https://www.dingpet.shop/lost/${recentFind.front_name}" style = "width:400px; height : 250px;">
														</div>
														<div style = "width : 400px;" class = "p-3"><!-- 내용 -->
															<p class = "text_overflow"><strong><c:out value="${recentFind.title }" /></strong></p>
																<p class = "pl-2"><span class="tag">견종</span><span> </span><c:out value="${recentFind.dog_breed}" /></p>
																<p class = "pl-2"><span class="tag">성별</span><span></span> <c:out value="${recentFind.dog_sex}" /></p>
																<p class = "pl-2">
																	<span class="tag">실종 장소</span><span></span>
																	<c:out value="${recentFind.found_location}" />
																</p>
														</div>
													</div>
												</a>
											</li>
										</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>
							<div class="list_nav">
								<i class="fas fa-chevron-left  arrow_prev "></i>
								<i class="fas fa-chevron-right  arrow_next"></i>
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
<script type = "text/javascript" src = "/resources/js/carousel.js"></script>
<%@include file="../p002/map.jsp"%>
<%@include file="../../includes/footer.jsp"%>
