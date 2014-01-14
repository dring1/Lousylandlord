# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  #$('#search_city_id').parent().hide()
  cities = $('#search_city_id').html()
  $('#search_province_id').change ->
    province = $('#search_province_id :selected').text()
    escaped_province = province.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(cities).filter("optgroup[label='#{escaped_province}']").html()
    if options
      $('#search_city_id').html(options)
      $('#search_city_id').parent().show()
    else
      $('#search_city_id').empty()
      $('#search_city_id').parent().hide()