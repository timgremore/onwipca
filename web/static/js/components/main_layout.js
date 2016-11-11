import React, { Component } from "react"

import Mast from './mast';

class MainLayout extends Component {
  render() {
    return (
      <div>
        <Mast />
        {this.props.children}
      </div>
    )
  }
}

export default MainLayout
