import React, { Component } from "react"
import { connect } from 'react-redux'

class Contact extends Component {
  render() {
    return (
      <section id="contact">
        <div className="o-wrapper">
          <div className="o-layout">
            <div className="o-layout__item u-1/1">
              <ul className="o-list-bare">
                <li className="o-list-bare__item">
                  <span className="u-h2">Chris Vogel</span>
                </li>
                <li className="o-list-bare__item">
                  <span className="u-h4">Director of On Wisconsin Network</span>
                </li>
                <li className="o-list-bare__item">
                  <img src="/images/ic_email_white_24px.svg" width="24" className="u-margin-right-tiny" />
                  chrisvogel@cornerstone-pca.com
                </li>
                <li className="o-list-bare__item">
                  <img src="/images/ic_phone_white_24px.svg" width="24" className="u-margin-right-tiny" />
                  262-501-1161
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    )
  }
}

export default connect()(Contact)
