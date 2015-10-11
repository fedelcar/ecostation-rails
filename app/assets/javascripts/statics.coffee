$(window).load ->
  handler = Gmaps.build('Google')
  stations = []
  $('.coords').each (index) ->
    stations.push
      lat: $(this).find('#lat').val()
      lng: $(this).find('#lng').val()
    return
  handler.buildMap { internal: id: 'map' }, ->
    markers = handler.addMarkers(stations)
    handler.bounds.extendWith markers
    handler.fitMapToBounds()
    return
  return
