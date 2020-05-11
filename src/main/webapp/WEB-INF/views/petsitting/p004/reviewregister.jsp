<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../includes/header.jsp"%>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/">
 -->
 
<style>

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

.info-part1{

	padding: 20px;
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



h2 {font-size:15px;}
.star-rating {width:150px; }
.star-rating,.star-rating span {
display:inline-block; height:26px; overflow:hidden; 
background:url(${pageContext.request.contextPath}/resources/images/bigstar.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }
.star-review {width:80px; }
.star-review,.star-review span {
display:inline-block; height:14px; overflow:hidden; 
background:url(${pageContext.request.contextPath}/resources/images/ministar.png)no-repeat; }
.star-review span{background-position:left bottom; line-height:0; vertical-align:top; }

      /*star start*/
	.rate {
	  float: left;
	  height: 46px;
	  padding: 0 10px;
	}
	.rate:not(:checked) > input {
	  position:absolute;
	  top:-9999px;
	}
	.rate:not(:checked) > label {
	  float:right;
	  width:1em;
	  overflow:hidden;
	  white-space:nowrap;
	  cursor:pointer;
	  font-size:30px;
	  color:#ccc;
	}
	.rate:not(:checked) > label:before {
	  content: '★ ';
	}
	.rate > input:checked ~ label {
	  color: #ffc700;    
	}
	.rate:not(:checked) > label:hover,
	.rate:not(:checked) > label:hover ~ label {
	  color: #deb217;  
	}
	.rate > input:checked + label:hover,
	.rate > input:checked + label:hover ~ label,
	.rate > input:checked ~ label:hover,
	.rate > input:checked ~ label:hover ~ label,
	.rate > label:hover ~ input:checked ~ label {
	  color: #c59b08;
	}
	/*star end*/
	.pagination{display:flex;padding-left:0;list-style:none;border-radius:.35rem}
	.page-link{position:relative;display:block;padding:.5rem .75rem;
	margin-left:-1px;line-height:1.25;color:#4e73df;
	background-color:#fff;border:1px solid #dddfeb}
	.page-link:hover{z-index:2;color:#224abe;
	text-decoration:none;background-color:#eaecf4;
	border-color:#dddfeb}
	.page-link:focus{z-index:2;outline:0;box-shadow:0 0 0 .2rem rgba(78,115,223,.25)}
	.page-item:first-child .page-link{margin-left:0;border-top-left-radius:.35rem;border-bottom-left-radius:.35rem}
	.page-item:last-child .page-link{border-top-right-radius:.35rem;border-bottom-right-radius:.35rem}
	.page-item.active .page-link{z-index:1;color:#fff;background-color:#4e73df;border-color:#4e73df}
	.page-item.disabled .page-link{color:#858796;pointer-events:none;cursor:auto;background-color:#fff;border-color:#dddfeb}
	.pagination-lg .page-link{padding:.75rem 1.5rem;font-size:1.25rem;line-height:1.5}
	.pagination-lg .page-item:first-child .page-link{border-top-left-radius:.3rem;border-bottom-left-radius:.3rem}
	.pagination-lg .page-item:last-child .page-link{border-top-right-radius:.3rem;border-bottom-right-radius:.3rem}
	.pagination-sm .page-link{padding:.25rem .5rem;font-size:.875rem;line-height:1.5}
	.pagination-sm .page-item:first-child .page-link{border-top-left-radius:.2rem;border-bottom-left-radius:.2rem}
	.pagination-sm .page-item:last-child .page-link{border-top-right-radius:.2rem;border-bottom-right-radius:.2rem}
	.badge{display:inline-block;padding:.25em .4em;font-size:75%;font-weight:700;line-height:1;text-align:center;
	white-space:nowrap;vertical-align:baseline;border-radius:.35rem;}
	.error:before{content:attr(data-text);position:absolute;left:-2px;
	text-shadow:1px 0 #4e73df;top:0;color:#5a5c69;
	background:#f8f9fc;overflow:hidden;clip:rect(0,900px,0,0);
	animation:noise-anim-2 3s infinite linear alternate-reverse}
	footer.sticky-footer{padding:2rem 0;flex-shrink:0}
	footer.sticky-footer 
	.copyright{line-height:1;font-size:.8rem}
	body.sidebar-toggled footer.sticky-footer{width:100%}




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

@media screen and (max-width: 425px) {
	
	.page-title{
		font-size: 5vw !important; 
	}

}




</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
			<div class="profile-content">
				<div class="container pb-5">
						<div class="title-container">
							<div class="text-center heading-section">
								<h2 class="page-title">리뷰 등록 페이지입니당</h2>
							</div>
	                    </div>
					<form action="/petsitting/p004/reviewregisterconfirm" method="post">
	                   	
						<div class="info-part1">

							<div class="info-part1--contents" align="center">
								
								<div class="form-group">

									<div id="wpjmr-submit-ratings">
	                                	<h2 class="widget-title widget-title__job_listing ion-ios-compose-outline">리뷰 평점</h2>
	                                    <div class="listing-rating listing-rating--single">
	                                        <div class="rate" id="rate" >
	                                        <input type="radio" id="star5" name="review_Star" value="5"  checked="checked"/>
	                                        <label for="star5" title="5점">5 stars</label>
	                                        <input type="radio" id="star4" name="review_Star" value="4" />
	                                        <label for="star4" title="4점">4 stars</label>
	                                        <input type="radio" id="star3" name="review_Star" value="3" />
	                                        <label for="star3" title="3점">3 stars</label>
	                                        <input type="radio" id="star2" name="review_Star" value="2" />
	                                        <label for="star2" title="2점">2 stars</label>
	                                        <input type="radio" id="star1" name="review_Star" value="1" />
	                                        <label for="star1" title="1점">1 star</label>
	                                        </div>
	                                    </div><!-- .star-ratings.ratings -->
	                                </div><!-- #wpjmr-submit-ratings -->
									<input type="hidden" name="reservation_ID" value="${reservation_ID }">
									
									<div class="profile-info-titleDiv" align="left">
										<h5 class="profile-info-title">리뷰 내용</h5>
									</div>
									<textarea class="form-control--detail" rows="8" name="review_Content" required></textarea>
								</div>
								
							
							</div>
						</div>						
						<div class="text-center">							
							<input class="btn btn-primary" type="submit" value="등록">
							<input class="btn btn-secondary" type="button" onclick="location.href='sitterlist'" value="취소">
						</div>
					</form>
				</div>
			</div>
        </div>
      </section>
    <!--====  end of contents  ====--> 
<%@include file="../../includes/footer.jsp"%>