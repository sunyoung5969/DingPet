<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profilelookup.css?v=5">

<!--====  str of contents  ====-->
    <section style="padding-top:87px">
    
   		<div class="reservationDiv">
   			<div class="reservation-contationer">
				<div class="profile-reservation">
					<div class="profile-reservationDiv pt-5">
		 				<!-- 프로필 사진 -->
						<div class="profileIMGDiv-reservation" align="center">
							<img class="profileIMG-reservation" alt="Circle Image" src="/resources/images/dogger_img_big_1.jpg">
						</div>
						<!-- 프로필 자기소개 한줄 -->
						<div class="profile_h6Div-reservation" align="center">
							<h6 class="profile_h6-reservation">${profile.profile_Title }</h6>
						</div>
						<div>
							<!-- 이용가능서비스 -->
		                    <div class="service_warp-reservation pt-3">
								<div class="service_list-reservation">
								 	<div class="service_box">
										<c:if test="${profile.service_00 == 'Y' }">
											<div class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet1.png">
												<div class="service_txtbox-reservation">
													<p class="service_txth1">매일 산책</p>
													<p class="service_txth2">산책 및 실외 배변 가능</p>
												</div>
											</div>
										</c:if>
										<c:if test="${profile.service_01 == 'Y' }">
											<div class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet2.png">
												<div class="service_txtbox-reservation">
													<p class="service_txth1">목욕 가능</p>
													<p class="service_txth2">비용은 펫시터와 협의</p>
												</div>
											</div>
										</c:if>
										<c:if test="${profile.service_02 == 'Y' }">
											<div class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet3.png">
												<div class="service_txtbox-reservation">
													<p class="service_txth1">약물 복용</p>
													<p class="service_txth2">경구(입) 약물 복용 가능</p>
												</div>
											</div>
									    </c:if>
									    <c:if test="${profile.service_03 == 'Y' }">
										    <div class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet4.png">
												<div class="service_txtbox-reservation">
													<p class="service_txth1">장기 예약</p>
													<p class="service_txth2">14일 이상 돌봄 가능</p>
												</div>
											</div>
									    </c:if>
									    
									    <c:if test="${profile.service_04 == 'Y' }">
										    <div class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet4.png">
												<div class="service_txtbox-reservation">
													<p class="service_txth1">퍼피 케어</p>
													<p class="service_txth2">1년 미만 퍼피 돌봄</p>
												</div>
											</div>
									    </c:if>
									    
									    <c:if test="${profile.service_05 == 'Y' }">
										    <div class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet4.png">
												<div class="service_txtbox-reservation">
													<p class="service_txth1">노년 케어</p>
													<p class="service_txth2">8년 이상 노견 돌봄</p>
												</div>
											</div>
									    </c:if>
									    
									  	<c:if test="${profile.service_06 == 'Y' }">
									    <div class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet7.png">
											<div class="service_txtbox-reservation">
												<p class="service_txth1">집앞 픽업</p>
												<p class="service_txth2">비용은 펫시터와 협의</p>
											</div>
									    </div>
									    </c:if>
									    <c:if test="${profile.service_07 == 'Y' }">
										    <div  class="service_ico-reservation"><img width="32" height="32" src="/resources/images/icon/pet8.png">
												<div class="service_txtbox-reservation">
													<p class="service_txth1">실내 놀이</p>
													<p class="service_txth2">터그놀이, 노즈워크 등</p>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="price-reservation-container pt-5">
					<div class="priceDiv-reservation" align="center">
						<h2 class="service_h2-reservation">이 용 요 금 </h2><small> (최대 6마리)</small>
						<div class="price_box">
							<div class="price_type-reservation">
								<div class="price-reservation" >
									<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
									<div class="dogtype">
										<p class="type_text" align="center">소형견</p>
										<p class="kg" align="center">10kg 미만</p>
									</div>
									<p class="price_text price_text--small">${profile.price_Small } 원 / 1시간</p>
								</div>
								<div class="number-reservation" align="center">	
									<img width="25px" align="left" onclick="subnumber('small')" src="/resources/images/petsitting/calendar_before.png">
									<p class="num-small">0</p> 
									<img width="25px" align="right" onclick="addnumber('small')" src="/resources/images/petsitting/calendar_next.png">
								</div>
							</div>
							<div class="price_type-reservation">
								<div class="price-reservation">
									<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
									<div class="dogtype">
										<p class="type_text" align="center">중형견</p>
										<p class="kg" align="center">10kg ~ 25kg</p>
									</div>										
									<p class="price_text price_text--medium">${profile.price_Medium } 원 / 1시간</p>
								</div>
								<div class="number-reservation" align="center">
									<img width="25px" align="left" onclick="subnumber('medium')" src="/resources/images/petsitting/calendar_before.png">
									<p class="num-medium">0</p>
									<img width="25px" align="right" onclick="addnumber('medium')" src="/resources/images/petsitting/calendar_next.png">
								</div>
							</div>
							<div class="price_type-reservation">
								<div class="price-reservation">	
									<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
									<div class="dogtype">
										<p class="type_text" align="center">대형견</p>
										<p class="kg" align="center">25kg 이상</p>
									</div>										
									<p class="price_text price_text--large">${profile.price_Large } 원 / 1시간</p>
								</div>
								<div class="number-reservation" align="center">
									<img width="25px" align="left" onclick="subnumber('large')" src="/resources/images/petsitting/calendar_before.png">
									<p class="num-large">0</p> 
									<img width="25px" align="right" onclick="addnumber('large')" src="/resources/images/petsitting/calendar_next.png">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="schedule-reservation">
					<div class='Calendar-reservation pt-5'>
						<div class="reserved-date--text">
							<h4 class="start-date--text"></h4>
							<h4 class="end-date--text"></h4>
						</div>	
						<div class="dateTime">
							<div class="dateTime-text">
								<button type="button" onclick="timeClick.reselect()">뒤로</button>
								<p class="time-setting"> 시간 설정 </p>
							</div>
							<div class="APMDiv">
								<button type="button" class="APM" onclick="timeClick.apm('am')">오 전</button>
								<button type="button" class="APM" onclick="timeClick.apm('pm')">오 후</button>
							</div>
							<div class="time-reservation">
								<!-- 시간 출력 div -->
								<!-- <script>timeClick.apm('default')</script> -->
							</div>
						</div>
						<div class="closedDiv">
							<c:forEach items="${ closed}" var="closed" varStatus="status">
								<c:set var="id" value="${id+1 }"></c:set>
								<input type="hidden" class="closed${id }" value="${closed.schedule_Closed }">
							</c:forEach>
						</div>							
						<!-- <        > -->
						<div class="calender-div">
							<div align='center' class="CalendarMonth">
								<img width="35px" class="imgbtn" onclick="calendar.calendarYearMonth('before')" src="/resources/images/petsitting/calendar_before.png">
								<h3 class='CalendarMonth_small'></h3>
								
								<img width="35px" class="imgbtn" onclick="calendar.calendarYearMonth('next')" src="/resources/images/petsitting/calendar_next.png">
							</div>
								
							<div align='center' class="DayOfTheWeek">
								<ul class="DayOfTheWeek_ui">
									<li class="DayOfTheWeek_li"><small>일</small></li>
									<li class="DayOfTheWeek_li"><small>월</small></li>
									<li class="DayOfTheWeek_li"><small>화</small></li>
									<li class="DayOfTheWeek_li"><small>수</small></li>
									<li class="DayOfTheWeek_li"><small>목</small></li>
									<li class="DayOfTheWeek_li"><small>금</small></li>
									<li class="DayOfTheWeek_li"><small>토</small></li>
								</ul>
							</div>
						<div align='center' class='CalendarDayDiv'></div>
						</div>
						<div id="askldlka">
						
						</div>
						<hidden class='CalendarMonth'></hidden>
						<hidden class='CalendarYear'></hidden>
						<input type='hidden' class='price-small' value="${profile.price_Small }">
						<input type='hidden' class='price-medium' value="${profile.price_Medium }">
						<input type='hidden' class='price-large' value="${profile.price_Large }">
						
					</div>
				</div>
			</div>
			<div class='price_contents-div' align='center'>
				<h2 class='total_amount_text' align='center'>0</h2>		
			
				<div class='paymentbtn'>
					<svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="goo">
					  <defs>
					    <filter id="goo">
					      <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur" />
					      <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="goo" />
					      <feComposite in="SourceGraphic" in2="goo"/>
					    </filter>
					  </defs>
					</svg>
					
					<span class="bubblebtn--bubble__container">
					  <input type='submit' onclick="reservation_Payment()" class="bubblebtn bubblebtn--bubble" value="예 약">
					  <span class="bubblebtn--bubble__effect-container">
					    <span class="circle top-left"></span>
					    <span class="circle top-left"></span>
					    <span class="circle top-left"></span>
					
					    <span class="bubblebtn effect-bubblebtn"></span>
					
					    <span class="circle bottom-right"></span>
					    <span class="circle bottom-right"></span>
					    <span class="circle bottom-right"></span>
					  </span>
					</span>
				</div>
	
			</div>
			<div class="btn-reservation">
				<form action='' name='confirm' method='post'>
					<input type="hidden" name='member_ID' value='${customers.member_id }'>
					<input type="hidden" name='sitter_ID' value='${profile.member_ID }'>
					<input type="hidden" class='startDate' name='start_Date'>
					<input type="hidden" class='startTime' name='start_Time'>
					<input type="hidden" class='endDate' name='end_Date'>
					<input type="hidden" class='endTime' name='end_Time'>
					<input type='hidden' class='temp_price' value='0'>
					<input type="hidden" class='total_amount--hidden' name='total_amount' value='0'>
				</form>
				
			</div>
			<div class="backbtn" align="center">
				<button type="button" onclick="reservation()" class="btn btn-secondary">
					<p class="reservtext">X</p>
				</button>
			</div>
		</div>
    
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/beagle_dog_running992831.jpg'); transform: translate3d(0px, 0px, 0px);"></div>
        
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto" style='left: 13%'>
                          <div class="profile">
                                <div class="avatar text-center" style="height: 120px;">
                                    <img src="https://www.dingpet.shop/img/${profile.profile_PicName }" alt="Circle Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <div class="wrap-star">
							   		<div class='star-rating'>
								   		<c:set var="starper" value="${profile.profile_Star*20}%" />
					    		   		<span style ="width:${profile.profile_Star*20}%"></span>
				    				</div>        
				    				<span style="position: right; margin: 0px;">${profile.profile_Star}/5.0</span>	
								</div>
                                <div class="name text-center" style="margin-top: -10px;">
                                    <h4 class="title">${profile.member_NickName }</h4>
                                    <h6>${profile.profile_Title }</h6>
                                </div>
                           </div>
                        </div>
                        <div class="btn_div" style="height:65px">
							<ul class="list-inline text-center">
								<li class="list-inline-item" style="padding: 0.5rem; margin: 0;">
									<form action="../../chat/createRoom" method="post" >
		   								<input type='hidden' name='room_owner' id='room_owner' value='${customers.member_id }' />    
		   								<input type="hidden" name="roomName" id="roomName" value="예약 문의 합니다"/>
		   								<input type="hidden" name="roomMember" id="roomMember" value='${profile.member_ID }'/>
	      								<button type='submit' class="btn btn-primary">문의하기</button>
	      							</form>
								</li>
								<li class="list-inline-item" style="padding: 0.5rem;">
									<button type="button" onclick="reservation()" class="btn btn-secondary"><p class="reservtext">예약하기</p></button>
								</li>
							</ul>
                        </div>
                      </div>
                    <div class="description text-center">
                        <p>${profile.profile_Content }</p>
                    </div>
                    <div class="service_warp">
						<div class="service_list" style="padding:10px">
						  <h2 class="service_h2">이 용 가 능 서 비 스</h2>
						  <div class="service_box">
						  	<c:if test="${profile.service_00 == 'Y' }">
						    <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet1.png">
						      <div class="service_txtbox">
						        <p class="service_txth1">매일 산책</p>
						        <p class="service_txth2">산책 및 실외 배변 가능</p>
						      </div>
						    </div>
						    </c:if>
						  	<c:if test="${profile.service_01 == 'Y' }">
						    <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet2.png">
						      <div class="service_txtbox">
						        <p class="service_txth1">목욕 가능</p>
						        <p class="service_txth2">비용은 펫시터와 협의</p>
						      </div>
						    </div>
						    </c:if>
						  	<c:if test="${profile.service_02 == 'Y' }">
						    <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet3.png">
						      <div class="service_txtbox">
						        <p class="service_txth1">약물 복용</p>
						        <p class="service_txth2">경구(입) 약물 복용 가능</p>
						      </div>
						    </div>
						    </c:if>
						    <c:if test="${profile.service_03 == 'Y' }">
							    <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet4.png">
							      <div class="service_txtbox">
							        <p class="service_txth1">장기 예약</p>
							        <p class="service_txth2">14일 이상 돌봄 가능</p>
							      </div>
							    </div>
						    </c:if>
						    
						  	<c:if test="${profile.service_06 == 'Y' }">
						    <div class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet7.png">
						      <div class="service_txtbox">
						        <p class="service_txth1">집앞 픽업</p>
						        <p class="service_txth2">비용은 펫시터와 협의</p>
						      </div>
						    </div>
						    </c:if>
						    <c:if test="${profile.service_07 == 'Y' }">
						    <div  class="service_ico"><img width="32" height="32" src="/resources/images/icon/pet8.png">
						      <div class="service_txtbox">
						        <p class="service_txth1">실내 놀이</p>
						        <p class="service_txth2">터그놀이, 노즈워크 등</p>
						      </div>
						    </div>
						    </c:if>
						  </div>
						</div>
						
						<div class="service_list" style="padding:10px">
							<h2 class="service_h2">가 격 표</h2>
							<div class="price_box">
								<div class="price_type">
									<div class="price">
										<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
										<div class="dogtype">
											<p class="type_text" align="center">소형견</p>
											<p class="kg" align="center">10kg 미만</p>
										</div>
										<p class="price_text">${profile.price_Small } 원 / 1시간</p>
									</div>
									<div class="number" align="center">	
										<img width="25px" align="left" src="/resources/images/petsitting/calendar_before.png">
										<p class="num">1</p> 
										<img width="25px" align="right" src="/resources/images/petsitting/calendar_next.png">
									</div>
								</div>
								<div class="price_type">
									<div class="price">
										<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
										<div class="dogtype">
											<p class="type_text" align="center">중형견</p>
											<p class="kg" align="center">10kg ~ 25kg</p>
										</div>										
										<p class="price_text">${profile.price_Medium } 원 / 1시간</p>
									</div>
									<div class="number" align="center">
										<img width="25px" align="left" src="/resources/images/petsitting/calendar_before.png">
										<p class="num">1</p> 
										<img width="25px" align="right" src="/resources/images/petsitting/calendar_next.png">
									</div>
								</div>
								<div class="price_type">
									<div class="price">	
										<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
										<div class="dogtype">
											<p class="type_text" align="center">대형견</p>
											<p class="kg" align="center">25kg 이상</p>
										</div>										
										<p class="price_text">${profile.price_Large } 원 / 1시간</p>
									</div>
									<div class="number" align="center">
										<img width="25px" align="left" src="/resources/images/petsitting/calendar_before.png">
										<p class="num">1</p> 
										<img width="25px" align="right" src="/resources/images/petsitting/calendar_next.png">
									</div>
								</div>
							</div>
						</div>
					</div>
                    
                    <div class="service_warp">
						<div class="service_list" style="padding:10px">
							<h2 class="service_h2">펫 시 터 위 치</h2>
							<samll class="map_small">( ${profile.list_Address } )</small>
							<div class="map_box">
								<div id="map" style="width:500px;height:400px;"></div>
								<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=120117830cb36f64bd2dd6f74cd41ec0&libraries=services"></script>
								<script>
								    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
								        mapOption = {
								            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
								            level: 3 // 지도의 확대 레벨
								        };
								
								    //지도를 미리 생성
								    var map = new daum.maps.Map(mapContainer, mapOption);
								    //주소-좌표 변환 객체를 생성
								    var geocoder = new daum.maps.services.Geocoder();
								    //마커를 미리 생성
								    var marker = new daum.maps.Marker({
								        position: new daum.maps.LatLng(37.537187, 127.005476),
								        map: map
								    });
								
								    function sample5_execDaumPostcode(address) {

						                geocoder.addressSearch(address, function(results, status) {
						
					                        var result = results[0]; //첫번째 결과의 값을 활용
					
					                        // 해당 주소에 대한 좌표를 받아서
					                        var coords = new daum.maps.LatLng(result.y, result.x);
					                        // 지도를 보여준다.
					                        mapContainer.style.display = "block";
					                        map.relayout();
					                        // 지도 중심을 변경한다.
					                        map.setCenter(coords);
					                        // 마커를 결과값으로 받은 위치로 옮긴다.
					                        marker.setPosition(coords)
						                });
								    }
								</script>
								<script>sample5_execDaumPostcode('${profile.profile_JibunAddress}')</script>
							</div>
						</div>
						 
                    	<div class="service_list" style="padding:10px" align="center">
							<h2 class="service_h2" align="left" style="margin-bottom:5px" >스 케 쥴</h2>
							<div class='Calendar'>	
								<div class="closedDiv">
									<c:forEach items="${ closed}" var="closed" varStatus="status">
											<c:set var="id" value="${id+1 }"></c:set>
											<input type="hidden" class="closed${id }" value="${closed.schedule_Closed }">
									</c:forEach>
								</div>							
								<!-- <        > -->
								<div align='center' class="CalendarMonth">
									<img width="35px" class="imgbtn" onclick="calendar.calendarYearMonth('before2')" src="/resources/images/petsitting/calendar_before.png">
									<h3 class='CalendarMonth_small1'></h3>
									<hidden class='CalendarMonth1'></hidden>
									<hidden class='CalendarYear1'></hidden>
									<img width="35px" class="imgbtn" onclick="calendar.calendarYearMonth('next2')" src="/resources/images/petsitting/calendar_next.png">
								</div>
								
								<!-- <     2020-03     > -->
								<!-- <script>calendar.calendarYearMonth()</script> -->
									
								<div align='center' class="DayOfTheWeek">
									<ul class="DayOfTheWeek_ui">
										<li class="DayOfTheWeek_li"><small>일</small></li>
										<li class="DayOfTheWeek_li"><small>월</small></li>
										<li class="DayOfTheWeek_li"><small>화</small></li>
										<li class="DayOfTheWeek_li"><small>수</small></li>
										<li class="DayOfTheWeek_li"><small>목</small></li>
										<li class="DayOfTheWeek_li"><small>금</small></li>
										<li class="DayOfTheWeek_li"><small>토</small></li>
									</ul>
								</div>
								<div align='center' class='CalendarDayDiv1'>
									<!-- <script>calendar.calendarDay('none')</script> -->
								</div>
							</div>
						</div>
                    </div>
                    
                    <div class="licenseContainer">
	                    <div class="row justify-content-center">
							<div class="col-lg-6 text-center heading-section mb-5">
							  <div class="paws">
							    <span class="icon-paw"></span>
							  </div>
							  <h2 class="text-black mb-2">License</h2>
							</div>
						</div>
						<div class="licenseContainer" align="center">
							<div class="licenseDiv">
							<c:forEach items="${license }" var="license">
								<c:if test="${license.license_PicPath != null}">
								<div class="licensePic">
									<img width="150px" src="https://www.dingpet.shop/img/${license.license_PicPath }">
								</div>
								</c:if>
								<c:if test="${license.license_PicPath == null}">
								<div class="licensePic">
									<img width="150px" src="/resources/images/dogger_veterinary.svg">
								</div>
								</c:if>
								<div class="licenseDetail">
									<p class="license_txth1" align="left">자 격 증 명</p>
									<p class="license_txth2" align="left">${license.license_Name }</p>
									<p class="license_txth1" align="left">발 급 일 자</p>
									<p class="license_txth2" align="left">${license.license_Date }</p>
									<p class="license_txth1" align="left">발 급 기 관</p>
									<p class="license_txth2" align="left">${license.license_Agency }</p>
								</div>
							</c:forEach>
							</div>
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
							<!-- 
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_3.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_3.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_4.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_4.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_5.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_5.jpg" alt="Image" class="img-fluid"></a>                            
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_6.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_6.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_1.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_1.jpg" alt="Image" class="img-fluid"></a>
                              <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="/resources/images/dogger_img_sm_2.jpg" data-fancybox="gal"><img src="/resources/images/dogger_img_sm_2.jpg" alt="Image" class="img-fluid"></a>
                           -->
                           <c:forEach items="${gallery }" var="gallery">
								<a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="https://www.dingpet.shop/img/${gallery.act_Photo }" data-fancybox="gal"><img src="https://www.dingpet.shop/img/${gallery.act_Photo }" alt="Image" class="img-fluid"></a>
                           </c:forEach>
                          </div>
                        </div>
                      </section>
      
                    <!--====  End of Gallery  ====-->
                    <!--== start review ==-->
                    <div class="testimonials-wrap">
                        <div class="container container--review">
                            <div class="heading-section">
                                <span class="sub-heading">R E V I E W</span>
                                <h2>펫시터 이용 후기</h2>
                            </div>
                            <div class="carousel-testimonial owl-carousel">
                            	<c:forEach var="reviewlist" items="${review }">
                            	 	<div class="item">
                            	 	    <input type="hidden" class="exist" value="Y">
                            	 	
	                            		<div class="testimonial-box d-flex" style="min-height: 215px;">
	                                        <div class="user-img" style="background-image: url(https://www.dingpet.shop/img/${reviewlist.member_photo})">
	                                        </div>
	                                        <div class="text pl-4">
	                                            <span class="quote"><i class="fa fa-quote-left"></i></span>
	                                            <p class="review-content">${reviewlist.review_Content }</p>
	                                            <p class="name">${reviewlist.member_Nickname }</p>
	                                            <span class="position">${reviewlist_review_Star }</span>
	                                        </div>
	                                    </div>
                                    </div>
                            	</c:forEach>
                            	<!-- 
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
                    -->
                    <!--== end review ==-->  
                </div>
            </div>
        </div>
      </section>
    <!--====  end of contents  ====-->


<script src="${pageContext.request.contextPath}/resources/js/profilelookup.js?v=13"></script>

<script>timeClick.apm('default')</script>
<script>calendar.calendarYearMonth()</script>
<script>calendar.calendarDay('none')</script>
<script>calendar.calendarYearMonth()</script>
<script>calendar.calendarDay('none')</script>


<script src ="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/plugins/CSSPlugin.min.js"></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/easing/EasePack.min.js"></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenLite.min.js"></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TimelineLite.min.js"></script>

<!-- 예약 버튼 -->
<script>

$('.bubblebtn--bubble').each(function() {
	  var $circlesTopLeft = $(this).parent().find('.circle.top-left');
	  var $circlesBottomRight = $(this).parent().find('.circle.bottom-right');

	  var tl = new TimelineLite();
	  var tl2 = new TimelineLite();

	  var btTl = new TimelineLite({ paused: true });

	  tl.to($circlesTopLeft, 1.2, { x: -25, y: -25, scaleY: 2, ease: SlowMo.ease.config(0.1, 0.7, false) });
	  tl.to($circlesTopLeft.eq(0), 0.1, { scale: 0.2, x: '+=6', y: '-=2' });
	  tl.to($circlesTopLeft.eq(1), 0.1, { scaleX: 1, scaleY: 0.8, x: '-=10', y: '-=7' }, '-=0.1');
	  tl.to($circlesTopLeft.eq(2), 0.1, { scale: 0.2, x: '-=15', y: '+=6' }, '-=0.1');
	  tl.to($circlesTopLeft.eq(0), 1, { scale: 0, x: '-=5', y: '-=15', opacity: 0 });
	  tl.to($circlesTopLeft.eq(1), 1, { scaleX: 0.4, scaleY: 0.4, x: '-=10', y: '-=10', opacity: 0 }, '-=1');
	  tl.to($circlesTopLeft.eq(2), 1, { scale: 0, x: '-=15', y: '+=5', opacity: 0 }, '-=1');

	  var tlBt1 = new TimelineLite();
	  var tlBt2 = new TimelineLite();
	  
	  tlBt1.set($circlesTopLeft, { x: 0, y: 0, rotation: -45 });
	  tlBt1.add(tl);

	  tl2.set($circlesBottomRight, { x: 0, y: 0 });
	  tl2.to($circlesBottomRight, 1.1, { x: 30, y: 30, ease: SlowMo.ease.config(0.1, 0.7, false) });
	  tl2.to($circlesBottomRight.eq(0), 0.1, { scale: 0.2, x: '-=6', y: '+=3' });
	  tl2.to($circlesBottomRight.eq(1), 0.1, { scale: 0.8, x: '+=7', y: '+=3' }, '-=0.1');
	  tl2.to($circlesBottomRight.eq(2), 0.1, { scale: 0.2, x: '+=15', y: '-=6' }, '-=0.2');
	  tl2.to($circlesBottomRight.eq(0), 1, { scale: 0, x: '+=5', y: '+=15', opacity: 0 });
	  tl2.to($circlesBottomRight.eq(1), 1, { scale: 0.4, x: '+=7', y: '+=7', opacity: 0 }, '-=1');
	  tl2.to($circlesBottomRight.eq(2), 1, { scale: 0, x: '+=15', y: '-=5', opacity: 0 }, '-=1');
	  
	  tlBt2.set($circlesBottomRight, { x: 0, y: 0, rotation: 45 });
	  tlBt2.add(tl2);

	  btTl.add(tlBt1);
	  btTl.to($(this).parent().find('.bubblebtn.effect-bubblebtn'), 0.8, { scaleY: 1.1 }, 0.1);
	  btTl.add(tlBt2, 0.2);
	  btTl.to($(this).parent().find('.bubblebtn.effect-bubblebtn'), 1.8, { scale: 1, ease: Elastic.easeOut.config(1.2, 0.4) }, 1.2);

	  btTl.timeScale(2.6);

	  $(this).on('mouseover', function() {
	    btTl.restart();
	  });
});
	
	if($(".exist").val() != 'Y'){
		$(".container--review").append("<h2 align='center' style='display:block'>아직 등록된 리뷰가 없습니다.</h2>");
	}
	
</script>


<%@include file="../../includes/footer.jsp"%>
