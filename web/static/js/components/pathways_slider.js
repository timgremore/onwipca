import React, { Component } from "react"
import Slider from 'react-slick'

class PathwaysSlider extends Component {
  render() {
    const settings = {
      dots: true,
      infinite: true,
      speed: 500,
      slidesToShow: 1,
      slidesToScroll: 1,
    }

    return (
      <Slider {...settings}>
        <div>
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/3">
              <h3 className="u-margin-bottom-none">Path One</h3>
              <p><em>Strategic Planting</em></p>
              <p className="o-margin-none">Current Status</p>
              <ul className="o-margin-none">
                <li>Church planter readiness: Ready now (MNA Assessment Approved)</li>
                <li>Probable location: Strategic areas</li>
                <li>Training: Provisional session and coach</li>
                <li>Sender: Wisconsin MNA Committee</li>
              </ul>
            </div>
            <div className="o-layout__item u-2/3">
              <img src="/images/pathways-one.png" alt="Pathways One" />
            </div>
          </div>
        </div>
        <div>
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/3">
              <h3 className="u-margin-bottom-none">Path Two</h3>
              <p><em>Strategic Planting</em></p>
              <p className="o-margin-none">Current Status</p>
              <ul className="o-margin-none">
                <li>Church planter readiness: Ready now (MNA Assessment Approved)</li>
                <li>Probable location: Strategic areas</li>
                <li>Training: Provisional session and coach</li>
                <li>Sender: Wisconsin MNA Committee</li>
              </ul>
            </div>
            <div className="o-layout__item u-2/3">
              <img src="/images/pathways-one.png" alt="Pathways One" />
            </div>
          </div>
        </div>
        <div>
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/3">
              <h3 className="u-margin-bottom-none">Path Three</h3>
              <p><em>Strategic Planting</em></p>
              <p className="o-margin-none">Current Status</p>
              <ul className="o-margin-none">
                <li>Church planter readiness: Ready now (MNA Assessment Approved)</li>
                <li>Probable location: Strategic areas</li>
                <li>Training: Provisional session and coach</li>
                <li>Sender: Wisconsin MNA Committee</li>
              </ul>
            </div>
            <div className="o-layout__item u-2/3">
              <img src="/images/pathways-one.png" alt="Pathways One" />
            </div>
          </div>
        </div>
      </Slider>
    )
  }
}

export default PathwaysSlider
