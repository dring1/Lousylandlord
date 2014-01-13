
geocoder = null
map = null
infowindows = null
lastWindow = null
blueIconLink = 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'

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
      #alert "Geocode was not successful for the following reason: " + status
      alert("Geocoder could not find the location")

displayAllMarkers = ->
  i = 0
  infowindows = new Array()
  bounds = new google.maps.LatLngBounds();
  while i < gon.addresses.length
    coord = new google.maps.LatLng(gon.addresses[i].latitude, gon.addresses[i].longitude)
    marker = new google.maps.Marker(
      map: map
      position: coord
      title: 'Landlord'
    )
    bounds.extend(coord)
    for landlord in gon.landlords
      if gon.addresses[i].landlord_id == landlord.id
        createInfoWindow(marker, "<div class=\"infowindow\" style=\"width:250px\">" + "<b>" + landlord.name + "</b><br>" + gon.addresses[i].number + " " + 
          gon.addresses[i].street + ", " + gon.city + "<br/>" + "<a href=\'/landlords/" + landlord.id + "\'>View " + 
          landlord.name + "\'s page</a><br/>" + "</div>")
    i++
    map.fitBounds(bounds)

createInfoWindow = (marker, text) ->
  infowindow = new google.maps.InfoWindow(
    content: text
    maxWidth: 300
  )
  infowindows.push(infowindow)
  google.maps.event.addListener marker, "click", ->
    lastWindow.close() if lastWindow
    lastWindow = infowindow
    infowindow.open marker.get("map"), marker

$ ->
  map = gm_init()
  displayAllMarkers()

root = exports ? this
root.centerMapOnCoordinates = (lat, long) ->
  map.setCenter(new google.maps.LatLng(lat, long));

root.displayLandmarkMarker = ->
  address = document.getElementById('place').value
  if infowindows == null
    infowindows = new Array()
  geocoder.geocode
    address: address
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      map.setCenter(results[0].geometry.location)
      center = map.getCenter()
      marker = new google.maps.Marker(
        map: map
        position: center
        title: address
      )
      marker.setIcon(blueIconLink)
      createInfoWindow(marker, "<b>" + address + "</b>")
    else
      alert("Geocoder could not find the location")
  