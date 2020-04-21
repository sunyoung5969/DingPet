<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>


<!--====  str of contents  ====-->
    <section class="site-section container pt-7">
        <div class="row ">
            <div class="features">
                <div class="t_bar">
                    <div class="sub_title">유기견을 찾습니다</div>
                    <a href="/lostpets/p001/write" class="btn_a">
                        <span class="sub_txt">등록하기<img src="/resources/images/icon/arrow_right_gray.png" class="sub_arr"></span>
                    </a>
                </div>
                
                <!-- 탭메뉴 -->
			<div class="container">
				<div class="row">
					<div class="col-xs-12 ">
						<nav>
							<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active" id="nav-home-tab"
									data-toggle="tab" href="#nav-home role="tab"
									aria-controls="nav-home" aria-selected="true"> 임시보호</a> <a
									class="nav-item nav-link" id="nav-profile-tab"
									data-toggle="tab" href="#nav-profile" role="tab"
									aria-controls="nav-profile" aria-selected="false"> 찾기</a>
							</div>
						</nav>
						<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
							<div class="tab-pane fade show active" id="nav-home"
								role="tabpanel" aria-labelledby="nav-home-tab">


			<c:forEach items="${list}" var="list">
				<div class="col-md-6 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="0ms"
					style="visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
					<div class="media service-box">
						<div class="pull-left">
							<img alt="image" width="124px" height="124px" src="/resources/images/signup-image.png">
						</div>
						<div class="media-body">
							<a href='/lostpets/p001/view?board_id=<c:out value = "${list.board_id}"/>'>
								<h4 class="media-heading">
								<c:out value = "${list.title }"/></h4>
							</a>
							<p>
								<span class="tag">견종</span><span></span>
								<c:out value="${list.dog_breed}" />
							</p>
							<p>
								<span class="tag">성별</span><span></span>
								<c:out value="${list.dog_sex}" />
							</p>
							<p>
								<span class="tag">발견장소</span><span></span>
								<c:out value="${list.found_location}" />
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<!--  
			<div class="col-md-6 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="0ms" style="visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
                    <div class="media service-box">
                        <div class="pull-left">
                            <img alt="image" width="124px" height="124px" src="/resources/images/signup-image.png">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">짱아를 찾아요</h4>
                            <p><span class="tag">장소</span><span></span> 서울 종로구 종로 69 서울YMCA</p>
                            <p><span class="tag">견종</span><span></span> 말티즈</p>
                            <p><span class="tag">특징</span><span></span> 사람을 잘 따름</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="0ms" style="visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
                    <div class="media service-box">
                        <div class="pull-left">
                            <img alt="image" width="124px" height="124px" src="/resources/images/signup-image.png">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">소미를 찾습니다</h4>
                            <p><span class="tag">장소</span><span></span> 서울 종로구 종로 69 서울YMCA</p>
                            <p><span class="tag">견종</span><span></span> 말티즈</p>
                            <p><span class="tag">특징</span><span></span> 사람을 잘 따름</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="0ms" style="visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
                    <div class="media service-box">
                        <div class="pull-left">
                            <img alt="image" width="124px" height="124px" src="/resources/images/signup-image.png">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">짱아를 찾아요</h4>
                            <p><span class="tag">장소</span><span></span> 서울 종로구 종로 69 서울YMCA</p>
                            <p><span class="tag">견종</span><span></span> 말티즈</p>
                            <p><span class="tag">특징</span><span></span> 사람을 잘 따름</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="0ms" style="visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
                    <div class="media service-box">
                        <div class="pull-left">
                            <img alt="image" width="124px" height="124px" src="/resources/images/signup-image.png">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">소미를 찾습니다</h4>
                            <p><span class="tag">장소</span><span></span> 서울 종로구 종로 69 서울YMCA</p>
                            <p><span class="tag">견종</span><span></span> 말티즈</p>
                            <p><span class="tag">특징</span><span></span> 사람을 잘 따름</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-6 wow fadeInUp animated" data-wow-duration="300ms" data-wow-delay="0ms" style="visibility: visible; animation-duration: 300ms; animation-delay: 0ms; animation-name: fadeInUp;">
                    <div class="media service-box">
                        <div class="pull-left">
                            <img alt="image" width="124px" height="124px" src="/resources/images/signup-image.png">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">짱아를 찾아요</h4>
                            <p><span class="tag">장소</span><span></span> 서울 종로구 종로 69 서울YMCA</p>
                            <p><span class="tag">견종</span><span></span> 말티즈</p>
                            <p><span class="tag">특징</span><span></span> 사람을 잘 따름</p>
                        </div>
                    </div>
                </div>
               -->
				</div>
							<div class="tab-pane fade" id="nav-profile" role="tabpanel"
								aria-labelledby="nav-profile-tab">Et et consectetur ipsum
								labore excepteur est proident excepteur ad velit occaecat qui
								minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim
								pariatur veniam sunt est aute sit dolor anim. Velit non irure
								adipisicing aliqua ullamco irure incididunt irure non esse
								consectetur nostrud minim non minim occaecat. Amet duis do nisi
								duis veniam non est eiusmod tempor incididunt tempor dolor ipsum
								in qui sit. Exercitation mollit sit culpa nisi culpa non
								adipisicing reprehenderit do dolore. Duis reprehenderit occaecat
								anim ullamco ad duis occaecat ex.</div>
					
						</div>
					</div>
				</div>
			</div>

            </div>
        </div>
    </section>
    <!--====  end of contents  ====-->

<%@include file="../../includes/footer.jsp"%>
