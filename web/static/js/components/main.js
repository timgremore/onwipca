import React, { Component } from "react"
import Home from './home'
import History from './history'
import Mission from './mission'
import Directory from './directory'
import Pathways from './pathways'
import Funding from './funding'

class Main extends Component {
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

export default Main
