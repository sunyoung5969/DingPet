<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   		<div class="reservationDiv">
			<div class="profile-reservation">
 				<!-- 프로필 사진 -->
				<div class="profileIMGDiv-reservation" align="center">
					<img class="profileIMG-reservation" alt="Circle Image" src="/resources/images/dogger_img_big_1.jpg">
				</div>
				<!-- 프로필 자기소개 한줄 -->
				<div class="profile_h6Div-reservation" align="center">                       		
					<h6 class="profile_h6-reservation">${profile.profile_Content }</h6>
				</div>
				<div>
					<!-- 이용가능서비스 -->
                    <div class="service_warp-reservation">
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
			<div class="price-reservation-container">
				<div class="priceDiv-reservation" align="center">
					<h2 class="service_h2-reservation">이 용 요 금</h2>
					<div class="price_box">
						<div class="price_type-reservation">
							<div class="price-reservation" >
								<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
								<div class="dogtype">
									<p class="type_text" align="center">소형견</p>
									<p class="kg" align="center">10kg 미만</p>
								</div>
								<p class="price_text">${profile.price_Small } 원 / 1시간</p>
							</div>
							<div class="number-reservation" align="center">	
								<img width="25px" align="left" src="/resources/images/petsitting/calendar_before.png">
								<p class="num">1</p> 
								<img width="25px" align="right" src="/resources/images/petsitting/calendar_next.png">
							</div>
						</div>
						<div class="price_type-reservation">
							<div class="price-reservation">
								<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
								<div class="dogtype">
									<p class="type_text" align="center">중형견</p>
									<p class="kg" align="center">10kg ~ 25kg</p>
								</div>										
								<p class="price_text">${profile.price_Medium } 원 / 1시간</p>
							</div>
							<div class="number-reservation" align="center">
								<img width="25px" align="left" src="/resources/images/petsitting/calendar_before.png">
								<p class="num">1</p> 
								<img width="25px" align="right" src="/resources/images/petsitting/calendar_next.png">
							</div>
						</div>
						<div class="price_type-reservation">
							<div class="price-reservation">	
								<img src="https://petplanet.co/static/images/page_details/price_pet_small.png">
								<div class="dogtype">
									<p class="type_text" align="center">대형견</p>
									<p class="kg" align="center">25kg 이상</p>
								</div>										
								<p class="price_text">${profile.price_Large } 원 / 1시간</p>
							</div>
							<div class="number-reservation" align="center">
								<img width="25px" align="left" src="/resources/images/petsitting/calendar_before.png">
								<p class="num">1</p> 
								<img width="25px" align="right" src="/resources/images/petsitting/calendar_next.png">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="schedule-reservation">
				<div class='Calendar'>	
					<div class="closedDiv">
						<c:forEach items="${ closed}" var="closed" varStatus="status">
								<c:set var="id" value="${id+1 }"></c:set>
								<input type="hidden" class="closed${id }" value="${closed.schedule_Closed }">
						</c:forEach>
					</div>							
					<!-- <        > -->
					<div align='center' class="CalendarMonth">
						<img width="35px" class="imgbtn" onclick="calendar.calendarYearMonth('before')" src="/resources/images/petsitting/calendar_before.png">
						<h3 class='CalendarMonth_small'></h3>
						<hidden class='CalendarMonth'></hidden>
						<hidden class='CalendarYear'></hidden>
						<img width="35px" class="imgbtn" onclick="calendar.calendarYearMonth('next')" src="/resources/images/petsitting/calendar_next.png">
					</div>
					
					<!-- <     2020-03     > -->
					<script>calendar.calendarYearMonth()</script>
						
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
					<div align='center' class='CalendarDayDiv'>
						<script>calendar.calendarDay()</script>
					</div>
				</div>
			</div>
			<div class="btn-reservation">
				이용금액
				예약버튼
			</div>
		</div>

</body>
</html>