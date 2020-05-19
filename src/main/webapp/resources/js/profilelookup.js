// 기타 버튼 상호작용
 
function reservation(){
	$(".reservationDiv").slideToggle("slow", "swing");
}

function addnumber(size){
	
	var str = '';
	var price = '';
	var small_total = 0;
	var sum = parseInt($('.temp_price').val());
	var num = 0;
	var maxnum = 0;
	
	if(size == 'small'){
		
		maxnum += parseInt($('.num-small').text());
		maxnum += parseInt($('.num-medium').text());
		maxnum += parseInt($('.num-large').text());
		
		if(maxnum < 6){
			
			$('.total_amount_text').text(0);
			
			num += parseInt($('.num-small').text());
			
			num += 1;
			$(".num-small").text(num);
			
			price = parseInt($('.price-small').val());
			
			sum += price;
			
			price *= num;
			small_total = price;
			
			$('.temp_price').val(sum);

			str += numberWithCommas(price);
			str += ' 원 / 1시간';
			
			$('.price_text--small').empty(str);
			$('.price_text--small').append(str);
		}
		
	}else if(size == 'medium'){

		maxnum += parseInt($('.num-small').text());
		maxnum += parseInt($('.num-medium').text());
		maxnum += parseInt($('.num-large').text());
		
		if(maxnum < 6){
			
			$('.total_amount_text').text(0);

			num = parseInt($('.num-medium').text());
			num += 1;
			$(".num-medium").text(num);
			
			price = parseInt($('.price-medium').val());
			sum += price;
			price *= num;
			
			$('.temp_price').val(sum);
			
			str += numberWithCommas(price);
			str += ' 원 / 1시간';
			
			$('.price_text--medium').empty(str);
			$('.price_text--medium').append(str);
			
		}		
		
	}else if(size == 'large'){
		
		maxnum += parseInt($('.num-small').text());
		maxnum += parseInt($('.num-medium').text());
		maxnum += parseInt($('.num-large').text());
		
		if(maxnum < 6){
			
			$('.total_amount_text').text(0);
			
			num = parseInt($('.num-large').text());
			num += 1;
			$(".num-large").text(num);
			
			price = parseInt($('.price-large').val());
			sum += price;
			price *= num;
			
			$('.temp_price').val(sum);
			
			str += numberWithCommas(price);
			str += ' 원 / 1시간';
			
			$('.price_text--large').empty(str);
			$('.price_text--large').append(str);
			
		}
		
	}
	
}

function subnumber(size){
	
	var str = '';
	var price = '';
	var sum = parseInt($('.temp_price').val());
	var num = '';
	
	if(size == 'small'){
		
		num = parseInt($('.num-small').text());
		
		if(num > 0){
			
			$('.total_amount_text').text(0);
			
			num -= 1;
			$(".num-small").text(num);
			
			price = parseInt($('.price-small').val());
			sum -= price;
			price *= num;
			
			$('.temp_price').val(sum);
			
			str += numberWithCommas(price);
			str += ' 원 / 1시간';
			
			$('.price_text--small').empty(str);
			$('.price_text--small').append(str);
			
		}
		
	}else if(size == 'medium'){
		
		num = parseInt($('.num-medium').text());
		
		if(num > 0){
			
			$('.totla_amount_text').text(0);
			
			num -= 1;
			$(".num-medium").text(num);
			
			price = parseInt($('.price-medium').val());
			sum -= price;
			price *= num;
			
			$('.temp_price').val(sum);
			
			str += numberWithCommas(price);
			str += ' 원 / 1시간';
			
			$('.price_text--medium').empty(str);
			$('.price_text--medium').append(str);
			
		}
		
	}else if(size == 'large'){
		
		num = parseInt($('.num-large').text());
		
		if(num > 0){
			
			$('.total_amount_text').text(0)
			
			num -= 1;
			$(".num-large").text(num);
			
			price = parseInt($('.price-large').val());
			sum -= price;
			price *= num;
			
			$('.temp_price').val(sum);
			
			str += numberWithCommas(price);
			str += ' 원 / 1시간';
			$('.price_text--large').empty(str);
			$('.price_text--large').append(str);
			
		}
		
	}
		
}

function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//---------------------------------------------------------------------------------

// 예약 결제 팝업
function reservation_Payment(){
	
	var popupX = (window.screen.width/2) - 250;
	// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height/2) - 360;
	// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
	
	var popup = window.open('','payviewer', 'width=500,height=549, left ='+ popupX +', top='+popupY);
	var frm = document.confirm;
	frm.action = '/petsitting/p002/reservation';
	frm.target ="payviewer";
	frm.method ="post";
	frm.submit();
}

function closedPopup(){
	opener.location.href = "/petsitting/p002/reservationlist";
    window.close();
}

//----------------------------------------------------------------------------------

// 시간
	var timeClick = {
		
		// 예약 시간 DOM 설정
		apm : function(apm){
			
			var str = '';
			var time = '';
			
			str += "<table>"
			
			if(apm == 'am'){
				
				for(var i=0; i<12; i++){
					
					time = this.addzero(i, 2);
	
					if( i%3 == 0){
						str += "<tr>";
					}
					
					str += "<td class='time'><button type='button' onclick='timeClick.timeSelect(this)' class='time-btn' value='"+time+"'><p class='time-text'>"+time+" : 00</p></td>"
					if( i%3 == 2){
						str += "</tr>"
					}
				}
			
			}else if(apm == 'pm' || apm == 'default'){
				
				for(var i=12; i<24; i++){
					
					time = this.addzero(i, 2);
					
					if( i%3 == 0){
						str += "<tr>";
					}
					
					str += "<td class='time'><button type='button' onclick='timeClick.timeSelect(this)' class='time-btn' value='"+time+"'> <p class='time-text'>"+time+" : 00</p></button></td>"
					
					if( i%3 == 2){
						str += "</tr>"
					}
				}
			}
			$(".time-reservation").empty();
			$(".time-reservation").append(str);
		
		},
	
		// 0 추가
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
			
		},
	
		// 예약 날짜, 시간 저장
		timeSelect : function(event){
			
			if($(".num-small").text()=='0' && $(".num-medium").text()=='0' && $(".num-large").text()=='0'){
				alert("맡기실 강아지를 먼저 선택해주세요")
				return
			}
			
			var time = $(event).val();
	
			if($(".startDate").val() != '' && $(".startTime").val() == ''){
			// 시작시간 설정
				
				$(".startTime").val(time);	// 시작시간 저장
				$(".start-date--text").empty();
				$(".end-date--text").empty();
				$(".start-date--text").text("시 작 : "+$(".startDate").val() +" "+ $(".startTime").val()+":00")
				
			}else if($(".startDate").val() == $(".endDate").val() && $(".startTime").val() >= time){
			// 같은날에 시작시간보다 종료시간이 이를때
			
				$(".endDate").val('');		// 종료일 초기화
				$(".startTime").val(time);	// 선택한시간을 시작시간으로 변경
				$(".start-date--text").empty();
				$(".start-date--text").text("시 작 : "+$(".startDate").val() +" "+ $(".startTime").val()+":00")

			}else if($(".endDate").val() != '' && $(".endTime").val() == ''){
			// 종료시간 설정
				
				$(".endTime").val(time);	// 종료시간 저장
	
				var total_time = parseInt($(".endTime").val() - $(".startTime").val());
				var price = parseInt($(".temp_price").val());
				
				$(".end-date--text").text("종 료 : "+$(".endDate").val() +" "+ $(".endTime").val()+":00")

				price *= total_time;
				
				$(".total_amount--hidden").val(price);
				
				var price2 = Math.floor(price/10);
				var price1 = price-price2;

				var str = "돌봄 비용 \u00A0 " + numberWithCommas(price1) + 
						  " \u00A0\u00A0\u00A0\u00A0\u00A0 부가세 \u00A0 " + numberWithCommas(price2) +
						  " \u00A0\u00A0\u00A0\u00A0\u00A0 총 금액 \u00A0 "+ numberWithCommas(price);
				
				$(".total_amount_text").text(str);
	
			}
			
			$('.dateTime').css('display', 'none');
			$('.calender-div').css('display', 'inline-block');
		},
		
		// 예약시간 취소
		reselect : function(){
			
			if($(".startDate").val() != '' && $(".startTime").val() == ''){
				
				$(".startDate").val('');	// 시작날짜 초기화
				
			}else if($(".endDate").val() != '' && $(".endTime").val() == ''){
				
				$(".endDate").val('');		// 종료날짜 초기화
	
			}
			$('.dateTime').css('display', 'none');
			$('.calender-div').css('display', 'block');
		}
			
	}

//----------------------------------------------------------------------------------

// 달력
 

	var calendar = {
			
		state : false,
		year : new Date().getFullYear(),
		month : new Date().getMonth()+1,
		closed : new Array(),
		
		calendarYearMonth : function(event){
				
			if(event == null){
			
			$(".CalendarMonth").val(this.addzero(this.month, 2));
			$(".CalendarYear").val(this.year);
			
			$(".CalendarMonth1").val(this.addzero(this.month, 2));
			$(".CalendarYear1").val(this.year);
			
			if(!this.state){
				document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
			}else{
				document.getElementsByClassName("CalendarMonth_small1")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
			}
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
			$(".CalendarMonth").val(this.addzero(this.month, 2));
			$(".CalendarYear").val(this.year);
			
			document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
			this.calendarDay(false);
			
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
			
			$(".CalendarMonth").val(this.addzero(this.month, 2));
			$(".CalendarYear").val(this.year);
			

			document.getElementsByClassName("CalendarMonth_small")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
			this.calendarDay(false);

		}else if(event == 'next2'){
			
			event = null;
			this.month = $(".CalendarMonth1").val();
			this.year = $(".CalendarYear1").val();
			
			if(this.month == 12){
				this.month = 0;
				this.year *= 1;
				this.year += 1; 
			}
			
			this.month *= 1;
			this.month += 1;
			$(".CalendarMonth1").val(this.addzero(this.month, 2));
			$(".CalendarYear1").val(this.year);

			document.getElementsByClassName("CalendarMonth_small1")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
			this.calendarDay(true);

			
		}else if(event == 'before2'){
			
			event = null
			this.month = $(".CalendarMonth1").val();
			this.year = $(".CalendarYear1").val();
			
			if(this.month == 1){
				this.month = 13;
				this.year -= 1; 
			}
			
		
			if(this.month == (new Date().getMonth())+1 && this.year == new Date().getFullYear()){
				
				this.month = (new Date().getMonth())+1;
				
			}else{		
				this.month -= 1;			
			}
			
			$(".CalendarMonth1").val(this.addzero(this.month, 2));
			$(".CalendarYear1").val(this.year);
			
		
			document.getElementsByClassName("CalendarMonth_small1")[0].innerHTML = this.year + '년 ' + this.addzero(this.month, 2) +'월' ;
			this.calendarDay(true);

		}
	},
		
	calendarDay : function(tf){
		
		var str = '';
		var btnstr = '';
		var disabled = '';
		var yestermonth = this.month-1;
		var date = new Date(this.year, this.month, 0).getDate();
		var yestermonthDay = new Date(this.year, yestermonth, 0).getDay();
		var firstWeekDate = 0;
		var classDayDiv = '';
		var closedMonthArr = new Array();
		var closedDateArr = new Array();
		var closed ='';
		var classname ='';
		
		if(!tf){
			classname = ".CalendarMonth";
		}else if(tf){
			classname = ".CalendarMonth1";
		}
		
		for(var i=0; i<1000; i++){
			if($(".closed"+(i+1)).val() != undefined){
				var temp = (String)($(".closed"+(i+1)).val());
				closed = temp.split("-");
				closedMonthArr[i] = this.addzero(closed[1], 2);
				closedDateArr[i] = this.addzero(closed[2], 2);				
			}else{
				break;
			}
		}
		
		str += "<table>"
		btnstr += str;

		if(this.month == (new Date().getMonth())+1 && this.year == new Date().getFullYear()){
			disabled = 'disabled';
			classDayDiv = 'CalendarDayDiv--closed';
		}else{
			disabled = '';
			classDayDiv = 'CalendarDayDiv';
		}
		
		if((6-yestermonthDay) != 0){
			str += "<tr>";
			btnstr += "<tr>";
			
			for(var i=0; i<=yestermonthDay; i++){
				str += "<td class='CalendarDayDiv--td'></td>";
				btnstr += "<td class='CalendarDayDiv--td-reservation'></td>";
			}
			
			for(var i=0; i< 6-yestermonthDay; i++){		
				
				if((i+1) > new Date().getDate()){
					disabled = '';
					classDayDiv = 'CalendarDayDiv';
				}
				
				for(var j = 0; j < closedDateArr.length; j++){
					
					if(this.addzero((i+1), 2) == closedDateArr[j] && $(classname).val() == closedMonthArr[j]){
						disabled = 'disabled';
						classDayDiv = 'CalendarDayDiv--closed';
						break;
					}
				}
				
	
				str +=  "<td align='center' class='CalendarDayDiv--td'>"+
						"<p class='"+classDayDiv+"'>"+(i+1)+"</p></td>";
				
				btnstr += "<td align='left' class='CalendarDayDiv--td-reservation'>"+
						"<button type='button' onclick='calendar.dateSelect(this)' class='"+classDayDiv+
						"' "+disabled+" value='"+this.year+"-"+this.addzero(this.month, 2)+"-"+this.addzero((i+1), 2)+"'>"+(i+1)+"</button></td>";
				
				firstWeekDate++;
			}
			
			str += "</tr><tr>";
			btnstr += "</tr><tr>";
		}
		
		
		for(var i=firstWeekDate; i<date; i++){
			
			if((i-firstWeekDate)%7 == 0 && i > 6){
				str += "<tr>"
				btnstr += "<tr>"
			}
			
			if((i+1) > new Date().getDate() ){
				disabled = '';
				classDayDiv = 'CalendarDayDiv';
			}else if($(classname).val() != (new Date().getMonth())+1){
				disabled = '';
				classDayDiv = 'CalendarDayDiv';
			}
			
			for(var j = 0; j < closedDateArr.length; j++){
								
				if(this.addzero((i+1), 2) == closedDateArr[j] && $(classname).val() == closedMonthArr[j]){
					disabled = 'disabled';
					classDayDiv = 'CalendarDayDiv--closed';
					break;
				}
			}
			
			str +=  "<td align='center' class='CalendarDayDiv--td'>"+
			"<p class='"+classDayDiv+"'>"+(i+1)+"</p></td>";
			
			btnstr +=  "<td align='left' class='CalendarDayDiv--td-reservation'>"+
			"<button type='button' onclick='calendar.dateSelect(this)' class='"+classDayDiv+
			"' "+disabled+" value='"+this.year+"-"+this.addzero(this.month, 2)+"-"+this.addzero((i+1), 2)+"'>"+(i+1)+"</button></td>";
			
			if((i-firstWeekDate)%7 == 6 && i > 6){
				str += "</tr>";
				btnstr += "</tr>";
			}
		}			
		
		if(tf=='none' && !this.state){
			this.state = true;
			document.getElementsByClassName("CalendarDayDiv")[0].innerHTML = btnstr;
		}else if(tf=='none' && this.state){
			this.state = false;
			document.getElementsByClassName("CalendarDayDiv1")[0].innerHTML = str;
		}else if(!tf){
			document.getElementsByClassName("CalendarDayDiv")[0].innerHTML = btnstr;
		}else if(tf){
			document.getElementsByClassName("CalendarDayDiv1")[0].innerHTML = str;
		}
		
	},
	
	dateSelect : function(event){
		
		if($(".num-small").text()=='0' && $(".num-medium").text()=='0' && $(".num-large").text()=='0'){
			alert("맡기실 강아지를 먼저 선택해주세요")
			return
		}
		
		var date = $(event).val();
		
		if($(".startDate").val() == ''){
			
			$(".startDate").val(date);	// 시작날짜 설정
			
		}else if($(".startDate").val() > date){
		// 시작날짜보다 종료날짜가 이를 때
		
			$(".startDate").val(date);	// 시작날짜에 다시 저장
			$(".startTime").val('');	// 시작시간 초기화
			
		}else if($(".startDate").val() != '' && $(".endDate").val() == ''){
		// 종료날짜 설정
		
			$(".endDate").val(date);	// 종료날짜 저장
			
		}else if($(".startTime").val() != '' && $(".endTime").val() != ''){
		// 시작날짜, 시간, 종료날짜, 시간 모두 저장 되어있을 때
		
			$(".startDate").val(date);	// 시작날짜에 다시 저장
			$(".startTime").val('');	// 시작시간 초기화
			$(".endDate").val('');		// 종료날짜 초기화
			$(".endTime").val('');		// 종료시간 초기화
		}
		$(".calender-div").css('display', 'none')
		$(".dateTime").css('display', 'inline-block')

	},
	
	// 0 추가
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
	},
}

//----------------------------------------------------------------------------------
