<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<style>
h2 {font-size:15px;}
.star-rating {width:304px; }
.star-rating,.star-rating span {
display:inline-block; height:55px; overflow:hidden; 
background:url(${pageContext.request.contextPath}/resources/images/star2.png)no-repeat; }
.star-rating span{background-position:left bottom; line-height:0; vertical-align:top; }

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
</style>
</head>
<body>
  <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-5" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-2">시설 상세 정보</h2>
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="col-lg-4 col-md-6 align-self-center">
                            <div class="image-block bg-about">
                            		<c:set var="imgsite" value="${url}${info.place_picname }" />
                            	<img class="img-fluid" src="${info.place_pic != null?imgsite:'/resources/images/dogger_img_sm_15.jpg' }" alt="">
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-6 align-self-center">
                            <div class="content-single-job_listing-hero-wrapper cover-wrapper container">
                                <div class="content-single-job_listing-hero-inner row">
                                    <div class="content-single-job_listing-hero-company col-md-7 col-sm-12">
                                        <h2 style="font-weight: 600;font-size: 35px;margin: 10px;font-size: x-large;line-height: 1;">${info.place_name }</h2>
                                        
                                        	<div class="wrap-star">
										   		<div class='star-rating'>
							    		   		<span style ="width:80%"></span>
							    				</div>        
							    			<span style="position: right; margin: 0px;">4/5</span>	
                                             </div>
                                             
                                         <br><br>
                                         <div>                                         
                                            <span class="listing-rating-count listing-rating-count--single">
                                            <a href="#respond">0개의 리뷰</a>	</span>
                                        </div>
                                        <div class="job_listing-location job_listing-location-none">${info.address_name }</div>
                                        <div class="job_listing-location job_listing-location-none">${info.phone }</div>
                                    </div>
                                    
                                    <div class="content-single-job_listing-hero-actions col-md-5 col-sm-12">
                                        <a href="#respond" class="btn btn-primary btn-sm">리뷰 작성</a>
                                    </div>
                                </div>
                            </div>
                            <aside id="listify_widget_panel_listing_business_hours-2" class="widget widget-job_listing listify_widget_panel_listing_business_hours"><h2 class="widget-title widget-title-job_listing ion-clock">영업 시간 <span class="business-hour-status business-hour-status-open" title="Timezone: Asia/Seoul (UTC+9)">Now Open</span></h2>
                                <p class="business-hour">
                                    <span class="day">월요일~금요일</span>
                                    <span class="business-hour-time">
                                        <span class="start">11:30 am</span> – <span class="end">9:00 pm</span>
                                    </span>
                                </p><!-- .business-hour -->
                                <p class="business-hour">
                                    <span class="day">주말 & 공휴일</span>
                                    <span class="business-hour-time">
                                        <span class="start">11:30 am</span> – <span class="end">9:00 pm</span>
                                    </span>
                                </p><!-- .business-hour -->
                            </aside>
                        </div>
                    </div>
                    <section  class="txt-box ">
                        <p>${info.place_text }</p>
                    </section>
                    <!--=============================
                    =            Gallery            =
                    ==============================-->

                    <section class="pb-xl-5 pt-5" id="gallery-section">
                        <div class="container-fluid">
                          <div class="row justify-content-center">
                            <div class="col-lg-6 text-center heading-section mb-5">
                              <h2 class="text-black mb-2">Photo Gallery</h2>
                            </div>
                          </div>
                          <div class="row no-gutters">
                            
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_3.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_3.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_4.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_4.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_5.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_5.jpg" alt="Image" class="img-fluid"></a>                            
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_6.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_6.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
                          </div>
                        </div>
                      </section>

                    <!--====  End of Gallery  ====-->
                    <aside id="listify_widget_panel_listing_comments-1" class="widget widget-job_listing listify_widget_panel_listing_comments pb-5">
                        <h2 id="respond" class="widget-title widget-title__job_listing ion-ios-compose-outline">리뷰</h2>
                        <ol id="comments" class="commentlist">
		                    <li class="comment byuser comment-author-be-my-pet-official even thread-even depth-1" id="comment-8">
                                <article id="comment-8" class="comment row">
                                    <header class="comment-author col-md-2 col-sm-3 col-12">
                                        <img src="/resources/images/dogger_img_sm_15.jpg" width="100" height="100" alt="리뷰" class="avatar avatar-100 wp-user-avatar wp-user-avatar-100 alignnone photo">		
                                    </header><!-- .comment-meta -->
                                    <section class="comment-content comment col-md-10 col-sm-9 col-12">
                                        <p class="vcard author">
                                            <b class="fn">리뷰를 써용요오오오오오오오오오오오옹</b>
                                        </p>
                                        
                                    </section><!-- .comment-content -->
                                </article><!-- #comment-## -->
                            </li><!-- #comment-## -->
                         </ol>
                        <div class="comment-respond">
                            <h3 id="reply-title" class="comment-reply-title"></h3>
                           <!--  <small><a rel="nofollow" id="cancel-comment-reply-link" href="/map/listing/%ec%88%98%ec%9b%90%ec%8b%9c-%ec%98%81%ed%86%b5%ea%b5%ac-%eb%b2%95%ec%a1%b0%eb%a1%9c149%eb%b2%88%ea%b8%b8-47-1%ec%b8%b5-94-149%ed%94%8c%eb%9d%bc%eb%b0%8d%ea%b3%a0/#respond" style="display:none;">댓글 취소</a></small></h3> -->
                            <form role="form" action="/facilitymap/p001/revregister" method="post" enctype="multipart/form-data">
                            <input type="hidden" class="form-control" name="site_id" value="${info.site_id }">
                                <div id="wpjmr-submit-ratings">
                                	<h2 class="widget-title widget-title__job_listing ion-ios-compose-outline">별점주기</h2>
                                    <div class="listing-rating listing-rating--single">
                                        <div class="rate" id="rate" >
                                        <input type="radio" id="star5" name="review_star" value="5" />
                                        <label for="star5" title="text">5 stars</label>
                                        <input type="radio" id="star4" name="review_star" value="4" />
                                        <label for="star4" title="text">4 stars</label>
                                        <input type="radio" id="star3" name="review_star" value="3" />
                                        <label for="star3" title="text">3 stars</label>
                                        <input type="radio" id="star2" name="review_star" value="2" />
                                        <label for="star2" title="text">2 stars</label>
                                        <input type="radio" id="star1" name="review_star" value="1" />
                                        <label for="star1" title="text">1 star</label>
                                        </div>
                                    </div><!-- .star-ratings.ratings -->
                                </div><!-- #wpjmr-submit-ratings -->
                            
                                <div id="wpjmr-submit-gallery" class="review-form-gallery">
                                	<h2 id="respond" class="widget-title widget-title__job_listing ion-ios-compose-outline pt-5">갤러리 사진 업로드</h2>
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <input type="file" name="reviewpic" id="reviewpic" onchange="previewImage(this,'View_area')">
                                            <div id='View_area' class="img_up"></div>
                                        </div>
                                    </div>
                                </div><!-- #wpjmr-submit-gallery -->
                                                    
                                <!-- wsl_render_auth_widget -->
                                <h2 id="respond" class="widget-title widget-title__job_listing ion-ios-compose-outline pt-5">리뷰 작성</h2>
                                
                                <p class="comment-form-comment pt-3">
                                    <label for="comment">리뷰</label> 
                                    <textarea id="review_content" name="review_content" cols="45" rows="8"  class="form-control" maxlength="65525" required="required"></textarea>
                                </p>
                                <p class="comment-form-author">
                                    <label for="author">이름 <span class="required">*</span></label> 
                                    <input id="review_name" name="review_name" type="text"  class="form-control" value="" size="30" maxlength="245" required="required">
                                </p>
                                <p class="comment-form-email">
                                    <label for="email">이메일 <span class="required">*</span></label> 
                                    <input id="review_email" name="review_email" type="email"  class="form-control" value="" size="30" maxlength="100" required="required">
                                </p>
                                <p class="form-submit float-right">
                                    <input name="submit" type="submit" id="submit" class="btn btn-primary btn-sm" value="리뷰등록"> 
                                    
                                </p>
                            </form>	
                        </div><!-- #respond -->
                     </aside>
                </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====-->  
    
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>