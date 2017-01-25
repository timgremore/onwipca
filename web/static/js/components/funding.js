import React, { Component } from "react"

import FundingChart from './funding_chart'

class Funding extends Component {
  render() {
    return (
      <section id="funding">
        <div className="o-wrapper">
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/1">
              <h1 className="u-text-center">Funding</h1>
              <p className="o-lede u-text-center">Wisconsin&rsquo;s churches commitment to church planting</p>
            </div>
            <div className="o-layout__item u-1/3">
              <h5 className="u-text-center">Our financial commitment as the Wisconsin Presbytery</h5>
              <ul>
                <li>Wisconsin churches have already given over $200,000 to church planting in Wisconsin since 2013</li>
                <li>100% of our Wisconsin churches are invested in the &ldquo;On Wisconsin&rdquo; Program</li>
                <li>Wisconsin churches are giving $100,000+ per year with an annual 10% increase</li>
                <li>By 2022 the &ldquo;On Wisconsin&rdquo; network will be fully funded by the Wisconsin Presbytery</li>
              </ul>
            </div>
            <div className="o-layout__item u-1/3">
              <FundingChart />
            </div>
            <div className="o-layout__item u-1/3">
              <h5 className="u-text-center">How you can help</h5>
              <ul>
                <li>We need outside partners to help fund the &ldquo;On Wisconsin&rdquo; network to maximize a $100,000 grant opportunity</li>
                <li>To fully fund the "On Wisconsin" network, we need 15% from outside sources</li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Funding
