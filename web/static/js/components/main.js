import React, { Component } from "react"
import { Link, Element } from 'react-scroll'

class Main extends Component {
  render() {
    return (
      <div>
        <Element>
          <section id="home">
            <div className="o-wrapper">
              <div className="o-hero">
                <h1>
                  <span>On</span>
                  <span>Wisconsin</span>
                  <span>PCA</span>
                </h1>
                <h2>A church planting story</h2>
              </div>
            </div>
          </section>
        </Element>
        <Element>
          <section id="history">
            <h1>History</h1>
          </section>
        </Element>
        <Element>
          <section id="mission">
            <h1>Mission</h1>
          </section>
        </Element>
      </div>
    )
  }
}

export default Main
