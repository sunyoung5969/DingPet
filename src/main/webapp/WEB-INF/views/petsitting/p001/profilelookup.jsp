<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                          <div class="profile">
                                <div class="avatar text-center">
                                    <img src="https://img.sbs.co.kr/newsnet/etv/upload/2019/01/21/30000621766.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <div class="name text-center">
                                    <h4 class="title">${profile.member_ID }</h4>
                                    <h6>PetSitter</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="description text-center">
                        <p>${profile.profile_Content }</p>
                    </div>
                    <div class="service_warp">
                      <div class="service_list">
                        <h2 class="service_h2">이용 가능 서비스</h2>
                        <div class="service_box">
                          <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet4.png">
                            <div class="service_txtbox">
                              <p class="service_txth1">장기 예약</p>
                              <p class="service_txth2">14일 이상 돌봄 가능</p>
                            </div>
                          </div>
                          <div  class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet8.png">
                            <div class="service_txtbox">
                              <p class="service_txth1">실내 놀이</p>
                              <p class="service_txth2">터그놀이, 노즈워크 등</p>
                            </div>
                          </div>
                          <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet1.png">
                            <div class="service_txtbox">
                              <p class="service_txth1">매일 산책</p>
                              <p class="service_txth2">산책 및 실외 배변 가능</p>
                            </div>
                          </div>
                          <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet2.png">
                            <div class="service_txtbox">
                              <p class="service_txth1">목욕 가능</p>
                              <p class="service_txth2">비용은 펫시터와 협의</p>
                            </div>
                          </div>
                          <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet3.png">
                            <div class="service_txtbox">
                              <p class="service_txth1">약물 복용</p>
                              <p class="service_txth2">경구(입) 약물 복용 가능</p>
                            </div>
                          </div>
                          <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet7.png">
                            <div class="service_txtbox">
                              <p class="service_txth1">집앞 픽업</p>
                              <p class="service_txth2">비용은 펫시터와 협의</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="service_list">
                        <ul class="list-inline text-center">
                          <li class="list-inline-item">
                            <a href="#" class="btn btn-primary">문의하기</a>
                          </li>
                          <li class="list-inline-item">
                            <a href="#" class="btn btn-secondary">예약하기</a>
                          </li>
                        </ul>
                      </div>
                    </div>
      
                    <!--=============================
                    =            Gallery            =
                    ==============================-->
      
                    <section class="pb-xl-5" id="gallery-section">
                        <div class="container-fluid">
                          <div class="row justify-content-center">
                            <div class="col-lg-6 text-center heading-section mb-5">
                              <div class="paws">
                                <span class="icon-paw"></span>
                              </div>
                              <h2 class="text-black mb-2">Photo Gallery</h2>
                            </div>
                          </div>
                          <div class="row no-gutters">
                            
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_3.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_3.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_4.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_4.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_5.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_5.jpg" alt="Image" class="img-fluid"></a>                            
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_6.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_6.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
                          </div>
                        </div>
                      </section>
      
                    <!--====  End of Gallery  ====-->
                    <!--== start review ==-->
                    <div class="testimonials-wrap">
                        <div class="container">
                            <div class="heading-section">
                                <span class="sub-heading">Testimonials</span>
                                <h2>펫시터 이용 후기</h2>
                            </div>
                            <div class="carousel-testimonial owl-carousel">
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/82.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Mark Huff</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/83.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Rodel Golez</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/84.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Ken Bosh</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/85.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Racky Henderson</p>
                                            <span class="position">Father</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/86.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Henry Dee</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/87.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Mark Huff</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/88.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Rodel Golez</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/89.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Ken Bosh</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/90.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Racky Henderson</p>
                                            <span class="position">Father</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url(https://randomuser.me/api/portraits/men/91.jpg)">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Henry Dee</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="testimonial-box d-flex">
                                        <div class="user-img" style="background-image: url('https://randomuser.me/api/portraits/men/92.jpg')">
                                        </div>
                                        <div class="text pl-4">
                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
                                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                            <p class="name">Mark Huff</p>
                                            <span class="position">Businesswoman</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>   
                    <!--== end review ==-->  
                </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====-->  

<%@include file="../../includes/footer.jsp"%>
