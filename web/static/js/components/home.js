import React, { Component } from "react"

class Home extends Component {
  render() {
    return (
      <section id="home">
        <div className="o-wrapper">
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/3">
              <div className="o-hero">
                <h1>
                  <span>On</span>
                  <span>Wisconsin</span>
                  <span>PCA</span>
                </h1>
                <h2>Planting tomorrow's churches<br />in Wisconsin</h2>
              </div>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Home
