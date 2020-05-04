<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d603c9ceea19aeba68479415b917d4"></script>

<%@include file="../../includes/header.jsp"%>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/">
 -->
 
<style>

.walk-container{
	padding-bottom: 5vh;
}

.walk-div{
	padding: 5px;
}

.btn-start{
    padding: 15px 25px;
    border: solid 1px #82c6e6;
    border-radius: 3px;
    color: #82c6e6;
    box-shadow: none;
    margin-right: 5vw;
    background: #fff;
    
}

.btn-end{
    padding: 15px 25px;
    border: solid 1px #e2a5b4;
    border-radius: 3px;
    color: #e2a5b4;
    box-shadow: none;
    margin-left: 5vw;
    background: #fff;
}


.page-title{
    font-size: 28px;
    font-weight: 600;
    padding-top: 10px;
    padding-bottom: 15px;
    width: 67%;
    left: 75px;
    display: inline-block;
    position: relative;
}

.walkform{
    display: inline-block;
    float: right;
}

.walkbtn{
	background: #fff;
    border: solid 1px #30a430 !important;
    color: #30a430 !important;
    box-shadow: none !important;
}

.title-container{
	padding: 25px 0;
}

.profile-pic-title{
	
	margin: 0px;
    padding-top: 10px;
    padding-bottom: 15px;
    font-size: 14px;
    line-height: 1.0909090909;
}

.profile-info-title, .license-info--title{
	display: inline-block;
	margin: 0px;
	padding-bottom: 15px;
	font-size: 14px;
   	line-height: 1.0909090909;
}

.profile-info-title{
	padding-top: 10px;
	
}

.filebox{
	display: inline-block;
	padding: 0px 20px;
}

.filebox label {
	
	display: inline-block;
    cursor: pointer;
    border: 1px solid gray;
    border-radius: .25em;
}

.filebox label:hover {
  background-color: gray;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

.form-group{
	display: inline-block;
	width: 75%;
	padding: 0px 20px;
}
.form-group label h3 {
	font-size: 22px;
   	line-height: 1.0909090909;
   	margin:12px 0;
}

.tit_h3 {
	font-size: 22px;
   	line-height: 1.0909090909;
   	margin:12px 0;
}


.form-control{
	width: 100%;
}

.form-control--title{
	
	width: 100%;
	margin-bottom: 10px;
}

.form-control--detail{
	height: 15vh;
    resize: none;
}

.img-text{
	background-color: gray;
	position: relative;
	width: fit-content;
	top:-140px;
	left: 20%;
}

.imgbtn{
	padding: 4px;
    margin-bottom: 10px;
}









.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

.walkbtn-div{
	padding: 20px;
}

.btnStart {
	padding: 25px 30px;
}

.btnStop {
	padding: 25px 30px;
}


.btn-primary{
	margin: 0px 20px;
}

.btn-secondary{
	margin: 0px 20px;
}











@media screen and (max-width: 770px) {
	
	.main-raised {
	   margin: -10% 3% 7%
	}
	
	.page-title{
		font-size: 4vw !important;
		left: 0px;
    	width: 100%;
	}
	
	.form-group{
		width: 100%;
		padding: 0px
	}
	.walkform{
		text-align: center;
		width: 100%;
	}
	.walkbtn{
		width: 88%;
	}
	
}

@media screen and (max-width: 350.5px) {
	.walkbtn-div{
		padding: 10px;
	}
	.page-title{
		font-size: 5vw !important; 
	}
	
	.btn-start{
	    padding: 10px 20px;
	    border: solid 1px #82c6e6;
	    border-radius: 3px;
	    color: #82c6e6;
	    box-shadow: none;
	    margin-right: 5vw;
	    background: #fff;
	}
	
	.btn-end{
	    padding: 10px 20px;
	    border: solid 1px #e2a5b4;
	    border-radius: 3px;
	    color: #e2a5b4;
	    box-shadow: none;
	    margin-left: 5vw;
	    background: #fff;
	}
	
	.caution{
		font-size: 3vw
	}

}

@media screen and (max-width: 425px) {
}

#btnTest1, #btnTest5{
	display: none;
}


</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
			<div class="profile-content">
				<div class="walk-container">
					<div class="title-container">
						<div class="text-center heading-section">
							<h2 class="page-title">산책 등록 페이지입니당</h2>
						</div>
                    </div>
						<div class="info-part1">
							<div class="info-part1--contents" align="center">
								<div class="walk-div">
									<div class="walkbtn-div">
										<button type="botton" class="btn-start" id="btnStart" type="button">산 책 시 작</button>
										<button type="button" class="btn-end" id="btnStop" type="button">산 책 종 료</button>
										
										<input type="botton" class="btn btn-primary" id="btnTest1" type="button" value="테스트 1" >
										<input type="botton" class="btn btn-primary" id="btnTest5" type="button" value="테스트 2" >
									</div>
									<div id="map" style="width: 100%; height: 350px;"></div>
									<p class="caution">
										<br>
										<em>산책시 웹페이지가 백그라운드에 켜져있어야 합니다.<br>
											종료시 등록을 하지않으면 산책경로가 저장되지 않습니다.
										</em>
									</p>
									<script src="${pageContext.request.contextPath}/resources/js/mapPoint.js?v=7" type="text/javascript"></script>
								</div>
							</div>
						</div>	
					<form action="/petsitting/p003/walklogregister" method="post" enctype="multipart/form-data">
						<input type="hidden" class="start_Time" name="start_Time">
						<input type="hidden" class="end_Time" name="end_Time">
						<input type="hidden" class="locationJSON" name="locationJSON">
						<input type="hidden" class="distance" name="distance">
						<input type="hidden" class="reservation_ID" name="reservation_ID" value="${reservation_ID }">
						<div class="text-center">
							<input class="btn btn-primary" type="submit" value="저 장">
							<input class="btn btn-secondary" type="button" onclick="location.href='sitterlist'" value="취 소">
						</div>
					</form>
				</div>
			</div>
        </div>
      </section>
    <!--====  end of contents  ====--> 
<%@include file="../../includes/footer.jsp"%>