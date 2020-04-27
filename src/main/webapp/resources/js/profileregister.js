// 달력
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
		/*
		console.log(jsonstr);
		
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

// 우편번호
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


function fileupload(){
	
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
}
