import React, { Component } from "react"
import PathwaysMap from './pathways_map'

class Pathways extends Component {
  render() {
    return (
      <section id="pathways">
<<<<<<< HEAD
        <div className="o-wrapper">
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/1">
              <h1 className="u-copy-cursive u-text-center">Pathways</h1>
              <h2 className="u-text-center u-margin-bottom-large">Vision for future churches in Wisconsin: 3 paths</h2>
              <PathwaysSlider />
            </div>
            <div className="">
              <h2 className="">Path one</h2>
            </div>
            /* need to insert image of WI with dots & stars for churches */
          </div>
        </div>
=======
        <PathwaysMap />
>>>>>>> 2439807549e17d427ff557a093840e1b0dda3ce2
      </section>
    )
  }
}

export default Pathways
