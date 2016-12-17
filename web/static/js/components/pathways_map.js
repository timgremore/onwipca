import React, { Component } from "react"
import { Map, TileLayer } from 'react-leaflet'

class PathwaysMap extends Component {
  render() {
    const position = [51.0, -0.09]
    const zoom = 10
    const attribution = "© <a href='https://www.mapbox.com/about/maps/'>Mapbox</a> © <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> <strong><a href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a></strong>"

    return (
      <div>
        <Map
          style={{ width: '100vw', height: '400px' }}
          center={position}
          zoom={zoom}>
          <TileLayer
            url="https://api.mapbox.com/styles/v1/timgremore/ciwgbl364007q2qoih4a4wb4a/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoidGltZ3JlbW9yZSIsImEiOiJtY01hT2lNIn0.jS2hKzkpWj83rJSrlOz6vg"
            attribution={attribution} />
        </Map>
      </div>
    )
  }
}

export default PathwaysMap
