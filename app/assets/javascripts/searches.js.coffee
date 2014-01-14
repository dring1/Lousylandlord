# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  #$('#city_city_id').parent().hide()
  cities = $('#city_city_id').html()
  $('#province_province_id').change ->
    province = $('#province_province_id :selected').text()
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(cities).filter("optgroup[label='#{escaped_province}']").html()
    if options
      $('#city_city_id').html(options)
      $('#city_city_id').parent().show()
    else
      $('#city_city_id').empty()
      $('#city_city_id').parent().hide()