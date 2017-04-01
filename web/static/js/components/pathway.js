import React, { Component } from "react"
import { connect } from 'react-redux'
import showdown from 'showdown'

import { selectPathway } from '../actions/pathways'

const converter = new showdown.Converter()

class Pathway extends Component {
  render() {
    const { pathway, selectedPathway } = this.props

    const readiness = converter.makeHtml(pathway.readiness)
    const location  = converter.makeHtml(pathway.location)
    const training  = converter.makeHtml(pathway.training)
    const sender    = converter.makeHtml(pathway.sender)

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
          <p className="u-margin-bottom-none"><strong>Church Planter Readiness:</strong></p>
          <div dangerouslySetInnerHTML={{ __html: readiness}} />

          <p className="u-margin-bottom-none"><strong>Probable Location:</strong></p>
          <div dangerouslySetInnerHTML={{ __html: location}} />

          <p className="u-margin-bottom-none"><strong>Training:</strong></p>
          <div dangerouslySetInnerHTML={{ __html: training}} />

          <p className="u-margin-bottom-none"><strong>Sender:</strong></p>
          <div dangerouslySetInnerHTML={{ __html: sender}} />
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
      dispatch(selectPathway(pathway, false))
    }
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Pathway)
