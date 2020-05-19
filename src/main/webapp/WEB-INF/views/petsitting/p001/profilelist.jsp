<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="../../includes/header.jsp"%>

<style>
.listrow{
	
}

.listdiv{
	display: flex;
	width:100%;
	padding-left: 15px;
}
.profile-img-div{
	max-height: 300px;
	overflow: hidden;
}

.profile-img-div img{
	max-height: initial;
}

.rBtn-warp{
	padding-right: 20px;
}

.sittercard-div{
	width: 27%;
	margin:30px;
	display: inline-block;
}

.outercarddiv{
	height: 0px;
}

.card-img{
	width: 100%;
	min-height: 300px;
}

.card-info{
	padding: 95px 10px;
    text-align: center;
    display: none;
    
    background: rgba(57, 57, 57, 0.7);
    color: rgb(238, 238, 238);
    position: relative;
    top: -301px;
    height: 300px;
}

.card-title{
	font-size: 13px;
}

.card-btn{
    background: #fff;
    border: solid 1px #85c3f4 !important;
    color: #85c3f4 !important;
    width: 100%;
    box-shadow: none !important;
    transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out,
    			border-color 0.35s ease-in-out, box-shadow 0.35s ease-in-out,
    			-webkit-box-shadow 0.35s ease-in-out;
}

.card-btn:hover{
    background: #85c3f4;
    border: solid 1px #85c3f4 !important;
    color: #fff !important;
}

.card-btn:active{
    background: #6b8aa2;
    border: solid 1px #6b8aa2 !important;
    color: #fff !important;
}

.wrap-star{
	display: inline-block;
}
.star-rating {
    text-align: left;
	width:150px;
}
.star-rating,.star-rating span {
	display:inline-block; 
	height:26px; 
	overflow:hidden; 
	background:url(/resources/images/bigstar.png)no-repeat; 
}
.star-rating span{
	background-position:left bottom; 
	line-height:0;
	vertical-align:top; 
}

.main-raised{
	margin: 1% 15% 7% !important;
}

</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">
<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        
	<div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/sitter.jpg'); height : 400px;transform: translate3d(0px, 0px, 0px);">
    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
             <h1 class=" color_white" style="font-family:GmarketSansBold; font-size:2.5rem !important">펫시터 목록</h1>
             <span  class = "pl-2 d-inline-block  color_white "style="font-size:18px;">검증된 펫시터에게 소중한 반려견을 맡겨보세요</span>
        </div>
    </div>
        
        
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-3" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <div class="rBtn-warp" ></div>
                        </div>
                        <div class="listrow section_space">
	                        <c:forEach items="${ list}" var="sitter" varStatus="status">	   
								<c:set var="count" value="${count+1}" />
								<c:if test="${status.index%3 == '0'}">
									<c:out value="<div class='listdiv'>" escapeXml="false"></c:out>
								</c:if>
								<div class="sittercard-div">
		                            <div class="card card_${status.index}">
	                            		<!-- 사진 -->
	                            		<div class="profile-img-div">
		                                    <img class="card-img" src='https://www.dingpet.shop/img/${sitter.profile_PicName }'> <!-- ${sitter.profile_PicPath } -->
		                                </div>
		                                <div class="outercarddiv">
			                                <div class="card-info card-info_${status.index}">
			                                	<!-- 이름 / 한줄 자기소개 내용 -->
			                                	<h5 class="card-name" style="margin-top: 0px">${sitter.member_NickName }</h5>
			                                	<h5 class="card-title" style="margin-top: 0px">${sitter.profile_Title } </h5>
			                                    <!-- 주소 -->
			                                    <p class="card-text">${sitter.list_Address }</p>
			                                    <!-- 버튼 -->
			                                    <div class="wrap-star">
											   		<div class='star-rating'>
												   		<c:set var="starper" value="${sitter.profile_Star*20}%" />
									    		   		<span style ="width:${sitter.profile_Star*20}%"></span>
								    				</div>        
								    				<span style="position: right; margin: 0px;">${sitter.profile_Star}/5.0</span>	
												</div>
			                                </div>
		                                </div>
		                                <form action="profilelookup" method='post'>
		                                    <input type="hidden" name="member_ID" value='${sitter.member_ID }'>
		                                    <input type="hidden" name="profile_ID" value="${sitter.profile_ID }">
		                                    <input type="submit" class="card-btn" value="프로필 보기">
	                               		</form>
		                            </div>
								</div>
								<c:if test="${status.index%3 == '2'}">
									<c:out value="</div>" escapeXml="false"></c:out>
									<c:set var="count" value="${count-3}" />
								</c:if>
							</c:forEach>
							<input type="hidden" class="card-count" value="${fn:length(list)}">
							
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====--> 
	<script>
		var str="";
		
		if($(".privilege_ID").val() == '01'){
			str += '<a href="profileregister" class="rBtn-a">';
	        str += '<p class="rBtn">펫시터 등록</p></a>';
	        $(".rBtn-warp").append(str);
		}
	
		for(var i = 0; i < $(".card-count").val(); i++){
			(function(c) {
				$(".card_"+c).on('mouseover', function(){
					$(".card-info_"+c).css('display', 'block');
				});
				$(".card_"+c).on('mouseout', function(){
					$(".card-info_"+c).css('display', 'none');
				});
	        })(i);
		}
	</script>
<%@include file="../../includes/footer.jsp"%>
