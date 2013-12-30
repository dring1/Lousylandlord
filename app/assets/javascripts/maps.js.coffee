geocoder = null
map = null

gm_init = ->
  geocoder = new google.maps.Geocoder()
  if gon.addresses.length > 0
    gm_center = new google.maps.LatLng(gon.addresses[0].latitude, gon.addresses[0].longitude)
  else
    gm_center = encodeAddress(gon.city)
  gm_map_type = google.maps.MapTypeId.ROADMAP
  map_options = {center: gm_center, zoom: 13, mapTypeId: gm_map_type}
  map = new google.maps.Map(@map_canvas,map_options);

encodeAddress = (address) ->
  geocoder.geocode
    address: address
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      map.setCenter(results[0].geometry.location)
    else
      alert "Geocode was not successful for the following reason: " + status

displayAllMarkers = ->
  i = 0

  while i < gon.addresses.length
    coord = new google.maps.LatLng(gon.addresses[i].latitude, gon.addresses[i].longitude)
    new google.maps.Marker(
      map: map
      position: coord
    )
    i++

$ ->
  map = gm_init()
  displayAllMarkers()

root = exports ? this
root.centerMapOnCoordinates = (lat, long) ->
  map.setCenter(new google.maps.LatLng(lat, long));