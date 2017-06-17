import React, { Component } from "react"
import { Map, TileLayer, Marker, Popup } from 'react-leaflet'
import { connect } from 'react-redux'
import { filter, orderBy, minBy, maxBy } from 'lodash'

import { deselectPathway } from '../actions/pathways'
import ChurchMarker from './church_marker'
import PathwaysPanel from './pathways_panel';

const classNames = require('classnames')

class PathwaysMap extends Component {
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

      return <ChurchMarker key={church.id} church={church} position={pathwayPosition} />
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
        <PathwaysPanel
          particularizedChurches={particularizedChurches}
          particularizedChurchesSelected={this.props.particularizedChurchesSelected}
          pathways={pathways}
          selectedPathway={this.props.selectedPathway} />
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
