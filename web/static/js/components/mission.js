import React, { Component } from "react"

class Mission extends Component {
  render() {
    return (
      <section id="mission">
        <div className="o-layout o-layout--center">
          <div className="o-layout__item u-1/1">
            <div className="o-layout o-layout--center">
              <div className="o-layout__item u-1/1">
                <h1 className="u-text-center">Mission</h1>
                <p className="o-lede u-text-center">The gospel&rsquo;s continual and future reach in Wisconsin.</p>
              </div>
            </div>
            <div className="o-layout o-layout--center">
              <div className="o-layout__item u-3/4 u-2/5@tablet">
                <p className="u-copy-justify">&ldquo;On Wisconsin&rdquo; is a church planting network led and funded by
                  Presbyterian Church in America (PCA) congregations in Wisconsin.</p>
                <p className="u-copy-justify">As of 2012 there were only six PCA churches in Wisconsin and no
                  new churches since 1993. Since 2012 two churches have taken
                  root, six new works have started and two RUF chapters have
                  begun.</p>
                <p className="u-copy-justify">Our goal is to plant 16 more churches in Wisconsin in the
                  next 10 years. Wisconsin is well on its way to this goal, but
                  we need your help. Please consider how you might join this
                  movement. We are looking for others to join us as church
                  planters, apprentices, students as well as supporting
                  partners in this vital work.</p>
              </div>
            </div>
            <div className="o-layout o-layout--center">
              <div className="o-layout__item u-4/5 u-1/2@tablet">
                <div className="o-box o-box--large">
                  <q>Now to him who is able to do far more abundantly than all that
                    we ask or think, according to the power at work within us, to him
                    be glory in the church and in Christ Jesus throughout all
                    generations, forever and ever. Amen.<span>- Ephesians 3:20,21</span></q>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Mission
