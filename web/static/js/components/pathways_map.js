import React, { Component } from "react"
import { Map, TileLayer, Marker } from 'react-leaflet'
import { connect } from 'react-redux'
import { filter } from 'lodash'

import PathwaysButton from './pathways_button'

class PathwaysMap extends Component {
  render() {
    const position = [44.7844, -91.7879]
    const zoom = 7
    const attribution = "© <a href='https://www.mapbox.com/about/maps/'>Mapbox</a> © <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> <strong><a href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a></strong>"
    const churches = filter(this.props.churches, { 'stage': this.props.selectedStage })
    const markers = churches.map((church, index) => {
      const markerPosition = [church.latitude, church.longitude]

      return (
        <Marker key={index} position={markerPosition} />
      )
    })

    return (
      <div className="o-layout o-layout--flush o-layout--center">
        <div className="o-layout__item u-1/1">
          <Map
            className="c-map"
            center={position}
            zoom={zoom}>
            <TileLayer
              url="https://api.mapbox.com/styles/v1/timgremore/ciwgbl364007q2qoih4a4wb4a/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoidGltZ3JlbW9yZSIsImEiOiJtY01hT2lNIn0.jS2hKzkpWj83rJSrlOz6vg"
              attribution={attribution} />
            {markers}
            <div className="c-panel u-1/4 u-padding">
              <h1 className="u-text-center">Pathways</h1>
              <PathwaysButton label="Pathways One" stage="4" />
              <PathwaysButton label="Pathways Two" stage="3" />
              <PathwaysButton label="Pathways One" stage="2" />
              <PathwaysButton label="Particularized" stage="5" />
            </div>
          </Map>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  const { churches } = state

  return {
    churches: churches.items,
    selectedStage: churches.selectedStage,
  }
}

function mapDispatchToProps(dispatch) {
  return {}
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PathwaysMap)
