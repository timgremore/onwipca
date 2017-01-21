import React, { Component } from "react"
import { connect } from 'react-redux'

import { selectPathway } from '../actions/pathways'

class Pathway extends Component {
  render() {
    const { pathway, selectedPathway } = this.props

    return (
      <li>
        <input
          type="checkbox"
          value={pathway.id}
          onChange={() => this.props.onPathwayClick(pathway)}
          checked={selectedPathway.id == pathway.id} />
        <i></i>
        <h3 className="u-margin-bottom-none">{pathway.name}</h3>
        <div>
          <p className="u-margin-bottom-tiny">
            <strong>Church Planter Readiness:</strong><br />
            {pathway.readiness}
          </p>
          <p className="u-margin-bottom-tiny">
            <strong>Probable Location:</strong><br />
            {pathway.location}
          </p>
          <p className="u-margin-bottom-tiny">
            <strong>Training:</strong><br />
            {pathway.training}
          </p>
          <p className="u-margin-bottom-large">
            <strong>Sender:</strong><br />
            {pathway.sender}
          </p>
        </div>
      </li>
    )
  }
}

function mapStateToProps(state) {
  const { pathways } = state

  return {
    selectedPathway: pathways.selected,
    pathways: pathways.items,
  }
}

function mapDispatchToProps(dispatch) {
  return {
    onPathwayClick: (pathway) => {
      dispatch(selectPathway(pathway))
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Pathway)
