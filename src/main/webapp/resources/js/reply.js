/**
 * 
 */

//reply module
var replyService = (function(){
	//댓글 등록
	function write(reply, callback, error){
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset = utf-8",
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
		})
	}
	//댓글 목록
	function getList(param, callback, error){
		var board_id = param.board_id;
		var page = param.pageNum || 1;
		
		$.getJSON("/replies/pages/" + board_id + "/" + page + ".json",
				function(data){
					if(callback){
						callback(data);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
	}
	//댓글 삭제
	function remove(reply_id, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/' + reply_id,
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
	
	//댓글 수정
	function modify(reply, callback, error){
		console.log("reply_id : " + reply.reply_id);
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.reply_id,
			data : JSON.stringify(reply),
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
	
	//댓글 조회
	function view(reply_id, callback, error){
		$.get("/replies/" + reply_id + ".json", function(result){
			
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, er){
			if(error){
				error();
			}
		});
	}
	
	function formatDate(dateValue){
		var year = dateValue.substr(0,4);
		var month = dateValue.substr(4,2);
		var date = dateValue.substr(6,2);
		var hour = dateValue.substr(8,2);
		var minute = dateValue.substr(10,2);
		
		return [year, '/', month, '/', date, ' ', hour, ':', minute ].join('');
	};
	
	return {
		write : write,
		getList : getList,
		remove : remove,
		modify : modify,
		view : view,
		formatDate : formatDate
		};
})();
