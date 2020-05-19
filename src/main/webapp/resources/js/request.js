//Request Module
var requestService = (function(){
	
	//해당 회원의 작성글 VO List 리턴
	function list(loggedIn_id, callback, error){
		$.get("/lost/myList/" + loggedIn_id + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, er){
			if(er){
				conosle.log(er + "회원별 작성글 list ajax 통신 중 에러 발생");
			}
		});
	}
	
	//요청 전송 POST 
	function sendRequest(requestData, callback, error){
		$.ajax({
			type : 'POST',
			url : '/lost/sendRequest',
			data : JSON.stringify(requestData),
			contentType : "application/json; charset = utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				alert(status + '요청 전송 중 에러발생');
			}
		});
	}
	
	
	//특정 글에 대한 요청 글 목록 가져오기
	function getRequestList(board_id, callback, error){
		$.get('/lost/request/' + board_id + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, er){
			if(er){
				console.log(er + '요청글 list ajax 통신 중 에러 발생');
			}
		});
	}
	
	//요청 삭제
	function deleteRequest(request_id, callback, error){
		$.ajax({
			type : 'delete',
			url : '/lost/deleteRequest/' + request_id,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function confirmRequest(ids, callback, error){
		
		$.ajax({
			type : 'put',
			url : '/lost/confirmRequest/' + ids.board_id + '/' +  ids.request_id,
			data : JSON.stringify(ids),
			contentType : "application/json; charset = uft-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	return{
		list : list,
		send : sendRequest,
		get : getRequestList,
		remove : deleteRequest,
		confirm : confirmRequest
	};
	
})();