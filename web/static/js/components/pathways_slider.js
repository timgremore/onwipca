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
          <p>Vision for future churches in Wisconsin : 3 paths</p>
          <h3 className="">Path one: Strategic planting</h3>
        </div>
        <div>
          <h4 className="">Church planter Readiness:</h4>
        </div>
        <div>
          <h4 className="">Ready now (MNA assessment approved)</h4>
        </div>
        <div>
          <h4 className="">Probable location:</h4>
        </div>
        <div>
          <h4>Strategic areas</h4>
        </div>
        <div>
          <h4 className="">Training:</h4>
        </div>
        <div>
          <h4 className="">Provisional session & coach</h4>
        </div>
        <div>
          <h4 className="">Sender:</h4>
        </div>
        <div>
          <h4 className="">Wisconsin MNA committee</h4>
        </div>
      </Slider>
    )
  }
}

export default PathwaysSlider
