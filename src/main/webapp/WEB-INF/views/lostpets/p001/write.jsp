<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
<!-- lost_found.CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lost_found.css">

    <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);">
        </div>
        <div class="main main-raised">
        	<div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-5 pb-5" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-2">임시보호 / 실종견 찾기 등록</h2>
                        </div>
                    </div>
                    <div class="card-body pd40">
                        <form id = "lost_found_form" action="/lostpets/p001/write" method="post">
							<div class="form-group row">
								<label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">카테고리</label>
								<div class="col-md-6">
									<input type="radio" id="tempshelters-title" class="form-control"	name="category" value = "lost">
									<label for = "lost">임시보호 등록</label>&nbsp;&nbsp;
									<input type="radio" id="tempshelters-title" class="form-control"	name="category" value = "find">
									<label for = "find">실종견 찾기 등록</label>
								</div>
							</div>
							<div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">제목</label>
                                <div class="col-md-6">
                                    <input type="text" id="tempshelters-title" class="form-control" name="title"
                                    placeholder = "제목을 입력하세요" maxlength = "200" autofocus required>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">멤버 id</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="member_id">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">견종</label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="dog_breed" maxlength = "30" placeholder = "예) 골든 리트리버" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">이름</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="dog_name" maxlength = "20" placeholder = "예) 쪼롱이" required>
                                </div>
                            </div>
                                 <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">성별</label>
                                <div class="col-md-6">
									<input type="radio"  class="form-control"	name="dog_sex" value = "암컷" required>
									<label for = "암컷">암컷</label>&nbsp;&nbsp;
									<input type="radio"  class="form-control"	name="dog_sex" value = "수컷">
									<label for = "수컷">수컷</label>
								</div>
                            </div>
                                 <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">크기</label>
                                <div class="col-md-6">
                                	<input type="radio" class="form-control"	name="dog_size" value = "소형" required>
									<label for = "소형">소형</label>&nbsp;&nbsp;
									<input type="radio"  class="form-control"	name="dog_size" value = "중형">
									<label for = "중형">중형</label>&nbsp;&nbsp;
									<input type="radio" class="form-control"	name="dog_size" value = "대형">
									<label for = "대형">대형</label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">발견일시</label>
                                <div class="col-md-6">
                                    <input type="date" id="found_date" class="form-control" name="found_date"  min = "2020-01-01"  required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">발견장소</label>
                                <div class="col-md-6">
                                    <input type="text"  class="form-control" name="found_location" maxlength = "50" placeholder = "예)종각역 YMCA 앞" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">특이사항</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="dog_note" maxlength = "1000">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">내용</label>
                                <div class="col-md-6">
                                    <textarea id="form_message" name="content" class="form-control" rows="6" 
                                    placeholder = "보호하고 있거나 찾고 있는 강아지에 대한 정보를 적어주세요.&#10;정보는 구체적일수록 좋습니다!" required></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right color_blue lost_found_label">사진</label>
                                <div class="col-md-6">
                                    <input type="file" name="uploadFile" id="profile_pt" onchange="previewImage(this,'View_area')">
                                    <div id='View_area' class="img_up"></div>
                                </div>
                            </div>
                               
                            <div class="pb-5 pt-5 text-center">
                                <button type="submit" class="btn btn-primary">
                                   	 등록하기
                                </button>
                            </div>
                    </form>
                </div>
           </div>
       </div>
        </div>
      </section>
    <!--====  end of contents  ====-->
    
    <!-- 데이트 피커 오늘 날짜로 기본값 설정 -->
    <script>
    	$(document).ready(function(){
    		var date = new Date();
    		
    		var day = date.getDate();
    		var month = date.getMonth() + 1;
    		var year = date.getFullYear();
    		
    		if(month < 10) month = "0" + month;
    		if(day < 10) day = "0" + day;
    		
    		var today = year + "-" + month + "-" + day;
    		$("#found_date").attr({value : today, max : today });
    	});
    </script>

<%@include file="../../includes/footer.jsp"%>