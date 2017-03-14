import React, { Component } from "react"
import { Map, TileLayer, Marker, Popup } from 'react-leaflet'
import { connect } from 'react-redux'
import { filter, orderBy } from 'lodash'

import { deselectPathway } from '../actions/pathways'
import Particularized from './particularized'
import Pathway from './pathway'
import ChurchMarker from './church_marker'

const classNames = require('classnames')

class PathwaysMap extends Component {
  render() {
    const position = [44.7844, -88.0]
    const zoom = 7
    const attribution = "© <a href='https://www.mapbox.com/about/maps/'>Mapbox</a> © <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> <strong><a href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a></strong>"
    const pathways = orderBy(this.props.pathways, ['position', 'name'])
    const particularizedChurches = filter(this.props.churches, 'particularized_at')
    const churchPlants = filter(this.props.churches, (church) => {
      return !!church.particularized_at == false && church.pathway_id
    })

    let churches = this.props.churches

    if (this.props.selectedPathway) {
      churches = filter(churches, { 'pathway_id': +this.props.selectedPathway.id })
    }

    const markers = churches.map((church, index) => {
      return (
        <ChurchMarker key={index} church={church} index={index} />
      )
    })

    const map = (
      <Map
        className="c-map"
        center={position}
        zoomControl={true}
        scrollWheelZoom={false}
        zoom={zoom}>
        <TileLayer
          url="https://api.mapbox.com/styles/v1/timgremore/ciwgbl364007q2qoih4a4wb4a/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoidGltZ3JlbW9yZSIsImEiOiJtY01hT2lNIn0.jS2hKzkpWj83rJSrlOz6vg"
          attribution={attribution} />
        {markers}
        <div className="c-panel u-1/3 u-padding">
          <div className="c-accordion">
            <h1 className="u-text-center u-margin-bottom-tiny">On Wisconsin PCA</h1>
            <p>The Wisconsin Presbytery consists of {particularizedChurches.length} particularized churches and {churchPlants.length} church plants.</p>
            <ul className="o-list-bare">
              <Particularized />
              {pathways.map((pathway, index) => {
                return (
                  <Pathway key={index} pathway={pathway} />
                )
              })}
            </ul>
          </div>
        </div>
      </Map>
    )

    return (
      <div className="o-layout o-layout--flush o-layout--center">
        <div className="o-layout__item u-1/1">
          {map}
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  const { churches, pathways } = state

  return {
    churches: churches.items,
    selectedPathway: pathways.selected,
    pathways: pathways.items,
  }
}

function mapDispatchToProps(dispatch) {
  return {
    deselectPathway: () => {
      dispatch(deselectPathway())
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PathwaysMap)
