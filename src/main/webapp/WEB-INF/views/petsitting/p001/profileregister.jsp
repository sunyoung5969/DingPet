<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.filebox{
		display: inline-block;
	}
	
	.filebox label {
	  display: inline-block;
	  padding: .5em .75em;
	  width:150px;
	  height: 240px;
	  color: #fff;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: graytext;
	  cursor: pointer;
	  border: 1px solid #4ca;
	  border-radius: .25em;
	  -webkit-transition: background-color 0.2s;
	  transition: background-color 0.2s;
	}
	
	.filebox label:hover {
	  background-color: gray;
	}
	
	.filebox label:active {
	  background-color: #367c36;
	}
	
	.filebox input[type="file"] {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  border: 0;
	}
	
	.form-group{
		position: absolute;
		display: inline-block;
		left: 210px;
	}
	
	.form-control{
		width: 450px;
	}
	
	.serviceimg {
	
		width: 50px;
	
	}
	
	.img-text{
		background-color: gray;
		position: relative;
		width: fit-content;
		top:-140px;
		left: 20%;
	}
	
	.check{
		position: relative;
		top: -15px;
    }
    
    .dogtype{
    
    	display: inline-block;
    }
    
	
	.Calendar {
	
		width: 300px;
	
	}
	
	.CalendarDayDiv--td { 
	
		padding: 0px;
	
	}
	
	.CalendarDayDiv--btn{
		border: 0px;
		width: 100%;
		background-color: transparent !important;
		color: #87CEEB;
		font-weight: bold;
	
	}
	
	.CalendarDayDiv--btndisabled{
		border: 0px;
		width: 100%;
		background-color: transparent !important;
		color: gray;
	
	}
	
	
	
	.DayOfTheWeek_li{
		display: inline-block;
		padding: 5px;
	}
	
	.DayOfTheWeek_ui{
	
		width: 300px;
		padding: 0px;
		margin: 0px;
	}

</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
	
	var calendar = {
			
		year : new Date().getFullYear(),
		month : (new Date().getMonth())+1,
		
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
					
					str += "<td align='center' class='CalendarDayDiv--td'><button class='"+classbtn+"' "+disabled+">"+(i+1)+"</button></td>";
					
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
				
				str += "<td align='center' class='CalendarDayDiv--td'><button name='"+i+"' value='"+(i+1)+"' class='"+classbtn+"' "+disabled+">"+(i+1)+"</button></td>";
				
				if((i-firstWeekDate)%7 == 6 && i > 6){
					str += "</tr>";
				}
			}
			
			document.getElementsByClassName("CalendarDayDiv")[0].innerHTML = str;
		}
	}
</script>

</head>
<body>
	<div>
		<h1>등록페이지입니당</h1>
	</div>
	<form>
		<div class="filebox">
			<label for="ex_file"><img style="width: 150px; height: 240px" src="https://i.imgur.com/wQojYBa.png">
				<div class="img-text"><p>사 진 등 록</p></div>
			</label>
			<input type="file" id="ex_file">
		</div>
		
		<div class="form-group">
			<label><h3>펫 시 터 소 개</h3></label>
			<textarea class="form-control" rows="13" name="content"></textarea>
		</div>
		<h3>이용가능서비스</h3>
		<table>
			<tr>
				<td rowspan="2"><input class="check" type="checkbox" name="장기예약" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="노년케어" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="목욕가능" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="산책가능" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
			</tr>
			<tr>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
			</tr>
			<tr>
				<td rowspan="2"><input class="check" type="checkbox" name="약물복용" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="실내놀이" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="집앞픽업" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="퍼피케어" value="Y"><img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td><td><small><b>장기예약</b></small></td>
			</tr>
			<tr>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
			</tr>
		</table>
						
				
		<h3>가격표</h3>
		
		<table>
			<tr>
				<td><p class="dogtype">소형견</p></td>
				<td><img class="serviceimg" src="https://petplanet.co/static/images/page_details/price_pet_small.png"></td>
				<td><input type="text" name="small"></td>
			</tr>
			<tr>
				<td><p class="dogtype">중형견</p></td>
				<td><img class="serviceimg" src="https://petplanet.co/static/images/page_details/price_pet_small.png"></td>
				<td><input type="text" name="middle"></td>
			</tr>
			<tr>
				<td><p class="dogtype">대형견</p></td>
				<td><img class="serviceimg" src="https://petplanet.co/static/images/page_details/price_pet_small.png"></td>
				<td><input type="text" name="big"></td>
			</tr>
		</table>
		<h3>내 위치</h3>
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">
		<input type="text" id="sample4_extraAddress" placeholder="참고항목">
		
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
		
		<h3>휴무일</h3>
		
		<div class='Calendar'>
			<!-- <        > -->
			<div align='center' class="CalendarMonth">
				<button onclick="calendar.calendarYearMonth('before')"> < </button>
				<small class='CalendarMonth_small'></small>
				<hidden class='CalendarMonth'></hidden>
				<hidden class='CalendarYear'></hidden>
				<button onclick="calendar.calendarYearMonth('next')"> > </button>
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
		<input type="submit" value="등록">
		
		<a type="button" href="sitterlist">취소</a>
	</form>
	<button onclick="location.href=sitterlist">취소</button>

</body>
</html>