import React, { Component } from "react"
import Sticky from 'react-stickynode'
import { Link } from 'react-router'

class Mast extends Component {
  render () {
    return (
      <Sticky innerZ="10">
        <div className="o-wrapper">
          <div className="o-layout">
            <div className="o-layout__item u-1/1">
              <img src="/images/logo.svg" />

              <div className="c-navbar o-pack u-float-right u-1/2">
                <div className="o-pack__item">
                  <Link to="/">History</Link>
                </div>
                <div className="o-pack__item">
                  <Link to="/">Mission</Link>
                </div>
                <div className="o-pack__item">
                  <Link to="/">Pathways</Link>
                </div>
                <div className="o-pack__item">
                  <Link to="/">Directory</Link>
                </div>
                <div className="o-pack__item">
                  <Link to="/">Funding</Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Sticky>
    )
  }
}

export default Mast;
