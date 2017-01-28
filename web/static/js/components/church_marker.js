import React, { Component } from "react"
import { Marker, Popup } from 'react-leaflet'

const classNames = require('classnames')

class ChurchMarker extends Component {
  render() {
    const { church } = this.props
    const markerPosition = [church.latitude, church.longitude]
    const markerClassNames = classNames({
      'c-marker': true,
      'c-marker--one': this.props.index == 1,
      'c-marker--two': this.props.index == 2,
      'c-marker--three': this.props.index == 3,
    })

    let iconUrl = 'map-marker.svg'

    if (church.pathway_id == 1) iconUrl = 'map-marker-blue.svg'
    if (church.pathway_id == 2) iconUrl = 'map-marker-orange.svg'
    if (church.pathway_id == 3) iconUrl = 'map-marker-red.svg'

    const icon = L.icon({
      iconUrl: "/images/" + iconUrl,
      iconSize: 35,
      className: 'c-marker',
    })

    return (
      <Marker
        className={markerClassNames}
        icon={icon}
        position={markerPosition}>
        <Popup>
          <div className="u-text-center">
            <h3>{church.name}</h3>
            <img src={church.logo} alt={church.name} />
          </div>
        </Popup>
      </Marker>
    )
  }
}

export default ChurchMarker
