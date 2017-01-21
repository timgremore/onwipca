import React, { Component } from "react"
import { connect } from 'react-redux'

import { selectPathway } from '../actions/pathways'

class Pathway extends Component {
  render() {
    const { pathway, selectedPathway } = this.props

    console.log((selectedPathway ? selectedPathway.id : ' ') + ", " + pathway.id)

    return (
      <li>
        <input
          type="checkbox"
          value={pathway.id}
          onChange={() => this.props.onPathwayClick(pathway)}
          checked={selectedPathway && selectedPathway.id == pathway.id} />
        <i></i>
        <h2 className="u-margin-bottom-none">{pathway.name}</h2>
        <div>
          <p>
            <strong>Church Planter Readiness:</strong><br />
            {pathway.readiness}
          </p>
          <p>
            <strong>Probable Location:</strong><br />
            {pathway.location}
          </p>
          <p>
            <strong>Training:</strong><br />
            {pathway.training}
          </p>
          <p>
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
