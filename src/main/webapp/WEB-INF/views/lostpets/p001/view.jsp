<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>

<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">

    <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="col-xs-12 page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); 
        	transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-5 pb-5" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-2">임시보호견 상세 정보</h2>
                        </div>
                    </div>
                    <!-- 제목, 작성자, 작성일시-->
                    <div class="ml-3 mr-3 mt-3 align-self-center pb-3">
	                	<h2 class = "mb-2 color_blue" ><c:out  value = "${board.title}"/></h2>
	                    <div class = "top_info">
		    	            <span><strong><c:out value = "${board.member_id}"/></strong></span>
		    	            <span id = "board_date"></span>
	                    </div>
                   	</div>
                   	<hr class = "hr_style">
                    <div class="row pt-3 dp-webkit">
                        <div class="col-lg-5 col-md-6 align-self-center">
                            <div class="image-block bg-about">
                                <img class="img-fluid" src="/resources/images/dogger_img_big_1.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-6 align-self-center">
                            <aside class="nav-tabs">
                            	<div class="mt-1 color_blue pt-3 pb-3"><strong>강아지 이름</strong> </div>
                                <div class="ml-2 pb-3">
                                    <span class="h6"><c:out  value = "${board.dog_name}"/></span>
                                </div>
                            </aside>
                            <aside class="nav-tabs">
		                    	<div class="mt-1 color_blue pt-3 pb-3"><strong>견종</strong> </div>
		                        <div class="ml-2 pb-3">
		                            <span class="h6"><c:out  value = "${board.dog_breed}"/></span>
		                        </div>
		                    </aside>
                            <aside class="nav-tabs">
		                    	<div class="mt-1 color_blue pt-3 pb-3"><strong>성별</strong> </div>
		                        <div class="ml-2 pb-3">
		                            <span class="h6"><c:out  value = "${board.dog_sex}"/></span>
		                        </div>
		                    </aside>
                            <aside class="nav-tabs">
		                    	<div class=" mt-1 color_blue pt-3 pb-3"><strong>크기</strong> </div>
		                        <div class="ml-2 pb-3">
		                            <span class="h6"><c:out  value = "${board.dog_size}"/></span>
		                        </div>
		                    </aside>
                            <aside class="nav-tabs">
		                    	<div class=" mt-1 color_blue pt-3 pb-3"><strong>특이사항</strong> </div>
		                        <div class="ml-2 pb-3">
		                            <span class="h6"><c:out  value = "${board.dog_note}"/></span>
		                        </div>
		                    </aside>
                            <aside class="nav-tabs">
                            	<div class=" mt-1 color_blue pt-3 pb-3"><strong>발견일시</strong> </div>
                                <div class="ml-2 pb-3">
                                    <span class="h6"><c:out  value = "${board.found_date}"/></span>
                                </div>
                            </aside>
                            <aside class="nav-tabs">
                            	<div class=" mt-1 color_blue pt-3 pb-3"><strong>발견장소</strong> </div>
                                <div class="ml-2 pb-3">
                                    <span class="h6"><c:out  value = "${board.found_location}"/></span>
                                </div>
                            </aside>
                            
                        </div>
                    </div>
                    
                    <section class="nav-tabs">
                    	<div class="ml-2 mt-1 color_blue pt-3 pb-3"><strong>내용</strong> </div>
	                    <div  class="txt-box ">
	                        <p class = "h6"><c:out  value = "${board.content}"/></p>
	                    </div>
                    </section>

                    <!--Gallery-->
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
                          </div>
                        </div>
                      </section>      <!--====  End of Gallery  ====-->

					<!-- 댓글 시작 -->              
                    <aside id="listify_widget_panel_listing_comments-1" class="widget widget-job_listing listify_widget_panel_listing_comments pb-5">
                        <h2 id="respond" class="widget-title widget-title__job_listing ion-ios-compose-outline">댓글</h2>
                        <!-- 댓글 목록 표시 -->
                        <ul id="comments" class="mt-4 mb-4 ">
		                    <li class = "mb-2" data-reply_id ='6'>
                                <div>
                                	<div>
                                		<strong></strong>
                                		<small></small>
                                	</div>
                                    <div class="comment-content comment col-md-10 col-sm-9 col-12 width100">
                                        <p class = "fn"></p>
                                    </div><!-- .comment-content -->
                                </div><!-- #comment-## -->
                            </li><!-- #comment-## -->
                         </ul><!-- 댓글 목록 표시 끝-->
                         
                         <!-- 댓글 작성 폼-->
                        <div class="comment-respond pt-3">
                                <!-- wsl_render_auth_widget -->
                                <h2 id="respond" class="widget-title widget-title__job_listing ion-ios-compose-outline ">댓글 작성</h2>
                                <div class="comment-form-comment w-80 float-left">
                                    <textarea id ="comment" cols="45" rows="4"  class="form-control" maxlength="65525" placeholder = "댓글을 쓰려면 먼저 로그인 해주세요! " disabled required></textarea>
                                </div>
                                <div class="form-submit float-right w-20 flex_row p-3">
                                    <button id="reply_submit" type = "button" class="btn btn-primary btn-sm " >댓글 등록</button> 
                               	</div>
                        </div><!-- #respond -->
                     </aside>
                     
                     <script>
                     	$(document).ready(function(){
                     		var loggedInId = '${customers.member_id}';
                     		
                     		if(loggedInId){
                     			$("#comment").attr("placeholder", "안녕하세요," + loggedInId + "님! 댓글을 남겨 회원들과 소통해보세요!");
                     			$("#comment").removeAttr("disabled");
                     		}
                     	});
                     </script>
                     
					<!-- buttons -->
					<div class="text-center pb-5">
						<button data-oper="list" class="btn-sm btn btn-primary">목록으로</button>
						<c:if test = "${customers.member_id == board.member_id}">
							<button data-oper="modify" class="btn-sm btn btn-primary">수정</button>
							<button data-oper="delete" class="btn-sm btn btn-primary">삭제</button>
						</c:if>
					</div>
					<!-- buttons end--> 
					</div>
            </div>
        </div>
      </section>
					
					<!--submitting hidden parameters -->
					<form id='operForm' action='modify' method='get'>
						<input type="hidden" id="board_id" name="board_id" value="${board.board_id }" />
						<input type="hidden" id="dog_id" name="dog_id" value="${board.dog_id }" />
						<input type="hidden" name="pageNum" value="${cri.pageNum }"> 
						<input type="hidden" name="amount" value="${cri.amount }">
					</form>
					<!-- submitting hidden parameters ends -->
					
					<!-- 버튼 처리 -->
					<script type="text/javascript">
                     	$(document).ready(function(){
                        	var operForm = $("#operForm");
                            //수정 버튼
                            $("button[data-oper = 'modify']").on("click", function(e){
	                            	operForm.attr("action", "modify").submit();
                            });
                            //삭제 버튼
                            $("button[data-oper = 'delete']").on("click", function(e){
                            	if(confirm("정말 삭제하시겠어요?")){
                            		operForm.attr({action : 'delete', method : 'post'}).submit();
                            	}else{
                            		return;
                            	}
                            })
                            //목록으로 버튼        		
                           	$("button[data-oper = 'list']").on("click", function(e){
                           		 operForm.find("#dog_id").remove();
                                 operForm.find("#board_id").remove();
                                 operForm.attr("action", "list").submit();
                            });
                     	});
		           	</script>
		           	<!-- 버튼 처리 끝 -->
					
					
					<!-- 댓글 ajax 처리 -->
					<script type = "text/javascript" src = "/resources/js/reply.js"></script>
					
					<script type = "text/javascript">
						//날짜 포맷 변경
						var boardDate = ${board.board_date};
						var dateString = boardDate.toString();
						$("#board_date").html("<small>" + replyService.formatDate(dateString) + "</small>");
						
						//댓글 목록 표시
						var board_idValue = '<c:out value = "${board.board_id}"/>';
						var replyUL = $("#comments");
						var loggedInId = '${customers.member_id}';
						
						showList(1);
						
						function showList(pageNum){
							replyService.getList({board_id : board_idValue, pageNum : pageNum || 1},
								function(list){
									var str = "";
									if(list == null || list.length == 0){
										replyUL.html("아직 작성된 댓글이 없습니다.");
										return;
									}
									for(var i = 0, length = list.length || 0; i < length; i++){
										str += "<li class = 'mb-2' data-reply_id ='" + list[i].reply_id + "'>";
										str += "<div><div class =  reply_info'><span><strong>" + list[i].replyer +"</strong>님</span>";
										str += "<span><small>" + replyService.formatDate(list[i].reply_date) + "</small></span>";
										
										//댓글 작성자에게만 수정 삭제 버튼 표시
										if(list[i].replyer == loggedInId){
											str += "<button class = 'small_btn btn btn-primary float-right' id = 'reply_modify'>수정</button>";
											str += "<button class = 'small_btn btn btn-primary float-right' id = 'reply_delete'>삭제</button>";
										}

										str += "</div><div class='comment-content comment reply_info'>";
										str += "<p id = 'original_content' class = 'fn ml-3 mr-3'>" + list[i].reply + "</p>";
										str += "<div class = 'flex_row toggle_div pb-2' style = 'display : none'><div class = 'w-90'><textarea cols='45' rows='4'  class='form-control' maxlength='65525' required></textarea></div>";
										str += "<div class = 'flex_column w-10'><button id = 'modified_submit' class = 'small_btn btn btn-primary'>등록</button><button id = 'modified_cancel' class = 'small_btn btn btn-primary'>취소</button>";
										str += "</div></div></div></div></li>";
									}
									replyUL.html(str);
							});
						};
					
					
						//댓글 쓰기
						 $("#reply_submit").on("click", function(e){
                    		 var reply = {
                    				 reply : $("#comment").val(),
                    				 replyer : loggedInId,
                    				 board_id : board_idValue
                    		 };
                    		 replyService.write(reply, function(result){
                    			 $("#comment").val("");
                    			 showList(1);
                    		 });
                    	 });
						
						$("#comments").on("click", "li", function(e){
							var reply_idValue = $(this).data("reply_id");
							console.log(reply_idValue);
							//댓글 삭제
							if($(e.target).attr('id') === $("#reply_delete").attr('id')){
								if(confirm("정말로 삭제하시겠어요?")){
									replyService.remove(reply_idValue, function(result){
										alert('댓글이 삭제되었습니다.');
										showList(1);
									})
								}else{
								console.log("선택되지 않음");
								}
							}
							
							
							//댓글 수정
							var toggle_div = $(this).find(".toggle_div");
							var textarea = $(this).find('textarea');
							var modified_content = $(this).find('textarea').val();
							var original_content = $(this).find("p").text();
							
							//수정 버튼 클릭 시 원문 표시와 토글
							if($(e.target).attr('id') === $("#reply_modify").attr('id')){
								textarea.val(original_content);
								toggle_div.slideToggle("slow", "swing");
							}
							
							//댓글 수정 중 등록 버튼 클릭 시 
							if($(e.target).attr('id') == 'modified_submit'){
								var reply = {
									reply_id : reply_idValue,
									board_id : board_idValue,
									reply : modified_content
								}

								//내용이 없을 때 체크
								if(!reply.reply){
									alert('내용을 입력해주세요');
								}else{ //내용이 있으면 modify
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
					
					
			
    <!--====  end of contents  ====-->    

<%@include file="../../includes/footer.jsp"%>