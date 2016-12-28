import React, { Component } from "react"
import { connect } from 'react-redux'

import { selectStage } from '../actions/churches'

class PathwaysButton extends Component {
  render() {
    return (
      <div class="o-block">
        <div className="o-block__img"></div>
        <div className="o-block__body">
          <a
            className="c-btn c-btn--primary c-btn--large c-btn--full c-btn--reverse"
            onClick={() => this.props.onStageClick(+this.props.stage)}>
            {this.props.label}
          </a>
        </div>
      </div>
    )
  }
}

function mapStateToProps(state) {
  const { churches } = state

  return {
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
)(PathwaysButton)
