//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){

	$('.tos').on('click', function(){
		$(this).addClass('tos-display');
		$('.terms').find('p').removeClass('terms-closed').addClass('terms-expanded');	
	});

	$('.search-exp-click').on('click', function(){
		$(this).addClass('search-display');
		$('.search-exp').removeClass('search-exp').addClass('.search-exp-expanded');	
	});

	var expanded = 0; //false
	$('.search-query').keypress(function(event) {
		if(event.which == 13){
			var content = $(this).val();
			$('.user-list').each(function(){
				if( $(this).find('p').data('name') != content ){
					$(this).parent().slideUp();					
				}
			});
			expanded = 1;
		}
		else{
			if(expanded > 0){
				$('.user-list').each(function(){
					$(this).parent().slideDown();
				});
				expanded = 0;
			}
		}
	});

});