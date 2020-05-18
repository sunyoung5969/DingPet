<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="./includes/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css?v=5">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<style>
	
	@font-face { font-family: 'BMHANNAAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff'); font-weight: normal; font-style: normal; }

	.text-center {font-family: 'BMHANNAAir';}
	
	.bg-sitter{
		background: #163e5e;
	}
	
	.HoF-title{
		color: #babc56 !important;
	}
	
	.HoF-name{
		color: #fff !important;
	}
	
</style>
<section class="site-blocks-cover overflow-hidden bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-7 align-self-center text-center text-md-left">
            <div class="intro-text">
              <h1><span style="color:#088cf3">DingPet</span> 서비스<span class="d-md-block">바로 이용해보세요!</span></h1>
              <p class="mb-4">펫시터 활동 및 예약 / 반려견 찾기 / 반려견 동반 시설지도 <span class="d-block">딩펫에서 해결하는건 어떠신가요?</p>
            </div>
            
            <!-- 임시 메뉴 -->
            <div>
            	<c:choose>
            	<c:when test="${isLogOn == true && customers != null}">
					<h3>${customers.member_nickname}님 어서오세요!</h3>
				</c:when>
				</c:choose>
			</div>
			
          </div>
          <div class="col-md-5 align-self-end text-center text-md-right">
            <img src="${pageContext.request.contextPath}/resources/images/dogger_img_1.png" alt="Image" class="img-fluid cover-img">
          </div>
        </div>
      </div>
    </section> 

    <section class="site-section">
      <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">Welcome to Dogger Pet Care</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>

        <div class="row hover-1-wrap mb-5 mb-lg-0">
          <div class="col-12">
            <div class="row">
              <div class="mb-4 mb-lg-0 col-lg-6 order-lg-2" data-aos="fade-right">
                <a href="#" class="hover-1">
                  <img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_3.jpg" alt="Image" class="img-fluid">
                </a>
              </div>
              <div class="col-lg-5 mr-auto text-lg-right align-self-center order-lg-1" data-aos="fade-left">
                <h2 class="text-black">Love &amp; Care</h2>
                <p class="mb-4">Far far away, behind the word mountains, Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                <p><a href="#" class="btn btn-primary">Read More</a></p>
              </div>
            </div>
          </div>
        </div>

        <div class="row hover-1-wrap mb-5 mb-lg-0">
          <div class="col-12">
            <div class="row">
              <div class="mb-4 mb-lg-0 col-lg-6"  data-aos="fade-left">
                <a href="#" class="hover-1">
                  <img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid">
                </a>
              </div>
              <div class="col-lg-5 ml-auto align-self-center"  data-aos="fade-right">
                <h2 class="text-black">Fearsome</h2>
                <p class="mb-4">Far far away, behind the word mountains, Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                <p><a href="#" class="btn btn-primary">Read More</a></p>
              </div>
            </div>
          </div>
        </div>

        <div class="row hover-1-wrap">
          <div class="col-12">
            <div class="row">
              <div class="mb-4 mb-lg-0 col-lg-6 order-lg-2" data-aos="fade-right">
                <a href="#" class="hover-1">
                  <img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid">
                </a>
              </div>
              <div class="col-lg-5 mr-auto text-lg-right align-self-center order-lg-1" data-aos="fade-left">
                <h2 class="text-black">Beautiful</h2>
                <p class="mb-4">Far far away, behind the word mountains, Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                <p><a href="#" class="btn btn-primary">Read More</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="site-section bg-sitter trainers" id="about-section">
    <!-- 
      <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-5 align-self-center mr-auto text-left heading-section mb-5">
            <div class="paws ml-4">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-3">About Us</h2>
            <p class="lead">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <p class="text-muted mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
            <ul class="list-unstyled ul-paw primary mb-0">
              <li>A small river named Duden flows</li>
              <li>It is a paradisematic country</li>
              <li>Roasted parts of sentences fly</li>
            </ul>
            
          </div>
          <div class="col-lg-6 text-left heading-section mb-5"  data-aos="fade-up" data-aos-delay="100">
            <a  data-fancybox data-ratio="1.5" href="https://vimeo.com/317571768" class="video-img">
              <span class="play">
                <span class="icon-play"></span>
              </span>
              <img src="${pageContext.request.contextPath}/resources/images/dogger_img_big_1.jpg" alt="Image" class="img-fluid">
            </a>
          </div>
        </div>
      </div>
       -->
        <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-7 text-center heading-section mb-5">
            <div class="paws white">
              <span class="icon-paw"></span>
            </div>
            <h2 class="mb-2 heading text-center HoF-title">Hall of Fame</h2>
            <p class="text-center">고객님들께서 가장 많이 이용하신 펫시터를 소개합니다 인증된 펫시터에게 소중한 반려견을 믿고 맡겨보세요.</p>
          </div>
        </div>
        <div class="row">
        <c:forEach var="HoF" items="${HoF }">
        	<input type="hidden" name="sitter_ID" value="${HoF.sitter_ID }">
        	<div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up" data-aos-delay="">
	            <div class="trainer">
					<figure>
						<img class="HoF-img" src="https://www.dingpet.shop/img/${HoF.profile_PicName }" alt="Image" class="img-fluid">
					</figure>
					<div class="px-md-3">
						<h3 class="HoF-name text-center">${HoF.member_Nickname }</h3>
						<div class="wrap-star">
					   		<div class='star-rating'>
						   		<c:set var="starper" value="${HoF.profile_Star*20}%" />
			    		   		<span style ="width:${HoF.profile_Star*20}%"></span>
		    				</div>        
		    				<span style="position: right; margin: 0px;">${HoF.profile_Star}/5.0</span>	
						</div>
						<p class="text-center">${HoF.profile_Title }</p>
					</div>
				</div>
			</div>
        </c:forEach>
        </div>
      </div>
    </section>

    <section class="site-section" id="trainers-section">
      <!-- 
      <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-7 text-center heading-section mb-5">
            <div class="paws white">
              <span class="icon-paw"></span>
            </div>
            <h2 class="mb-2 heading text-center HoF-title">Hall of Fame</h2>
            <p class="text-center">고객님들께서 가장 많이 이용하신 펫시터를 소개합니다 인증된 펫시터에게 소중한 반려견을 믿고 맡겨보세요.</p>
          </div>
        </div>
        <div class="row">
        <c:forEach var="HoF" items="${HoF }">
        	<input type="hidden" name="sitter_ID" value="${HoF.sitter_ID }">
        	<div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up" data-aos-delay="">
	            <div class="trainer">
					<figure>
						<img class="HoF-img" src="https://www.dingpet.shop/img/${HoF.profile_PicName }" alt="Image" class="img-fluid">
					</figure>
					<div class="px-md-3">
						<h3 class="HoF-name text-center">${HoF.member_Nickname }</h3>
						<div class="wrap-star">
					   		<div class='star-rating'>
						   		<c:set var="starper" value="${HoF.profile_Star*20}%" />
			    		   		<span style ="width:${HoF.profile_Star*20}%"></span>
		    				</div>        
		    				<span style="position: right; margin: 0px;">${HoF.profile_Star}/5.0</span>	
						</div>
						<p class="text-center">${HoF.profile_Title }</p>
					</div>
				</div>
			</div>
        </c:forEach>
        </div>
      </div>
       -->
       <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-7 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="mb-2 text-black heading">펫시터 평균 이용 가격</h2>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-12 col-sm-6 col-md-6 col-lg-4 bg-primary p-3 p-md-5 small-card" data-aos="fade-up" data-aos-delay="">
            <div class="pricing">
              <h3 class="text-center text-white text-uppercase">소 형 견</h3>
              <div class="price text-center mb-4 ">
                <span><span>${AVGPrice.small_Price_AVG } 원</span> / 1시간</span>
              </div>
                <p class="text-center">소형견 크기 기준</p>
                <p class="text-center">10kg 미만</p>
                <img class="small-size-img" src="${pageContext.request.contextPath}/resources/images/small_size_img.png">
            </div>
			<div class="small-size"><p class="text-center dog-type"><a href="#" class="btn btn-secondary">이용하기</a></p></div>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-4 bg-dark  p-3 p-md-5 medium-card" data-aos="fade-up" data-aos-delay="100">
            <div class="pricing">
              <h3 class="text-center text-white text-uppercase">중 형 견</h3>
              <div class="price text-center mb-4 ">
                <span><span> ${AVGPrice.medium_Price_AVG } 원</span> / 1시간</span>
              </div>
                <p class="text-center" style="color: #fff;">중형견 크기 기준</p>
                <p class="text-center" style="color: #fff;">10kg이상 25kg미만</p>
                <div><img class="medium-size-img" src="${pageContext.request.contextPath}/resources/images/medium_size_img.png"></div>
            </div>
            <div class="medium-size"><p class="text-center dog-type"><a href="#" class="btn medium-btn text-center">이용하기</a></p></div>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-4 bg-primary  p-3 p-md-5 large-card" data-aos="fade-up" data-aos-delay="200">
            <div class="pricing">
              <h3 class="text-center text-white text-uppercase">대 형 견</h3>
              <div class="price text-center mb-4 ">
                <span><span>${AVGPrice.large_Price_AVG } 원</span> / 1시간</span>
              </div>
                <p class="text-center">대형견 크기 기준</p>
                <p class="text-center">25kg 이상</p>
                <img class="large-size-img" src="${pageContext.request.contextPath}/resources/images/large_size_img.png">
            </div>
            <div class="large-size"><p class="text-center dog-type"><a href="#" class="btn btn-secondary text-center">이용하기</a></p></div>
          </div>
        </div>
      </div>
    </section>

    <section class="site-section" id="pricing-section">
      <!-- 
      <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-7 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="mb-2 text-black heading">펫시터 평균 이용 가격</h2>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-12 col-sm-6 col-md-6 col-lg-4 bg-primary p-3 p-md-5 small-card" data-aos="fade-up" data-aos-delay="">
            <div class="pricing">
              <h3 class="text-center text-white text-uppercase">소 형 견</h3>
              <div class="price text-center mb-4 ">
                <span><span>${AVGPrice.small_Price_AVG } 원</span> / 1시간</span>
              </div>
                <p class="text-center">소형견 크기 기준</p>
                <p class="text-center">10kg 미만</p>
                <img class="small-size-img" src="${pageContext.request.contextPath}/resources/images/small_size_img.png">
            </div>
			<div class="small-size"><p class="text-center dog-type"><a href="#" class="btn btn-secondary">이용하기</a></p></div>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-4 bg-dark  p-3 p-md-5 medium-card" data-aos="fade-up" data-aos-delay="100">
            <div class="pricing">
              <h3 class="text-center text-white text-uppercase">중 형 견</h3>
              <div class="price text-center mb-4 ">
                <span><span> ${AVGPrice.medium_Price_AVG } 원</span> / 1시간</span>
              </div>
                <p class="text-center" style="color: #fff;">중형견 크기 기준</p>
                <p class="text-center" style="color: #fff;">10kg이상 25kg미만</p>
                <div><img class="medium-size-img" src="${pageContext.request.contextPath}/resources/images/medium_size_img.png"></div>
            </div>
            <div class="medium-size"><p class="text-center dog-type"><a href="#" class="btn medium-btn text-center">이용하기</a></p></div>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-4 bg-primary  p-3 p-md-5 large-card" data-aos="fade-up" data-aos-delay="200">
            <div class="pricing">
              <h3 class="text-center text-white text-uppercase">대 형 견</h3>
              <div class="price text-center mb-4 ">
                <span><span>${AVGPrice.large_Price_AVG } 원</span> / 1시간</span>
              </div>
                <p class="text-center">대형견 크기 기준</p>
                <p class="text-center">25kg 이상</p>
                <img class="large-size-img" src="${pageContext.request.contextPath}/resources/images/large_size_img.png">
            </div>
            <div class="large-size"><p class="text-center dog-type"><a href="#" class="btn btn-secondary text-center">이용하기</a></p></div>
          </div>
        </div>
      </div>
       -->
       <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">서비스</h2>
            <p>딩펫에서 제공되는 서비스 리스트 입니다.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up" data-aos-delay="">
            
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_checkup.svg" alt="Image mb-5">
              <h3>애견 상태 확인</h3>
              <p>애견상태를 상시로 확인 하고있습니다.</p>
            </div>

          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="100">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_dermatology.svg" alt="Image mb-5">
              <h3>애견 피부</h3>
              <p>애견 피부 상태 또한 확인 하여<br> 건강한 모발을 유지 할 수 있습니다.</p>
            </div>
          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="200">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_bones.svg" alt="Image mb-5">
              <h3>튼튼한 치아를 위해</h3>
              <p>애견의 튼튼한 치아를 위해 개껌 등을<br> 제공하며 치아건강을 유지합니다</p>
            </div>
          </div>


          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="">
            
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_veterinary.svg" alt="Image mb-5">
              <h3>애견 응급치료</h3>
              <p>어떠한 상황이 생겼을 때 <br>우선적으로 응급치료를 할 수 있도록 합니다.</p>
            </div>

          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="100">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_dryer.svg" alt="Image mb-5">
              <h3>애견 드라이</h3>
              <p>애견의 모 상태를 체크하여<br>샤워후 젖은 애견의 드라이 서비스도 제공합니다. </p>
            </div>
          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="200">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_veterinarian.svg" alt="Image mb-5">
              <h3>전문 수의사</h3>
              <p>항시 위기상황을 대비하여 <br>전문 수의사 선생님이 있습니다. </p>
            </div>
          </div>
            
        </div>
      </div>
    </section>
<!-- 
    <section class="site-section" id="faq-section">
      <div class="container" id="accordion">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">Frequently Ask Questions</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="row accordion justify-content-center block__76208">
          <div class="col-lg-6 order-lg-2 mb-5 mb-lg-0" data-aos="fade-up"  data-aos-delay="">
            <img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid rounded">
          </div>
          <div class="col-lg-5 mr-auto order-lg-1" data-aos="fade-up"  data-aos-delay="100">
            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseFive" role="button" aria-expanded="true" aria-controls="collapseFive">Should I stop letting my dog sleep with me at night?<span class="icon"></span></a>
              </h3>
              <div id="collapseFive" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                </div>
              </div>
            </div> <!-- .accordion-item 

            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseSix" role="button" aria-expanded="false" aria-controls="collapseSix">Is it okay to dress up your dog?<span class="icon"></span></a>
              </h3>
              <div id="collapseSix" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                </div>
              </div>
            </div> <!-- .accordion-item 

            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseSeven" role="button" aria-expanded="false" aria-controls="collapseSeven">Why do dogs like belly rubs so much?<span class="icon"></span></a>
              </h3>
              <div id="collapseSeven" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                </div>
              </div>
            </div> <!-- .accordion-item 

            <div class="accordion-item">
              <h3 class="mb-0 heading">
                <a class="btn-block" data-toggle="collapse" href="#collapseEight" role="button" aria-expanded="false" aria-controls="collapseEight">Is a warm dry nose a sign of illness in dogs?<span class="icon"></span></a>
              </h3>
              <div id="collapseEight" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="body-text">
                  <p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
                </div>
              </div>
            </div> <!-- .accordion-item 

          </div>

          
        </div>
      </div>
    </section>

    <section class="site-section bg-light block-13" id="testimonials-section" data-aos="fade">
      <div class="container">
        
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">Happy Customers</h2>
          </div>
        </div>
        <div  data-aos="fade-up" data-aos-delay="200">
          <div class="owl-carousel nonloop-block-13">
            <div>
              <div class="block-testimony-1 text-center">
                
                <blockquote class="mb-4">
                  <p>&ldquo;The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.&rdquo;</p>
                </blockquote>

                <figure>
                  <img src="${pageContext.request.contextPath}/resources/images/person_4.jpg" alt="Image" class="img-fluid rounded-circle mx-auto">
                </figure>
                <h3 class="font-size-20 text-black">Ricky Fisher</h3>
              </div>
            </div>

            <div>
              <div class="block-testimony-1 text-center">

                

                <blockquote class="mb-4">
                  <p>&ldquo;Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.&rdquo;</p>
                </blockquote>

                <figure>
                  <img src="${pageContext.request.contextPath}/resources/images/person_2.jpg" alt="Image" class="img-fluid rounded-circle mx-auto">
                </figure>
                <h3 class="font-size-20 mb-4 text-black">Ken Davis</h3>

                
              </div>
            </div>

            <div>
              <div class="block-testimony-1 text-center">
                

                <blockquote class="mb-4">
                  <p>&ldquo;A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.&rdquo;</p>
                </blockquote>

                <figure>
                  <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image" class="img-fluid rounded-circle mx-auto">
                </figure>
                <h3 class="font-size-20 text-black">Mellisa Griffin</h3>

                
              </div>
            </div>

            <div>
              <div class="block-testimony-1 text-center">

                

                <blockquote class="mb-4">
                  <p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
                </blockquote>

                <figure>
                  <img src="${pageContext.request.contextPath}/resources/images/person_3.jpg" alt="Image" class="img-fluid rounded-circle mx-auto">
                </figure>
                <h3 class="font-size-20 mb-4 text-black">Robert Steward</h3>

                
              </div>
            </div>


          </div>
        </div>
      </div>
    </section>

    <section class="site-section" id="gallery-section">
      <div class="container-fluid">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">Photo Gallery</h2>
          </div>
        </div>
        <div class="row no-gutters">
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>

            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_3.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_3.jpg" alt="Image" class="img-fluid"></a>

            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_4.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_4.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_5.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_5.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_6.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_6.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_3.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_3.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_4.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_4.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_5.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_5.jpg" alt="Image" class="img-fluid"></a>
          
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_6.jpg" data-fancybox="gal"><img src="${pageContext.request.contextPath}/resources/images/dogger_img_sm_6.jpg" alt="Image" class="img-fluid"></a>

        </div>
      </div>
    </section>



    <section class="site-section " id="services-section">
      <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">서비스</h2>
            <p>딩펫에서 제공되는 서비스 리스트 입니다.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up" data-aos-delay="">
            
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_checkup.svg" alt="Image mb-5">
              <h3>애견 상태 확인</h3>
              <p>애견상태를 상시로 확인 하고있습니다.</p>
            </div>

          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="100">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_dermatology.svg" alt="Image mb-5">
              <h3>애견 피부</h3>
              <p>애견 피부 상태 또한 확인 하여<br> 건강한 모발을 유지 할 수 있습니다.</p>
            </div>
          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="200">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_bones.svg" alt="Image mb-5">
              <h3>튼튼한 치아를 위해</h3>
              <p>애견의 튼튼한 치아를 위해 개껌 등을<br> 제공하며 치아건강을 유지합니다</p>
            </div>
          </div>


          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="">
            
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_veterinary.svg" alt="Image mb-5">
              <h3>애견 응급치료</h3>
              <p>어떠한 상황이 생겼을 때 <br>우선적으로 응급치료를 할 수 있도록 합니다.</p>
            </div>

          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="100">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_dryer.svg" alt="Image mb-5">
              <h3>애견 드라이</h3>
              <p>애견의 모 상태를 체크하여<br>샤워후 젖은 애견의 드라이 서비스도 제공합니다. </p>
            </div>
          </div>
          <div class="col-md-6 mb-4 col-lg-4" data-aos="fade-up"  data-aos-delay="200">
            <div class="block_service">
              <img src="${pageContext.request.contextPath}/resources/images/dogger_veterinarian.svg" alt="Image mb-5">
              <h3>전문 수의사</h3>
              <p>항시 위기상황을 대비하여 <br>전문 수의사 선생님이 있습니다. </p>
            </div>
          </div>
            
        </div>
      </div>
    </section>

    
    
    <section class="" id="contact-section">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-lg-6 bg-primary">
            <form action="#" class="p-5 contact-form">
              
              <h2 class="h4 mb-5 heading">Contact Form</h2> 

              <div class="row form-group">
                <div class="col-md-6 mb-3 mb-md-0">
                  <label for="fname">First Name</label>
                  <input type="text" id="fname" class="form-control">
                </div>
                <div class="col-md-6">
                  <label for="lname">Last Name</label>
                  <input type="text" id="lname" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12">
                  <label for="email">Email</label> 
                  <input type="email" id="email" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                
                <div class="col-md-12">
                  <label for="subject">Subject</label> 
                  <input type="subject" id="subject" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label for="message">Message</label> 
                  <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Write your notes or questions here..."></textarea>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Send Message" class="btn btn-dark btn-md text-white">
                </div>
              </div>

  
            </form>
          </div>
          <div class="col-lg-6 bg-secondary">
            <div class="row justify-content-center align-items-center h-100">
              <div class="col-lg-6 text-center heading-section mb-5 align-self-center">
                <div class="paws">
                  <span class="icon-paw"></span>
                </div>
                <h2 class="text-white mb-5">Contact Us</h2>
                <ul class="list-unstyled text-left address">
                  <li>
                    <span class="d-block">Address:</span>
                    <p>Melbourne St,South Birbane 4101 Austraila</p>
                  </li>
                  <li>
                    <span class="d-block">Phone:</span>
                    <p>+(000) 123 4567 89</p>
                  </li>
                  <li>
                    <span class="d-block">Email:</span>
                    <p>info@yourdomain.com</p>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
-->
<%@include file="./includes/footer.jsp"%>