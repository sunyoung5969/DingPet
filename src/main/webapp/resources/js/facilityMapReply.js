/**
 * 
 */

//reply module
var replyService = (function(){
	//댓글 등록
	function write(reply, callback, error){
		$.ajax({
			type : 'post',
			url : '/replymap/new',
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
		var site_id = param.site_id;
		var page = param.pageNum || 1;
		
		$.getJSON("/replymap/pages/" + site_id + "/" + page + ".json",
				function(data){
					if(callback){
						callback(data.replyCnt, data.list);
					}
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
	}
	//댓글 삭제
	function remove(review_id, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replymap/' + review_id,
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
		
		$.ajax({
			type : 'put',
			url : '/replymap/' + reply.review_id,
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
	function view(review_id, callback, error){
		$.get("/replymap/" + review_id + ".json", function(result){
			
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
