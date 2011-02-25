$(function() {	
	$('#nav > li').each(function(){
		$(this).hover(			
				function(){
					$(this).addClass('ie6hover');
				}
				,function(){
					$(this).removeClass('ie6hover');
				});
	});
});
