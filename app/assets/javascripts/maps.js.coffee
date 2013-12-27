geocoder = undefined
map = undefined

gm_init = ->
  gm_center = new google.maps.LatLng(46.37, -79.92)
  gm_map_type = google.maps.MapTypeId.ROADMAP
  map_options = {center: gm_center, zoom: 10, mapTypeId: gm_map_type}
  geocoder = new google.maps.Geocoder()
  map = new google.maps.Map(@map_canvas,map_options);


encodeAddress = (address) ->
  geocoder.geocode
    address: address
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      all.push results[0].geometry.location
    else
      alert "Geocode was not successful for the following reason: " + status


$ ->
  map = gm_init()