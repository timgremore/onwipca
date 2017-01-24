import React, { Component } from "react"

import FundingChart from './funding_chart'

class Funding extends Component {
  render() {
    return (
      <section id="funding">
        <div className="o-wrapper">
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/1">
              <h1 className="u-copy-cursive u-text-center">Funding</h1>
            </div>
            <div className="o-layout__item u-1/2">
              <h2>Wisconsin&rsquo;s churches commitment to church planting</h2>
              <p>Our financial commitment as the Wisconsin Presbytery:</p>
              <ul>
                <li>Wisconsin churches have already given over $200,000 to church planting in Wisconsin since 2013</li>
                <li>100% of our Wisconsin churches are invested in the &ldquo;On Wisconsin&rdquo; Program</li>
                <li>Wisconsin churches are giving $100,000+ per year with an annual 10% increase</li>
                <li>By 2022 the &ldquo;On Wisconsin&rdquo; network will be fully funded by the Wisconsin Presbytery</li>
              </ul>
              <p>We need outside partners to help fund the &ldquo;On Wisconsin&rdquo; network to maximize a $100,000 grant opportunity</p>
              <h2 className="">To fully fund the "On Wisconsin" network, we need 15% from outside sources</h2>
            </div>
            <div className="o-layout__item u-1/2">
              <FundingChart />
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default Funding
