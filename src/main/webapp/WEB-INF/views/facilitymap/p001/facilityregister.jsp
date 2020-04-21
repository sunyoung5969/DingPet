<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../includes/header.jsp"%>

    <!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="row">
            <div class="col-lg-12 col-lg-offset-2 ">
                <div class="cotainer">
                    <div class="row justify-content-center pt-3 aos-init aos-animate" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-4">시설 상세 정보 입력</h2>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-10  pb-5">
                            <div class="card">
                                <div class="card-body pd40">
                                    <form action="" method="">
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설명</label>
                                            <div class="col-md-7">
                                                <input type="text" id="tempshelters-title" class="form-control" name="tempshelters-title">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">주소</label>
                                            <div class="col-md-7">
                                                <input type="text" id="tempshelters-title" class="form-control" name="tempshelters-title">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">유형</label>
                                            <div class="col-md-7">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <select class="form-control">
                                                        <optgroup label="유형">
                                                            <option value="API">API</option>
                                                        </optgroup>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설 종류</label>
                                            <div class="col-md-7">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <select class="form-control" name="category_name">
                                                        <optgroup label="시설 종류">
                                                            <option value="ground">운동장</option>
                                                            <option value="shopping">쇼핑몰</option>
                                                            <option value="Restaurant">동반식당</option>
                                                            <option value="width_cafe">동반카페</option>
                                                            <option value="dog_cafe">애견카페</option>
                                                            <option value="hotel">호텔</option>
                                                        </optgroup>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">휴대전화</label>
                                            <div class="col-md-7">
                                                <input type="text" id="phone_num" class="form-control" name="phone_num">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">위도</label>
                                            <div class="col-md-7">
                                                <input type="text" id="Latitude" class="form-control" name="Latitude">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">경도</label>
                                            <div class="col-md-7">
                                            	<input type="text" id="longitude" class="form-control" name="longitude">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설 소개</label>
                                            <div class="col-md-7">
                                                <textarea id="form_message" name="form_message" class="form-control" rows="4" ></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 col-form-label text-md-right">시설사진</label>
                                            <div class="col-md-7">
                                                <div id='View_area' class="img_up"></div>
                                                <input type="file" name="profile_pt" id="profile_pt"  maxlength="5" onchange="previewImage(this,'View_area')">
                                                
                                            </div>
                                        </div>
                                        
                                        <div class="text-center pd40">
                                            <button type="submit" class="btn btn-primary">등록</button>
                                        </div>
                                </form></div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>