import React, { Component } from "react"
import { connect } from 'react-redux'

import Home from './home'
import History from './history'
import Mission from './mission'
import Directory from './directory'
import Pathways from './pathways'
import Funding from './funding'

import { fetchChurches } from '../actions/churches';
import { fetchPathways } from '../actions/pathways';

class Main extends Component {
  componentDidMount() {
    const { dispatch } = this.props
    dispatch(fetchPathways())
    dispatch(fetchChurches())
  }

  render() {
    return (
      <div>
        <Home />
        <History />
        <Mission />
        <Pathways />
        <Directory />
        <Funding />
      </div>
    )
  }
}

export default connect()(Main)
