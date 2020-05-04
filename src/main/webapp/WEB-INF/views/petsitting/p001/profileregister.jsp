<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileregister.css?v=8">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
	
	var calendar = {
			
		year : new Date().getFullYear(),
		month : (new Date().getMonth())+1,
		closed : new Array(),
		
		calendarYearMonth : function(event){
				
			if(event == null){
			
				$(".CalendarMonth").val(this.month);
				$(".CalendarYear").val(this.year);
				
				document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.month +'월' ;

			}else if(event == 'next'){
				
				event = null;
				this.month = $(".CalendarMonth").val();
				this.year = $(".CalendarYear").val();
				
				if(this.month == 12){
					this.month = 0;
					this.year *= 1;
					this.year += 1; 
				}
				
				this.month *= 1;
				this.month += 1;
				$(".CalendarMonth").val(this.month);
				$(".CalendarYear").val(this.year);
				
				document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.month +'월' ;
				this.calendarDay();
				
			}else if(event == 'before'){
					
					event = null
					this.month = $(".CalendarMonth").val();
					this.year = $(".CalendarYear").val();
					
					if(this.month == 1){
						this.month = 13;
						this.year -= 1; 
					}
					
				
					if(this.month == (new Date().getMonth())+1 && this.year == new Date().getFullYear()){
						
						this.month = (new Date().getMonth())+1;
						
					}else{		
						this.month -= 1;			
					}
					
					$(".CalendarMonth").val(this.month);
					$(".CalendarYear").val(this.year);
					
					//console.log(month);
					
					document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.month +'월' ;
					this.calendarDay();
			}
		},
			
		calendarDay : function(){
			
			var str = '';
			var yestermonth = this.month-1;
			var date = new Date(this.year, this.month, 0).getDate();
			var yestermonthDay = new Date(this.year, yestermonth, 0).getDay();
			var firstWeekDate = 0;
			var disabled = '';
			var classbtn = '';
			
			str += "<table>"
			
			if(this.month == (new Date().getMonth())+1 && this.year == new Date().getFullYear()){
				disabled = 'disabled';
				classbtn = 'CalendarDayDiv--btndisabled';
			}else{
				classbtn = 'CalendarDayDiv--btn';
			}
			
			if((6-yestermonthDay) != 0){
				str += "<tr>";
				
				for(var i=0; i<=yestermonthDay; i++){
					str += "<td></td>";
				}
				
				for(var i=0; i< 6-yestermonthDay; i++){
					
					if((i+1) > new Date().getDate()){
						disabled = '';
						classbtn = 'CalendarDayDiv--btn'
					}
					
					str +=  "<td align='center' class='CalendarDayDiv--td'>"+
							"<button type='button' onclick='calendar.closedDate(this)' class='"+classbtn+
							"' "+disabled+" value='"+this.year+"-"+this.month+"-"+(i+1)+"'>"+(i+1)+"</button></td>";
					
					firstWeekDate++;
				}
				
				str += "</tr><tr>";
			}
			
			for(var i=firstWeekDate; i<date; i++){
				
				if((i-firstWeekDate)%7 == 0 && i > 6){
					str += "<tr>"
				}
				
				if((i+1) > new Date().getDate()){
					disabled = '';
					classbtn = 'CalendarDayDiv--btn'
				}
				
				str +=  "<td align='center' class='CalendarDayDiv--td'>"+
						"<button type='button' onclick='calendar.closedDate(this)' class='"+classbtn+
						"' "+disabled+" value='"+this.year+"-"+this.month+"-"+(i+1)+"'>"+(i+1)+"</button></td>";
				
				if((i-firstWeekDate)%7 == 6 && i > 6){
					str += "</tr>";
				}
			}
			
			document.getElementsByClassName("CalendarDayDiv")[0].innerHTML = str;
		},
		
		closedDate: function(click){
			
			var closeddate = $(click).val();
			var cancel = false;
			 //$('.CalendarDayDiv--btn').css('background-color', 'blue');
			
			for(var i = 0; i < this.closed.length; i++){
				
				if(this.closed[i] == closeddate){
					var temp = this.closed[0];
					this.closed[0] = this.closed[i];
					this.closed[i] = temp;
					
					this.closed.shift();
					$(click).css('background-color', 'white');
					console.log($(click).val())
					cancel = true;
				}
				
			}
			
			if(!cancel){
				this.closed.push(closeddate);
				$(click).css('background-color', 'black');
				console.log($(click).val())
			}
		
		},
		
		closedSave: function(){

			var jsonstr = '{"closed":[';
			
<<<<<<< HEAD
			
			this.closed.sort();
			
=======
>>>>>>> refs/remotes/origin/master
			for(var i = 0; i < (this.closed).length; i++){
				
				jsonstr	+= '"' + this.closed[i] + '"';
				
				if(i != (this.closed).length -1){
					jsonstr += ', '
				}
				
			}
			
			jsonstr	+= ']}';
			/*
			console.log(jsonstr);
			
			var jsonparse = JSON.parse(jsonstr);
			
			console.log(jsonparse);
			
			$(".closedSave").val(jsonparse);
			*/
			$(".closedSave").val(jsonstr);

		}
		
	}
</script>

<!--====  str of contents  ====-->
    <section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/background/homepage-top.png'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
            <div class="profile-content">
                <div class="container pb-5">
                	<div class="row justify-content-center pt-3" data-aos="fade-up">
                        <div class="text-center heading-section">
                          <h2 class="text-black mb-2">등록페이지입니당</h2>
                        </div>
                    </div>
					<form action="/petsitting/p001/registerdata" method="post" enctype="multipart/form-data">
						<div class="info-part1">
							<input type="hidden" name="member_ID" value="${customers.member_id }">
							<div class="filebox">
								<label for="profilePic">
								<img id="preview_profile" style="width: 150px; height: 240px" src="">
								<div class="img-text"><p>사 진 등 록</p></div>
							</label>
							<input type="file" name="profilePic" id="profilePic" accept="image/*">
							
							<script>
							    var upload = document.querySelector('#profilePic');
							 	
							    upload.addEventListener('change',function (e) {
							   
							        //FileReader 객체 생성
							        var reader = new FileReader();
							        
							        // reader 시작시 함수 구현
							        reader.onload = function(aImg){
								        $("#preview_profile").attr("src", aImg.target.result)
							        }
							        reader.readAsDataURL(e.target.files[0])
							    })
							</script>
							</div>
							
							
							<div class="form-group">
								<label><h3>펫 시 터 소 개</h3></label>
								<textarea class="form-control" rows="8" name="profile_Content"></textarea>
							</div>
						</div>
						<div class="info-part2">
							<div class="info-part2--title">
								<h3>자격증</h3> 
							</div>
							<div class="info-part2--contents">
								<div class="filebox">
									<label for="licensePic"><img id="preview_license" style="width: 150px; height: 240px" src="">
										<div class="img-text"><p>자격증사진</p></div>
									</label>
									<input type="file" name="licensePic" id="licensePic" accept="image/*">
								</div>
								
								
								<script>
								    var upload = document.querySelector('#licensePic');
								 	
								    upload.addEventListener('change',function (e) {
								   
								        //FileReader 객체 생성
								        var reader = new FileReader();
								        
								        // reader 시작시 함수 구현
								        reader.onload = function(aImg){
									        $("#preview_license").attr("src", aImg.target.result)
								        }
								        reader.readAsDataURL(e.target.files[0])
								    })
								</script>
								
								<div class='license-info'>
									<table>
										<tr>
											<td><h5 class="license-info--title">자격증 명</h5>
											<input class="form-control" type="text" name="license_Name"></td>
										</tr>
										<tr>
											<td><h5 class="license-info--title">기관 명</h5>
											<input class="form-control" type="text" name="license_Agency"></td>
										</tr>
										<tr>
											<td><h5 class="license-info--title">취득날짜</h5>
											<input class="form-control" type="text" name="license_Date"></td>
										</tr>
									
									</table>
								</div>
							</div>
						</div>
						<div class="info-part3">
							<div class="info-part3--contents"><h3>이용가능서비스</h3> 
								<table>
									<tr>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_00" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet1.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>매일산책</b></div>
								                <p><small>산책 및 실외 배변 가능</small></p>
								              </div>
								            </div>
										</td>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_01" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet2.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>목욕 가능</b></div>
								                <p><small>비용은 펫시터와 협의</small></p>
								              </div>
								            </div>
										</td>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_02" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet3.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>약물 복용</b></div>
								                <p><small>경구(입) 약물 복용 가능</small></p>
								              </div>
								            </div>
										</td>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_03" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet4.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>장기 예약</b></div>
								                <p><small>14일 이상 돌봄 가능</small></p>
								              </div>
								            </div>
										</td>
									</tr>
		
									<tr>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_04" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet5.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>퍼피 케어</b></div>
								                <p><small>1년 미만 퍼피 돌봄 가능</small></p>
								              </div>
								            </div>
										</td>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_05" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet6.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>노견 케어</b></div>
								                <p><small>8년 이상 노견 돌봄 가능</small></p>
								              </div>
								            </div>
										</td>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_06" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet7.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>집앞 픽업</b></div>
								                <p><small>비용은 펫시터와 협의</small></p>
								              </div>
								            </div>
										</td>
										<td>
											<div class="media media-testimonial">
								              <div class="media-left">
								              	<input class="check form-control mt-4" type="checkbox" name="service_07" value="Y">
								                  <img class="serviceimg" src="/resources/images/icon/pet8.png">
								              </div>
								              <div class="media-body pl-3">
								                <div class="media-attribution"><b>실내 놀이</b></div>
								                <p><small>터그놀이, 노즈워크 등</small></p>
								              </div>
								            </div>
										</td>
									</tr>
									
								</table>
							</div>
						</div>				
						
						<div class="info-part4">
							<div class="tit_h3">가격표 </div>		
							<table>
								<tr>
									<td><div class="dogtype">소형견</div></td>
									<td><img class="serviceimg" src="/resources/images/icon/price_pet_small.png"></td>
									<td><input class="form-control d-inline-block mr-2 w-75" type="text" name="price_Small"> 원</td>
								</tr>
								<tr>
									<td><div class="dogtype">중형견</div></td>
									<td><img class="serviceimg" src="/resources/images/icon/price_pet_medium.png"></td>
									<td><input class="form-control d-inline-block mr-2 w-75" type="text" name="price_Medium"> 원</td>
								</tr>
								<tr>
									<td><div class="dogtype">대형견</div></td>
									<td><img class="serviceimg" src="/resources/images/icon/price_pet_large.png"></td>
									<td><input class="form-control d-inline-block mr-2 w-75" type="text" name="price_Large"> 원</td>
								</tr>
							</table>
						</div>
						
						<div class="info-part5">
							<div class="tit_h3">내 위치 <small>(가까운역이나 정류장 등 대략적인 위치를 입력해주세요)</small></div>
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<input class="form-control" type="text" id="sample4_postcode" name="profile_Postcode" placeholder="우편번호">
								</div>
								<div class="col-md-4 mb-3">
									<button class="btn btn-light" type="button" onclick="sample4_execDaumPostcode()">우편번호 찾기</button><br>
								</div>	
							</div>
							<div class="form-row">	
								<div class="w-25 col">
									<input class="form-control" type="text" id="sample4_roadAddress" name="profile_RoadAddress" placeholder="도로명주소">
								</div>
								<div class="pl-3">	
									<input class="form-control" type="text" id="sample4_jibunAddress" name="profile_JibunAddress" placeholder="지번주소">
								</div>
								<div>	
									<span id="guide" style="color:#999;display:none"></span>
								</div>
								<div class="pl-3">	
									<input class="form-control" type="text" id="sample4_detailAddress" name="profile_DetailAddress" placeholder="상세주소">
								</div>
								<div class="pl-3">	
									<input class="form-control" type="text" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목">
								</div>
								<input type="hidden" id="sigungu_bname" name="list_Address">
							</div>
						</div>
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
						    function sample4_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var roadAddr = data.roadAddress; // 도로명 주소 변수
						                var extraRoadAddr = ''; // 참고 항목 변수
						
						                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                    extraRoadAddr += data.bname;
						                }
						                // 건물명이 있고, 공동주택일 경우 추가한다.
						                if(data.buildingName !== '' && data.apartment === 'Y'){
						                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                }
						                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                if(extraRoadAddr !== ''){
						                    extraRoadAddr = ' (' + extraRoadAddr + ')';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample4_postcode').value = data.zonecode;
						                document.getElementById("sample4_roadAddress").value = roadAddr;
						                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
						                document.getElementById("sigungu_bname").value = data.sigungu +" "+data.bname;

						                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						                if(roadAddr !== ''){
						                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						                } else {
						                    document.getElementById("sample4_extraAddress").value = '';
						                }
						
						                var guideTextBox = document.getElementById("guide");
						                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						                if(data.autoRoadAddress) {
						                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
						                    guideTextBox.style.display = 'block';
						
						                } else if(data.autoJibunAddress) {
						                    var expJibunAddr = data.autoJibunAddress;
						                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
						                    guideTextBox.style.display = 'block';
						                } else {
						                    guideTextBox.innerHTML = '';
						                    guideTextBox.style.display = 'none';
						                }
						            }
						        }).open();
						    }
						</script>
						
						<div class="info-part6">
							<div class="tit_h3">휴무일 </div>	
						
							<div class='Calendar'>
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
								
								<div align='center'>
									<button class="btn btn-secondary" type="button" onclick="calendar.closedSave()">휴무일 저장</button>
								</div>
							</div>
						</div>
							
						<div class="text-center">
							<input type="hidden" class="closedSave" name="schedule_Closed">
							
							<input class="btn btn-primary" type="submit" value="등록">
							<input class="btn btn-secondary" type="button" onclick="location.href='sitterlist'" value="취소">
						</div>
					</form>
				</div>
			</div>
        </div>
      </section>
    <!--====  end of contents  ====--> 
<%@include file="../../includes/footer.jsp"%>