
	var onoff = false;
	var page = $('#page').val();
	var perPageNum = $('#perPageNum').val();

	function chatcon() {
        var chatBox = $('.chat-panel');
        var messageInput = $('input[name="msg"]');
        var roomNo = $('.content').data('room-no');
        var member = $('.content').data('member');
        var sock = new SockJS("/endpoint");
        var client = Stomp.over(sock);
        onoff = true;
        function sendmsg(){
        	roomNo = $('.content').data('room-no');
        	var message = messageInput.val();
            if(message == ""){
            	return false;
            }
            client.send('/app/'+ roomNo, {}, JSON.stringify({
            	message: message, writer: member
            	}
            ));
            
            messageInput.val('');
        }
        
        client.connect({}, function () {
        	roomNo = $('.content').data('room-no');
        	// 여기는 입장시
        	client.send('/app/join/'+ roomNo , {}, JSON.stringify({ writer: member})); 
//           일반메세지 들어오는곳         
            client.subscribe('/subscribe/chat/' + roomNo, function (chat) {
                var content = JSON.parse(chat.body);

                if(content.writer == $('.member_ID').val()){
                	var str=""
                	str += '<div class="no-gutters--right"><div class="offset-md-9">';
					str += '<div class="textBox-div--right"><div class="chat-bubble chat-bubble--right"><li style"word-break: break-all;">'+content.message;
					str += '</li></div></div><span class="chat-date">'+content.chatdate+'</span>';
					str += '</div></div>';
			       
                	chatBox.append(str);
                	chatBox.scrollTop(chatBox[0].scrollHeight);

                }else{
                	$('.user ul').empty();                	
                	var str=""
                    	str += '<div class="no-gutters--left"><div class="offset-md-9">';
    					str += '<div class="textBox-div--left"><div class="chat-bubble chat-bubble--left"><li style="word-break: break-all;">'+content.message;
    					str += '</li></div></div><span class="chat-date">'+content.chatdate+'</span>';
    					str += '</div></div>';
	
                    	chatBox.append(str);
                    	chatBox.scrollTop(chatBox[0].scrollHeight)
                }
                
                $(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);

            });
            
        });
//         대화시
        $('.send').click(function () {
            sendmsg();
        });
        
//        나가기
        $('.roomOut').click(function(){
        	roomNo = $('.content').data('room-no');
            if(member != null){
               $.ajax({
                  type : "get",
                  url : "/memberOut",
                  data :  {
                      userId : $('.roomOut').val(),
                      roomNo : roomNo
                   },// para 1/ -1
            
                  success:function(data){
                    	 viewList();                     
                  }// success
               });// ajax
               
            }
     });// click
      

	function closeConnection() {
		onoff = false;
	    sock.close();
	}

	function viewList(){
	
		alert('viewList');
		var url = "/chat/chatList";
		location.replace(url);
	}



	$(document).keydown(function(e) {
		key = (e) ? e.keyCode : event.keyCode;
	     
	    if (key == 116 || (key == 17 && key == 82) || ((key == 17 && key == 116))) {
	        if (e) {
	            e.preventDefault();
	           var conf = confirm('해당 페이지를 벗어나시겠습니까?');
	           if(conf){
	        	   viewList();
	           }else{
	        	   return false;
	           }
	           
	        }else {
	            event.keyCode = 0;
	            event.returnValue = false;
	        }
	    }else if(key == 13){
	    	sendmsg();
	    }
	   
	});

	history.pushState(null, document.title, location.href); 
	window.addEventListener('popstate', function(event) { 
		
		history.pushState(null, null, null); 
		viewList();
	});


	window.onbeforeunload = function() {
	
		var dat;
	
		$.ajax({
				url : "/memberOut",
				cache : "false", //캐시사용금지
				method : "get",
				data : { 
					userId: $('.roomOut').val(),
					roomNo: $('.content').data('room-no')
				},
				dataType: "html",
				async : false, //동기화설정(비동기화사용안함)
				
				success:function(args){ 
					dat = args;
					location.replace("/chat/chatList?page=" + page + "&perPageNum=" + perPageNum);	
				},   
		
				error:function(e){  
					alert(e.responseText);  
				}
	
		 });	
		
		 if(dat != 1){// 방 삭제가 안됐을 때만 send
			 client.send('/app/out/' + roomNo , {}, JSON.stringify({ writer: member}));
		 }
		 
		}

	}

function isOwner(roomNo, userId){
	alert(roomNo + userId);
	 $.ajax ({
	       type:'get',
	       url:'/isOwner',
	       data: {
	    	   roomNo : roomNo,
	    	   member : userId
	    	   },
	    	   
	       success:function(data) {
	          if (data == 1) {
	             updatePw(roomNo);
	          } else {
	             alert('방장 권한이 없습니다');
	             return false;
          }   
       }
    });

}

function updatePw(roomNo) {
	var input = confirm('삭제하시겠습니까 ?');
	
	$.ajax ({
	   type:'get',
	   url:'/updatePw',
	   data:  {
		   roomNo : roomNo,
		   newPass : input
		   },
	   success:function(data) {
	      if (data == 1) {
	         alert('비밀번호가 수정되었습니다')
	      } else {
	         alert('수정에 실패하셨습니다. 다시 시도해주세요');
	      }   
	   }
	});
}