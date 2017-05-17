import React, { Component } from "react"
import { Map, TileLayer, Marker, Popup } from 'react-leaflet'
import { connect } from 'react-redux'
import { filter, orderBy, minBy, maxBy } from 'lodash'

import { deselectPathway } from '../actions/pathways'
import Particularized from './particularized'
import Pathway from './pathway'
import ChurchMarker from './church_marker'

const classNames = require('classnames')

class PathwaysMap extends Component {
  _resetMap() {
    this.props.deselectPathway()
  }

  render() {
    const position = [44.2, -88.5]
    const zoom = 8
    const attribution = "© <a href='https://www.mapbox.com/about/maps/'>Mapbox</a> © <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> <strong><a href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a></strong>"
    const pathways = orderBy(this.props.pathways, ['position', 'name'])
    const particularizedChurches = filter(this.props.churches, 'particularized')
    const churchPlants = filter(this.props.churches, (church) => {
      return !!church.particularized_at == false && church.pathway_id
    })

    let churches = this.props.churches

    if (this.props.selectedPathway) {
      churches = filter(churches, { 'pathway_id': +this.props.selectedPathway.id })
    } else if (this.props.particularizedChurchesSelected) {
      churches = particularizedChurches
    }

    const markers = churches.map((church, index) => {
      let pathwayPosition = 0

      if (church.pathway_id) {
        if (church.pathway_id == pathways[0].id) {
          pathwayPosition = 1
        } else if (church.pathway_id == pathways[pathways.length - 1].id) {
          pathwayPosition = 3
        } else {
          pathwayPosition = 2
        }
      }

      return (
        <ChurchMarker key={index} church={church} position={pathwayPosition} />
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
        <div className="c-panel u-4/5 u-1/3@tablet u-padding">
          <div className="c-accordion">
            <h1 className="u-text-center u-margin-bottom-tiny">On Wisconsin PCA</h1>
            <p>The Wisconsin Presbytery consists of 8 particularized churches and 6 church plants and 3 RTS church planting students.</p>
            <ul className="o-list-bare">
              <Particularized churches={particularizedChurches} />
              {pathways.map((pathway, index) => {
                return (
                  <Pathway key={index} pathway={pathway} />
                )
              })}
            </ul>
          </div>
          {this.props.selectedPathway || this.props.particularizedChurchesSelected ?
              <a onClick={this._resetMap.bind(this)} className="c-btn c-btn--full u-margin-top">Show All</a> :
              ""}
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
    particularizedChurchesSelected: pathways.particularizedChurchesSelected,
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
