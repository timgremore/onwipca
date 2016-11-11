import React, { Component } from "react"
import Scrollchor from 'react-scrollchor';

class Main extends Component {
  render() {
    return (
      <div>
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

        <section id="history">
          <h1>History</h1>
        </section>

        <section id="mission">
          <h1>Mission</h1>
        </section>

        <section id="directory">
          <h1>Directory</h1>
        </section>

        <section id="pathways">
          <h1>Pathways</h1>
        </section>

        <section id="funding">
          <h1>Funding</h1>
        </section>
      </div>
    )
  }
}

export default Main
