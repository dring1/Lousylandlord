# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
	$('.address-form').hide()
	$('#address-form-toggle').click ->
		$('.address-form').toggle()
		$(document.body).animate({
		    'scrollTop':   $('.address-form').offset().top
		}, 2000)