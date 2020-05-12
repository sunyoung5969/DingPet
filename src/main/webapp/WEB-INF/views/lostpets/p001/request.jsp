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
	
	<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
				
<!--====  str of contents  ====-->
<section style="padding-top:87px">
    <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
                  	<h1 class="mb-2 color_white">확인 요청 목록</h1>
        </div>
    </div>
    
    <div class="container section_space">
		<c:choose>
			<c:when  test = "${empty myList }">
				<h2>확인할 요청이 없습니다.</h2>
			</c:when>
			<c:otherwise>
			
			<c:forEach items = "${myList}" var = "myList">
				<div class = "mb-5">
						<a class ="no_text_deco" target = "_blank" href="/lostpets/p001/view?board_id=${myList.board_id}">
							<div class="shadow_around no_round_border w-90 mx-auto my-2">
								<div class="flex_row p-3 mx-3">
	
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
							</div>
						</a>
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
					<div class="reqeust_div flex_row_start o_hidden">
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
											<button data-board_id="${myList.board_id }" data-request_id="${request.request_id }" class="confirmRequest confirm_left"><strong>완료</strong></button>
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
			</c:forEach>
		</c:otherwise>
		</c:choose>
	</div>
</section>



<script type = "text/javascript" src = "/resources/js/request.js"></script>

<script>

//요청 목록은 확인 요청 모달의 내 게시글 목록과 같은 디자인. 맞아요 아니에요 버튼만 추가 

//아니에요 버튼 >> 요청 목록에서 삭제 ajax로
$(function(){
	$(".detector").click(function(){
		console.log($(event.target).parents(".request_box"));
		var parent_div = $(event.target).parents(".request_box");
		parent_div.hide('slow');
	});
	
	$(".confirmRequest").click(function(){
		var board_id = $(event.target).attr('data-board_id');
		var request_id = $(event.target).attr('data-request_id');
		
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
//맞아요 버튼 >> 완료 처리 : lost_found에서 status y로 변경(y이면 글에 완료됐다는 표시해주기), 완료 테이블에 해당 글 lost_id, find_id, 컬럼으로 두 개의 board_id 매핑 저장, 완료 날짜 저장

//완료 목록은 완료 테이블에 저장된 두 개의 board_id로 각각의 글을 불러와서 간략하게 보여줌

//요청 테이블 : 요청 id, lost_id, find_id, 수신자 id, 발신자 id, 전송날짜, 완료여부, 완료날짜 
</script>

<!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>