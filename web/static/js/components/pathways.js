import React, { Component } from "react"
import PathwaysSlider from './pathways_slider'

class Pathways extends Component {
  render() {
    return (
      <section id="pathways">
        <div className="o-wrapper">
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/1">
              <h1 className="u-copy-cursive u-text-center">Pathways</h1>
              <PathwaysSlider />
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Pathways
