import React, { Component } from "react"

class History extends Component {
  render() {
    return (
      <section id="history">
        <div className="o-wrapper">
          <div className="o-layout o-layout--center">
            <div className="o-layout__item u-1/1">
              <h1 className="u-copy-cursive u-text-center">History</h1>
            </div>
            <div className="o-layout__item u-2/5">
              <p className="u-text-center">
                <img src="/images/wisconsin.svg" width="350" />
              </p>
            </div>
            <div className="o-layout__item u-2/5">
              <p>The Wisconsin presbytery was composed of six particularized churches from 1992 until 2013:</p>
              <ul>
                <li>
                  Christ Covenant Church, <em>La Crosse, WI</em>
                </li>
                <li>
                  Grace Presbyterian Church, <em>Pardeeville, WI</em>
                </li>
                <li>
                  Lake Trails Church, <em>Madison, WI</em>
                </li>
                <li>
                  Bible Presbyterian Church, <em>Merrill, WI</em>
                </li>
                <li>
                  Trinity Presbyterian Church, <em>Waukesha, WI</em>
                </li>
                <li>
                  Cornerstone Presbyterian Church, <em>Delafield, WI</em>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default History

