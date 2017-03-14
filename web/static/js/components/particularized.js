import React, { Component } from "react"
import { connect } from 'react-redux'

import { selectPathway } from '../actions/pathways'

class Pathway extends Component {
  render() {
    const { selectedPathway, particularizedChurchesSelected } = this.props

    return (
      <li>
        <input
          type="checkbox"
          value={0}
          onChange={() => this.props.onParticularizedClick(!particularizedChurchesSelected)}
          checked={particularizedChurchesSelected} />
        <i></i>
        <h3 className="u-margin-bottom-none">Particularized Churches</h3>
        <div>
          <p>This is a blub about particularized churches</p>
        </div>
      </li>
    )
  }
}

function mapStateToProps(state) {
  const { pathways } = state

  return {
    selectedPathway: pathways.selected,
    particularizedChurchesSelected: pathways.particularizedChurchesSelected,
  }
}

function mapDispatchToProps(dispatch) {
  return {
    onParticularizedClick: (showParticulariedChurches) => {
      dispatch(selectPathway(0, showParticulariedChurches))
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Pathway)

