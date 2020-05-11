//헤더 알림 자바스크립트

$(document).ready(function(){
	console.log("려ㅛ려려려려")

	privilege();
})

function privilege(){
	console.log("356337437")

	var p_id = $(".privilege_id").val(); 
	
	if(p_id == '02' || p_id == '01' || p_id == '00'){
		console.log("타타타타")
		$("#headerreservedlist").attr("href", "${pageContext.request.contextPath}/petsitting/p002/reservationlist")
		
	}else{
		console.log("두랕타타타타")
		$("#headerreservedlist").attr('href', "${pageContext.request.contextPath}/customers/p001/signin")
		console.log($("#headerreservedlist").attr('class'))
	}
}

function noticeClick(){
	$.ajax({
		url : '/common/notice/getnotice',		// 알림 데이터 가져오기
		type : 'POST',
		data : {"member_id":$(".member_ID").val()},
		dataType: 'json',
		success : function(data) {
			
			var list = data.result;		// 가져온 알림 데이터 받기
			
			$(".tl_scroll").empty();	// 알림창 내용 비워주기
			
			for(var i=0; i<Object.keys(list).length;i++){
				if(list[i].confirm_Read == 'N'){	// 읽지 않은 알림이라면 읽음처리 해주는 컨트롤러로 매핑처리 && 읽지않은 css적용
					$(".tl_scroll").append('<a href="/common/notice/mappingurl?notice_Type='
											+list[i].notice_Type+'&member_ID='+$(".member_ID").val()
											+'"><div class="newnotice"><small class="notice-id">'
											+list[i].notice_Type+'</small><p class="notice-contents">'
											+list[i].notice_Contents+'</p><small class="send-date">'
											+list[i].send_Date+'</small></div></a>')
				}else{								// 읽은 알림이면 바로 주소 매핑 && 읽은알림 css적용
					$(".tl_scroll").append('<a href="/'+list[i].url
											+'"><div class="confirmnotice"><small class="notice-id">'
											+list[i].notice_Type+'</small><p class="notice-contents">'
											+list[i].notice_Contents+'</p><small class="send-date">'
											+list[i].send_Date+'</small></div></a>')
				}
			}						
		},
		error : function(err){
			alert('err');
		}
	});
		 					 
	$(".tl_box").slideToggle("slow", "swing");

}
				
function xClick(){
	$(".tl_box").slideToggle("slow", "swing");
}
			
