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
	
	.wkrurwmd{
		display: inline-block;
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
		background-color: white;
		color: #87CEEB;
		font-weight: bold;
	
	}
	
	.CalendarDayDiv--btndisabled{
		border: 0px;
		width: 100%;
		background-color: white;
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

</head>
<body>
	<div>
		<h1>등록페이지입니당</h1>
	</div>
	<form action="/petsitting/p001/registerdata" method="post" enctype="multipart/form-data">
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
			<textarea class="form-control" rows="13" name="profile_Content"></textarea>
		</div>
		
		<h3> 자격증 </h3>
		<div>
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
			
			<div class='wkrurwmd'>
				<table>
					<tr>
						<td><h4>자격증 명</h4>
						<input type="text" name="license_Name"></td>
					</tr>
					<tr>
						<td><h5>기관 명</h5>
						<input type="text" name="license_Agency"></td>
					</tr>
					<tr>
						<td><h5>취득날짜</h5>
						<input type="text" name="license_Date"></td>
					</tr>
				
				</table>
			</div>
		</div>
		
		<h3>이용가능서비스</h3>
		<table>
			<tr>
				<td rowspan="2"><input class="check" type="checkbox" name="0" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="1" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="2" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="3" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
			</tr>
			<tr>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
				<td><small>장기돌봄 가능</small></td>
			</tr>
			<tr>
				<td rowspan="2"><input class="check" type="checkbox" name="4" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="5" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="6" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
				<td rowspan="2"><input class="check" type="checkbox" name="7" value="Y">
				<img class="serviceimg" src="https://i.imgur.com/EMu5v60.png"></td>
				<td><small><b>장기예약</b></small></td>
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
				<td><input type="text" name="price_Small"> 원</td>
			</tr>
			<tr>
				<td><p class="dogtype">중형견</p></td>
				<td><img class="serviceimg" src="https://petplanet.co/static/images/page_details/price_pet_small.png"></td>
				<td><input type="text" name="price_Medium"> 원</td>
			</tr>
			<tr>
				<td><p class="dogtype">대형견</p></td>
				<td><img class="serviceimg" src="https://petplanet.co/static/images/page_details/price_pet_small.png"></td>
				<td><input type="text" name="price_Large"> 원</td>
			</tr>
		</table>
		<h3>내 위치 (가까운역이나 정류장 등 대략적인 위치를 입력해주세요)</h3>
		
		<input type="text" id="sample4_postcode" name="profile_Postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" name="profile_RoadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" name="profile_JibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" name="profile_DetailAddress" placeholder="상세주소">
		<input type="text" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목">
		<input type="hidden" id="sigungu_bname" name="list_Address">
		
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
		<h3>휴무일</h3>
		
		<div class='Calendar'>
			<!-- <        > -->
			<div align='center' class="CalendarMonth">
				<button type="button" onclick="calendar.calendarYearMonth('before')"> < </button>
				<small class='CalendarMonth_small'></small>
				<hidden class='CalendarMonth'></hidden>
				<hidden class='CalendarYear'></hidden>
				<button type="button" onclick="calendar.calendarYearMonth('next')"> > </button>
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
				<button type="button" onclick="calendar.closedSave()">휴무일 저장</button>
			</div>
		</div>
		
		<input type="hidden" class="closedSave" name="closedSave">
		
		<input type="submit" value="등록">
		<button type="button" onclick="location.href='sitterlist'">취소</button>
	</form>

</body>
</html>