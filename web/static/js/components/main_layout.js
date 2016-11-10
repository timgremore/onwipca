import React, { Component } from "react"

class MainLayout extends Component {
  render() {
    return (
      <div className="o-layout o-layout--center">
        <div className="o-layout__item u-1/1">
          <img src="/images/logo.svg" />
        </div>
        {this.props.children}
      </div>
    )
  }
}

export default MainLayout
