import React, { Component } from "react"

class MainLayout extends Component {
  render() {
    return (
      <div className="o-layout o-layout--center">
        <div className="o-layout__item u-1/1">
          <img src="/images/logo.svg" />
        </div>
        <div className="o-layout__item u-2/3">
          {this.props.children}
        </div>
      </div>
    )
  }
}

export default MainLayout
