import React, { Component } from "react"

class Home extends Component {
  render() {
    return (
      <section id="home">
        <div className="o-wrapper u-margin-top-huge">
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/1">
              <div className="u-text-center u-margin-bottom">
                <img src="/images/logo.svg" width="220" />
              </div>
              <p className="u-h4 u-text-center">Planting tomorrow's churches in Wisconsin</p>
            </div>
            <div className="o-layout__item u-1/1 u-margin-top u-margin-bottom-large">
              <div className="c-video">
                <iframe
                  src="https://player.vimeo.com/video/221165716?title=0&byline=0&portrait=0"
                  frameborder="0"
                  webkitallowfullscreen
                  mozallowfullscreen
                  allowfullscreen />
              </div>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Home
