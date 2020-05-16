<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

<style>

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
	margin:30px
}

.card-info{
	padding: 10px;
    text-align: center;
}

.card-title{
	font-size: 13px;
}

.card-btn{
    background: #fff;
    border: solid 1px #85c3f4 !important;
    color: #85c3f4 !important;
    width: 100%;
}

.card-btn:hover{
    background: #85c3f4;
    border: solid 1px #fff !important;
    color: #fff !important;
}

.card-btn:active{
    background: #6b8aa2;
    border: solid 1px #fff !important;
    color: #fff !important;
}

</style>
<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-3" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-2">펫시터 정보</h2>                          
                          <div class="rBtn-warp" >
                            <a href="profileregister" class="rBtn-a">
                                <p class="rBtn">펫시터 등록</p>
                            </a>
                          </div>
                        </div>
                        <div class="row">
	                        <c:forEach items="${ list}" var="sitter" varStatus="status">	   
								<c:set var="count" value="${count+1}" />
								<c:if test="${count%3 == '1'}">
									<c:out value="<tr>" escapeXml="false"></c:out>
								</c:if>
								<div class="sittercard-div">
		                            <div class="card">
	                            		<!-- 사진 -->
	                            		<div class="profile-img-div">
		                                    <img class="card-img-top" src='https://www.dingpet.shop/img/${sitter.profile_PicName }'> <!-- ${sitter.profile_PicPath } -->
		                                </div>
		                                <div class="card-info">
		                                	<!-- 이름 / 한줄 자기소개 내용 -->
		                                	<h5 class="card-name" style="margin-top: 0px">${sitter.member_NickName }</h5>
		                                	<h5 class="card-title" style="margin-top: 0px">${sitter.profile_Content } </h5>
		                                    <!-- 주소 -->
		                                    <p class="card-text">${sitter.list_Address }</p>
		                                    <!-- 버튼 -->
		                                    <form action="profilelookup" method='post'>
			                                    <input type="hidden" name="member_ID" value='${sitter.member_ID }'>
			                                    <input type="submit" class="btn card-btn" value="자세히보기">
		                               		</form>
		                                </div>
		                            </div>
								</div>
								<c:if test="${count%3 == '0'}">
									<c:out value="</tr>" escapeXml="false"></c:out>
									<c:set var="count" value="${count-3}" />
								</c:if>
							</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====--> 

<%@include file="../../includes/footer.jsp"%>
