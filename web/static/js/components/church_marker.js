import React, { Component } from "react"
import { connect } from 'react-redux'
import { Marker, Popup } from 'react-leaflet'
import { find } from 'lodash'

import { selectPathway } from '../actions/pathways'

const classNames = require('classnames')

class ChurchMarker extends Component {
  _markerClicked() {
    const { church, pathways } = this.props
    const pathway = find(pathways, (item) => { return item.id == church.pathway_id })

    if (church.particularized) {
      this.props.selectPathway(0, true)
    } else if (pathway) {
      this.props.selectPathway(pathway, false)
    }
  }

  render() {
    const { church, position } = this.props
    const markerPosition = [church.latitude, church.longitude]
    const markerClassNames = classNames({
      'c-marker': true,
      'c-marker--one': position == 1,
      'c-marker--two': position == 2,
      'c-marker--three': position == 3,
    })

    let iconUrl = 'map-marker.svg'

    if (position == 1) iconUrl = 'map-marker-one.svg'
    if (position == 2) iconUrl = 'map-marker-two.svg'
    if (position == 3) iconUrl = 'map-marker-three.svg'

    const icon = L.icon({
      iconUrl: "/images/" + iconUrl,
      iconSize: 20,
      className: 'c-marker',
    })

    return (
      <Marker
        className={markerClassNames}
        icon={icon}
        onClick={this._markerClicked.bind(this)}
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

function mapStateToProps(state) {
  const { pathways } = state

  return {
    pathways: pathways.items,
  }
}

function mapDispatchToProps(dispatch) {
  return {
    selectPathway: (pathway, showParticularizedChurches) => {
      dispatch(selectPathway(pathway, showParticularizedChurches))
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ChurchMarker)
