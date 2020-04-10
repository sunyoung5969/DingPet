<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>

    <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);">
        </div>
        <div class="main main-raised">
        	<div class="profile-content">
                <div class="container">
                    <div class="row justify-content-center pt-5" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-2">시설 상세 정보</h2>
                        </div>
                    </div>
                    <div class="card-body pd40">
                        <form action="" method="">
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">제목</label>
                                <div class="col-md-6">
                                    <input type="text" id="tempshelters-title" class="form-control" name="tempshelters-title">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">발견일시</label>
                                <div class="col-md-6">
                                    <input type="date" id="date_of_discovery" class="form-control" name="date_of_discovery">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">발견장소</label>
                                <div class="col-md-6">
                                    <input type="text" id="place_of_discovery" class="form-control" name="place_of_discovery">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">견종</label>
                                <div class="col-md-6">
                                    <input type="text" id="dog_breed" class="form-control" name="dog_breed">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">성별</label>
                                <div class="col-md-6">
                                    <input type="text" id="dog_sex" class="form-control" name="dog_sex">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">이메일</label>
                                <div class="col-md-6">
                                    <input type="text" id="email" class="form-control" name="email">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">휴대전화</label>
                                <div class="col-md-6">
                                    <input type="text" id="phone_num" class="form-control" name="phone_num">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">내용</label>
                                <div class="col-md-6">
                                    <textarea id="form_message" name="form_message" class="form-control" rows="4" ></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-4 col-form-label text-md-right">사진</label>
                                <div class="col-md-6">
                                    <input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
                                    <div id='View_area' class="img_up"></div>
                                </div>
                            </div>
                               
                            <div class="text-center pd40">
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

<%@include file="../../includes/footer.jsp"%>