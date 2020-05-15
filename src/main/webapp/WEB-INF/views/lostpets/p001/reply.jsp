<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
										str += "<div><div class =  'reply_info pb-2'><span><strong>" + list[i].nickname +"</strong>님</span>";
										str += "<span class = 'pl-2'><small>" + replyService.formatDate(list[i].reply_date) + "</small></span>";
										
										//댓글 작성자에게만 수정 삭제 버튼 표시
										if(list[i].replyer == loggedInId){
											str += "<i id = 'reply_modify' class='fas fa-pen px-2 color_blue text_right'></i>";
											str += "<i id = 'reply_delete' class='fas fa-trash-alt px-2 color_blue text_right'></i>";
										}

										str += "</div><div class='comment-content comment'>";
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
							
							if($(e.target).attr('id') == undefined){ return;}
							
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