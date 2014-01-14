# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  #$('#landlord_city_id').parent().hide()
  cities = $('#landlord_city_id').html()
  $('#landlord_province_id').change ->
    province = $('#landlord_province_id :selected').text()
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(cities).filter("optgroup[label='#{escaped_province}']").html()
    if options
      $('#landlord_city_id').html(options)
      $('#landlord_city_id').parent().show()
    else
      $('#landlord_city_id').empty()
      $('#landlord_city_id').parent().hide()