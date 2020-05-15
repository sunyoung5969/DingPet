$(function(){
	
	//clone > list[0].hide > requests.append(clone)
	
	$(".arrow_next, .arrow_next_o").click(function(){
		var listItems = $(event.target).parents(".list_wrap").find('.requestListItem');
		
		var firstListItem = listItems.first();
		
		var firstClone = firstListItem.clone();
		firstListItem.remove();
		/*
		firstListItem.animate({
			left : '-=1000px'},"100", function(){
			$(this).remove();
		})*/
		
		$(event.target).parents(".list_wrap").find('.requests').append(firstClone);
	});
	
	$(".arrow_prev, .arrow_prev_o").click(function(){
		var listItems = $(event.target).parents(".list_wrap").find('.requestListItem');
		
		var lastListItem = listItems.last();
		
		var lastClone = lastListItem.clone();
		lastListItem.remove();
		
		$(event.target).parents(".list_wrap").find('.requests').prepend(lastClone);
	});
		
	
	
})