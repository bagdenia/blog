  ymaps.ready ->
    myMap = new (ymaps.Map)('map', {
      center: [
        55.751574
        37.573856
      ]
      zoom: 9
      controls: []
    })
    mySearchControl = new (ymaps.control.SearchControl)(
      options:
        noPlacemark: true)
    mySearchResults = new (ymaps.GeoObjectCollection)(null, hintContentLayout: ymaps.templateLayoutFactory.createClass('$[properties.name]'))
    myMap.controls.add mySearchControl

    window.myPlacemark = new (ymaps.Placemark)([
      55.754952
      37.615319
    ], {},
      draggable: true
      preset: 'islands#whiteStretchyIcon')
    myMap.geoObjects.add myPlacemark
    myMap.geoObjects.add mySearchResults
    mySearchResults.events.add 'click', (e) ->
      e.get('target').options.set 'preset', 'islands#redIcon'
      coord = e.get('target').geometry.getCoordinates()
      # alert  coord
      e.get('target').options.set 'visible', false
      window.myPlacemark.geometry.setCoordinates coord
      document.getElementById('coords').value = coord
      return
    myPlacemark.events.add 'dragend', (e) ->
      # Получение ссылки на объект, который был передвинут.
      thisPlacemark = e.get('target')
      # Определение координат метки
      coords = thisPlacemark.geometry.getCoordinates()
      # и вывод их при щелчке на метке
      thisPlacemark.properties.set 'balloonContent', coords
      document.getElementById('coords').value = coords
      return
    mySearchControl.events.add('resultselect', (e) ->
      index = e.get('index')
      mySearchControl.getResult(index).then (res) ->
        mySearchResults.add res
        return
      return
    ).add 'submit', ->
      mySearchResults.removeAll()
      return
  ymaps.ready init
