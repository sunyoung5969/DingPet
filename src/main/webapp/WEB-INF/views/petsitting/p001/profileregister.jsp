<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../includes/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileregister.css?v=18">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
	
	var calendar = {
			
		year : new Date().getFullYear(),
		month : (new Date().getMonth())+1,
		closed : new Array(),
		cancel : false,
		
		calendarYearMonth : function(event){
				
			if(event == null){
			
				$(".CalendarMonth").val(this.month);
				$(".CalendarYear").val(this.year);
				
				document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;

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
				
				document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
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
					
					document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
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
							"' "+disabled+" value='"+this.year+"-"+this.addzero(this.month, 2)+"-"+this.addzero((i+1), 2)+"'>"+(i+1)+"</button></td>";
					
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
						"' "+disabled+" value='"+this.year+"-"+this.addzero(this.month, 2)+"-"+this.addzero((i+1), 2)+"'>"+(i+1)+"</button></td>";
				
				if((i-firstWeekDate)%7 == 6 && i > 6){
					str += "</tr>";
				}
			}
			
			document.getElementsByClassName("CalendarDayDiv")[0].innerHTML = str;
		},
		
		closedDate: function(click){
			
			var closeddate = $(click).val();
			 //$('.CalendarDayDiv--btn').css('background-color', 'blue');
			this.cancel = false;

			
			for(var i = 0; i < this.closed.length; i++){
			// 휴무일 저장 배열에 클릭한 날짜와 일치하면
			
				if(this.closed[i] == closeddate){		// 배열값과 클릭날짜가 같으면 0번째 인덱스값과 자리 변경
					//var temp = this.closed[0];
					//this.closed[0] = this.closed[i];
					//this.closed[i] = temp;
					
					this.closed.splice(i, 1);
					
					$(click).css('background-color', 'white');
					console.log($(click).val())
					this.cancel = true;			// 휴무일이 저장되어있는 배열안에 클릭날짜와 같은 데이터가 있었다
				}
				
			}
			
			if(!this.cancel){					// 휴무일이 저장되어있는 배열안에 클릭날짜와 같은 데이터가 없을 때
				this.closed.push(closeddate);	// 휴무일 추가
				$(click).css('background-color', 'black');
				console.log($(click).val())
			}
			
			console.log(this.closed.length);
			console.log(this.closed);
		
		},
		
		closedSave: function(){
			
			var savestr ="<div class='closed--savedDiv'>";
			var jsonstr = '{"closed":[';
			
			this.closed.sort();
			
			for(var i = 0; i < (this.closed).length; i++){
				if(this.closed.length < 15){
					savestr += "<h3 class='closed--h3'>"+this.closed[i]+"</h3>"

				}else{
					savestr += "<h4 class='closed--h4'>"+this.closed[i]+"</h4>"

				}
				jsonstr	+= '"' + this.closed[i] + '"';
				
				if(i != (this.closed).length -1){
					jsonstr += ', '
				}
				
			}
			
			savestr += "</div><div class='closed-saved--text'><h3 class='closed-saved-h3'>휴무일이 저장되었습니다.</h3></div>"
			jsonstr	+= ']}';
			
			console.log(jsonstr);
			/*
			var jsonparse = JSON.parse(jsonstr);
			
			console.log(jsonparse);
			
			$(".closedSave").val(jsonparse);
			*/
			$(".closedDiv").empty();
			$(".closedDiv").append(savestr);	// 뷰 출력용 문자열
			$(".closedSave").val(jsonstr);		// json 문자열

		},
		
		reset : function(){
			
			var resetstr = "<h3 class='closed-reset'>휴무일이 초기화 되었습니다.</h3>"
			
			$(".CalendarDayDiv--td button").css("background-color", '');
			$(".closedDiv").empty();
			$(".closedSave").val('');
			$(".closedDiv").append(resetstr);
			this.closed = [];	// 배열 비우기
			
		},
		
		addzero : function(num, digit){
			
			var zero = '';
			num = num.toString();
			
			if(num.length >= digit){
				return num;
			}else{
				
				for(var i = 0; i<(digit-num.length); i++){
					zero += '0';
				}
				
				zero += num;
				return zero;
			}
			
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
							<div class="info-part1--title">
								<h3>펫시터 소개</h3>
							</div>
							<div class="info-part1--contents">
								<div class="filebox">
									<h5 class="profile-pic-title"> 프로필 사진 </h5>
									<label for="profilePic">
										<img id="preview_profile" style="width: 170px" src="/resources/images/petsitting/default_image.png">
										<!-- <div class="img-text"><p>사 진 등 록</p></div> -->
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
									<div class='profile-info-titleDiv'>
										<h5 class="profile-info-title">한줄 소개 * </h5>
										<p align="right" class='bytesRemain'>( 0 / 100 ) Bytes</p>
									</div>
									<input class="form-control--title" type="text" name="profile_Title" maxlength="100" required><br>							
									
									<script>
										$(function(){
											
											$(".form-control--title").on('keyup', function() {
												var titleLength = $(".form-control--title").val().length;
												var str = '( ';
												
												if(titleLength < 100){
													
													str += titleLength;
													str += " / 100 ) Bytes";

													$(".bytesRemain").empty();
													$(".bytesRemain").append(str);
													
												}else{
													str += " 100 / 100 ) Bytes";

													$(".bytesRemain").empty();
													$(".bytesRemain").append(str);
													$(".bytesRemain").css('color', 'indianred');
											
												}
												

											})
											
										});
									</script>
									
									<h5 class="profile-info-title">상세 소개 *</h5>
									<textarea class="form-control--detail" rows="8" name="profile_Content" required></textarea>
								</div>
							</div>
						</div>
						<div class="info-part2">
							<div class="info-part2--title">
								<h3 class="register-h3">자격증</h3> 
							</div>
							<div class="info-part2--contents">
								<div class="filebox">
									<h5 class="profile-pic-title"> 자격증 사진 </h5>
									<label for="licensePic"><img id="preview_license" style="width: 170px" src="/resources/images/petsitting/default_image.png">
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
						<div class="info-part45">
							<div class="info-part4">
								<div class="tit_h3">가격표 </div>		
								<table>
									<tr>
										<td><div class="dogtype">소형견 (10kg 미만)</div></td>
										<td><input class="form-control d-inline-block mr-2 w-75" type="text" name="price_Small"> 원</td>
									</tr>
									<tr>
										<td><div class="dogtype">중형견 (10kg ~ 25kg)</div></td>
										<td><input class="form-control d-inline-block mr-2 w-75" type="text" name="price_Medium"> 원</td>
									</tr>
									<tr>
										<td><div class="dogtype">대형견 (25kg 이상)</div></td>
										<td><input class="form-control d-inline-block mr-2 w-75" type="text" name="price_Large"> 원</td>
									</tr>
								</table>
							</div>
							
							<div class="info-part5">
								<div class="tit_h3">내 위치 * <small class='location-info-text'>(가까운역이나 정류장 등 대략적인 위치를 입력해주세요)</small></div>
								
								<div class="form-row">	
									<div class="postnum">
										<div class="postnumdiv">
											<input class="form-control" type="text" id="sample4_postcode" name="profile_Postcode" placeholder="우편번호">
										</div>
										<div class="postnumbtndiv">
											<button class="btn btn-light" type="button" onclick="sample4_execDaumPostcode()">우편번호 찾기</button><br>
										</div>	
									</div>
									<div class='post-info-div' align="center">
										<div class="jibunAddress">	
											<input class="form-control" type="text" id="sample4_jibunAddress" name="profile_JibunAddress" placeholder="지번주소 *" required>
										</div>
										<div class="roadAddress">
											<input class="form-control" type="text" id="sample4_roadAddress" name="profile_RoadAddress" placeholder="도로명주소">
										</div>
									</div>
									<span id="guide" style="color: #999; display: none"></span> 
									
									<div class='post-info-div' align="center">
										<div class="detailAddress">	
											<input class="form-control" type="text" id="sample4_detailAddress" name="profile_DetailAddress" placeholder="상세주소">
										</div>
										<div class="reference">	
											<input class="form-control" type="text" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목">
										</div>
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
						</div>
						<div class="info-part6">
							<div class="tit_h3">휴무일 </div>	
								<div class="info-part6--contents">
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
										<button class="btn-closed" type="button" onclick="calendar.closedSave()">휴무일 저장</button>
										<button class="btn-closed--cancel" type="button" onclick="calendar.reset()">휴무일 초기화</button>
									</div>
								</div>
								<div class="closedDiv" align="center"></div>
							</div>
						</div>
						<div class='photo-gallery--container'>
							<h3>활동 사진</h3>
							<div class="photo-gallery--div">
								<div class='photo-gallery--btndiv' align="left">
									<label for="photo-gallery">
										<p class='photo-gallery--btn'>사진 첨부</p>
									</label>
									<input type='file' id='photo-gallery' name='photo-gallery' multiple="multiple" accept="image/*">
									<small>최대 50MB</small>
								</div>
								<div class="photo-gallery--preview"> <h3 align="center">등록된 사진이 아직 없습니다.</h3> </div>
							</div>
						</div>
						<input type='hidden' class='photo_gallery_json' name='photo_gallery'>
						
						<script>
							
							var gallery_files = [];
							var index =	gallery_files.length;
														
							$("#photo-gallery").on('change', function(e){
								
								$(".photo-gallery--preview > h3").text('');
								
								var files = e.target.files;
								var filesArr = Array.prototype.slice.call(files);
								var exist = false
								
								if(gallery_files.length > 0){ // 배열에 사진들이 들어가 있으면
									
									filesArr.forEach(function(f){

										for(var i = 0; i< gallery_files.length; i++){
											if(gallery_files[i].name == f.name){
												// 같은 이름이 존재하는지 추적
												
												exist = true;	// 이름이 같은파일이 존재하면 트루
												break;
											}
										}
									})
								}
								
								if(!exist){		// 중복 파일이 존재하지 않으면
									
									filesArr.forEach(function(f){
										
										gallery_files.push(f);
								        var reader = new FileReader();
										
								        // reader 시작시 함수 구현
								        reader.onload = function(e){
								        	var str = "<a href='javascript:void(0);' id='img_id_"+index+"' onclick=\"deleteImageAction("+index+ ", \'" 
								        			+f.name+"\' )\" ><img src='"+e.target.result+"' data-file='"+ f.name
								        			+ "' class='photo-gallery-images' name='"+f.name+"' title='Click to remove'></a>"
									        
								        	$(".photo-gallery--preview").append(str);
									        index++;
								        }
								        
								        reader.readAsDataURL(f);
								        
									})
									
								}else{
									alert("같은 이름의 파일이 이미 존재합니다.")
								}
								
								console.log(gallery_files);
								
							})
							
							function deleteImageAction(index, filename){
								
								for(var i =0; i<gallery_files.length; i++){	// 삭제할 사진 추적

									if(gallery_files[i].name.toString() == filename.toString()){
										// 배열에 저장됭있는 파일이름과 삭제할 파일의 이름과 같으면
										
										gallery_files.splice(i, 1);	// 삭제
										break;
									}
								}
								
								var img_id = "#img_id_"+index;	// 삭제할 태그 id 
								$(img_id).remove();				// 삭제
								
								console.log(gallery_files.length)
								
								if(gallery_files.length == 0){
									var str = "<h3 align='center'>등록된 사진이 아직 없습니다.</h3>"
									$(".photo-gallery--preview").append(str)
								}
								
							}
							
						//--------------------------데이터 POST 전송 AJAX --------------------
							
							function formsubmit(){
							
								var createForm = $("#create_form");
								var formData = new FormData(createForm[0]);	// form 연결
																
								for(var i = 0; i < gallery_files.length; i++){	// formData 파일 저장
									formData.append("files", gallery_files[i]);
								}
								
								var files_len = gallery_files.length;
								
								$.ajax({
									type : "POST",
									url : "/petsitting/p001/filessaved",
									data : formData,
									processData: false,
									contentType: false,
									success : function(data) {
										if(data.result){
											alert("앨범이 저장되었습니다.");
										}else{
											alert(data.result);
										}
									},
									err : function(err){
										alert(err.status);
									}
								});
							}
						</script>
						
						<div class="text-center">
							<input type="hidden" class="closedSave" name="schedule_Closed">
							
							<input class="btn btn-primary" type="submit" value="등록">
							<input class="btn btn-secondary" type="button" onclick="location.href='sitterlist'" value="취소">
						</div>
					</form>
					<form id="create_form" name="create_form" method="post" enctype="multipart/form-data">
						<button type="button" class="photo-gallery--btn photo-gallery--btn--saved" onclick="formsubmit()">저 장</button>
					</form>
					
				</div>
			</div>
        </div>
      </section>
    <!--====  end of contents  ====--> 
<%@include file="../../includes/footer.jsp"%>