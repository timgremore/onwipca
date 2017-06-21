import React, { Component } from "react"
import { connect } from 'react-redux'

import { deselectPathway } from '../actions/pathways'
import Particularized from './particularized'
import Pathway from './pathway'

const classNames = require('classnames')

class PathwaysPanel extends Component {
  _resetMap() {
    this.props.deselectPathway()
    this.props.closePanel()
  }

  render() {
    const {
      particularizedChurches,
      pathways,
      selectedPathway,
      particularizedChurchesSelected
    } = this.props

    const panelClassNames = classNames({
      'c-panel--open': !this.props.closed,
    })

    return (
      <div className={["c-panel", panelClassNames].join(' ')}>
        <div className="c-panel__menu">
          <a href="#0" onClick={this.props.togglePanel.bind(this)}>
            <img src="/images/ic_menu_black_24px.svg" width="24" />
          </a>
        </div>
        <div className="c-panel__body">
          <div className="c-accordion u-padding">
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
          {selectedPathway || particularizedChurchesSelected ?
              <a onClick={this._resetMap.bind(this)} className="c-btn c-btn--full u-margin-top">Show All</a> :
              ""}
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  const { } = state

  return { }
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
)(PathwaysPanel)
