import React, { Component } from "react"
import Sticky from 'react-stickynode'

class Mast extends Component {
  render () {
    return (
      <Sticky innerZ="10">
        <div className="o-layout o-layout--center">
          <div className="o-layout__item u-1/1">
            <img src="/images/logo.svg" />
          </div>
        </div>
      </Sticky>
    )
  }
}

export default Mast;
