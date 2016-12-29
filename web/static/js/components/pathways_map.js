import React, { Component } from "react"
import { Map, TileLayer, Marker } from 'react-leaflet'
import { connect } from 'react-redux'
import { filter } from 'lodash'

import { selectStage } from '../actions/churches'

class PathwaysMap extends Component {
  render() {
    const position = [44.7844, -87.0]
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
            zoomControl={true}
            scrollWheelZoom={false}
            zoom={zoom}>
            <TileLayer
              url="https://api.mapbox.com/styles/v1/timgremore/ciwgbl364007q2qoih4a4wb4a/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoidGltZ3JlbW9yZSIsImEiOiJtY01hT2lNIn0.jS2hKzkpWj83rJSrlOz6vg"
              attribution={attribution} />
            {markers}
            <div className="c-panel u-1/3 u-padding">
              <div className="c-accordion">
                <h1 className="u-text-center">Pathways</h1>
                <ul className="o-list-bare">
                  <li>
                    <input
                      type="checkbox"
                      value="4"
                      onChange={() => this.props.onStageClick(4)}
                      checked={this.props.selectedStage != 4} />
                    <i></i>
                    <h2 className="u-margin-bottom-none">Pathway One</h2>
                    <p>This is a description of Pathway One</p>
                  </li>
                  <li>
                    <input
                      type="checkbox"
                      value="3"
                      onChange={() => this.props.onStageClick(3)}
                      checked={this.props.selectedStage != 3} />
                    <i></i>
                    <h2 className="u-margin-bottom-none">Pathway Two</h2>
                    <p>This is a description of Pathway Two</p>
                  </li>
                  <li>
                    <input
                      type="checkbox"
                      value="2"
                      onChange={() => this.props.onStageClick(5)}
                      checked={this.props.selectedStage != 5} />
                    <i></i>
                    <h2 className="u-margin-bottom-none">Pathway One</h2>
                    <p>This is a description of Pathway One</p>
                  </li>
                </ul>
              </div>
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
  return {
    onStageClick: (stage) => {
      dispatch(selectStage(stage))
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PathwaysMap)
