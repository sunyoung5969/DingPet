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
                    <!-- 댓글 시작 -->    
                        <h2 id="respond" class="widget-title widget-title__job_listing ion-ios-compose-outline">리뷰</h2>
                        <!-- 댓글 목록 표시 -->
                        <ul id="comments" class="commentlist">
		                    <li class = "mb-2" data-reply_id ='6'>		                    
                                <div>
                                	<div class = "">
                                		<strong>댓글 작성자</strong>
                                		<small>댓글 작성일시</small>
                                	</div>
                                    <div class="comment-content comment col-md-10 col-sm-9 col-12 width100">
                                        <p class = "fn">댓글 내용</p>
                                    </div><!-- .comment-content -->
                                </div><!-- #comment-## -->
                            </li><!-- #comment-## -->
                         </ul><!-- 댓글 목록 표시 끝-->
                         <div class='panel-footer'></div>
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
console.log(${info.site_date});
console.log(${info.place_name});
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 댓글 ajax 처리 -->
<script type = "text/javascript" src = "/resources/js/facilityMapReply.js?v=2"></script>
<script type = "text/javascript">
	//날짜 포맷 변경
	var boardDate = "202004231617";
	var dateString = boardDate.toString();
	$("#board_date").html("<small>" + replyService.formatDate(dateString) + "</small>");
		
	//댓글 목록 표시
	var site_idValue = '<c:out value = "${info.site_id}"/>';
	var replyUL = $("#comments");
				
	showList(1);
						
	function showList(pageNum){
			replyService.getList({site_id : site_idValue, pageNum : pageNum || 1},
			function(replyCnt, list){
				var str = "";

		        console.log("replyCnt: "+ replyCnt );
		        console.log("list: " + list);
		        if(pageNum == -1){
		          pageNume = Math.ceil(replyCnt/10.0);
		          showList(pageNume);
		          return;
		        }
				if(list == null || list.length == 0){
					replyUL.html("아직 작성된 댓글이 없습니다.");
					return;
					}
				for(var i = 0, length = list.length || 0; i < length; i++){
					str += "<li class = 'mb-2' data-reply_id ='" + list[i].review_id + "'>";
					str += "<div><div class = 'reply_info'><span><strong>" + list[i].review_name +"</strong>님</span>";
					str += "<span><small>" + replyService.formatDate(list[i].review_date) + "</small></span>";
					str += "<button class = 'small_btn btn btn-primary float-right' id = 'reply_modify'>수정</button><button class = 'small_btn btn btn-primary float-right' id = 'reply_delete'>삭제</button></div>";
					str += "<div class='comment-content comment reply_info'>";
					str += "<p id = 'original_content' class = 'fn ml-3 mr-3'>" + list[i].review_content + "</p>";
					str += "<div class = 'flex_row toggle_div pb-2' style = 'display : none'><div class = 'w-90'><textarea cols='45' rows='4'  class='form-control' maxlength='65525' required></textarea></div>";
					str += "<div class = 'flex_column w-10'><button id = 'modified_submit' class = 'small_btn btn btn-primary'>등록</button><button id = 'modified_cancel' class = 'small_btn btn btn-primary'>취소</button>";
					str += "</div></div></div></div></li>";
					}
					replyUL.html(str);
					showReplyPage(replyCnt);
			}); //list End
		}; // showList End
		
		 var pageNum = 1;
		 var replyPageFooter = $(".panel-footer");
		    
		 function showReplyPage(replyCnt){
		      
		   var endNum = Math.ceil(pageNum / 10.0) * 10;  
		   var startNum = endNum - 9; 
		      
		   var prev = startNum != 1;
		   var next = false;
		      
		   if(endNum * 10 >= replyCnt){
		      endNum = Math.ceil(replyCnt/10.0);
		    }
		      
		   if(endNum * 10 < replyCnt){
		     next = true;
		    }
		      
		   var str = "<ul class='pagination pull-right'>";		      
		   if(prev){
		     str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		    } 
		   for(var i = startNum ; i <= endNum; i++){
			   var active = pageNum == i? "active":"";
		       str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		    }
		   if(next){
		        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		    }		      
		   str += "</ul></div>";
		   console.log(str);
		   replyPageFooter.html(str);
		   }
		     
		 replyPageFooter.on("click","li a", function(e){
		     e.preventDefault();
		     console.log("page click");
		     var targetPageNum = $(this).attr("href");		        
		     console.log("targetPageNum: " + targetPageNum);		        
		     pageNum = targetPageNum;		        
		     showList(pageNum);
		   });     				
					
		//댓글 쓰기
		$("#reply_submit").on("click", function(e){
        	var reply = {
        			reply : $("#comment").val(),
        			replyer : $("#replyer").val(),
        			site_id : site_idValue
        			};
        	
            replyService.write(reply, function(result){
            	alert(result);
            	$("#comment").val("");
				$("#replyer").val("");
				showList(1);
				});
            });
			
		$("#comments").on("click", "li", function(e){
			var review_idValue = $(this).data("review_id");
			console.log(review_idValue);
			//댓글 삭제
			if($(e.target).attr('id') === $("#reply_delete").attr('id')){
				if(confirm("정말로 삭제하시겠어요?")){
					replyService.remove(review_idValue, function(result){
						alert('댓글이 삭제되었습니다.');
						showList(1);
						})
						}else{
							console.log("선택되지 않음");
						}
				} // if end
							
		//댓글 수정
		var toggle_div = $(this).find(".toggle_div");
		var textarea = $(this).find('textarea');
		var modified_content = $(this).find('textarea').val();
		if($(e.target).attr('id') === $("#reply_modify").attr('id')){
			toggle_div.slideToggle("slow", "swing");
			}
							
		//댓글 수정 중 등록 버튼 클릭시
		if($(e.target).attr('id') == 'modified_submit'){
			var reply = {
					review_id : review_idValue,
					site_id : site_idValue,
					reply : modified_content
					}
			console.log("reply.reply : " + reply.reply);
			console.log("reply.reply type : " + typeof(reply.reply));
			//내용이 없을 때 체크
			if(!reply.reply){
				alert('내용을 입력해주세요')
			} else{ //내용이 있으면 modify
				replyService.modify(reply, function(result){
				textarea.val("");
				toggle_div.attr("style", "display : none");
				showList(1);
					});
				}
			}	
							
			//댓글 수정 중 취소 버튼 클릭시
			if($(e.target).attr('id') == 'modified_cancel'){
				textarea.val("");
				toggle_div.slideToggle("slow", "swing");
				}
			});
</script><!-- 댓글 끝 -->
</body>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</html>