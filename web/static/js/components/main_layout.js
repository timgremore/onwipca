import React, { Component } from "react"

class MainLayout extends Component {
  render() {
    return (
      <div className="o-layout o-layout--center">
        <div className="o-layout__item u-1/2">
          {this.props.children}
        </div>
      </div>
    )
  }
}

export default MainLayout
