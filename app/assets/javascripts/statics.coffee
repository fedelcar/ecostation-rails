$(window).load =>
  handler = Gmaps.build('Google')
  handler.buildMap { provider: {}, internal: {id: 'map'}}, () =>
    handler.addMarkers(Eco.markers)
    handler.getMap().setZoom(12)
    handler.getMap().setCenter({
      lat: -34.5908133,
      lng: -58.4501504
    })
