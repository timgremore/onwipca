import React, { Component } from "react"
import Sticky from 'react-stickynode'
import { Link } from 'react-router'
import Scrollchor from 'react-scrollchor'

class Mast extends Component {
  render () {
    return (
      <Sticky innerZ="10">
        <div className="o-wrapper">
          <div className="o-layout">
            <div className="o-layout__item u-1/1">
              <Scrollchor to="home">
                <img src="/images/logo.svg" />
              </Scrollchor>

              <div className="c-navbar o-pack u-float-right u-1/2">
                <div className="o-pack__item">
                  <Scrollchor to="history">History</Scrollchor>
                </div>
                <div className="o-pack__item">
                  <Scrollchor to="mission">Mission</Scrollchor>
                </div>
                <div className="o-pack__item">
                  <Scrollchor to="pathways">Pathways</Scrollchor>
                </div>
                <div className="o-pack__item">
                  <Scrollchor to="directory">Directory</Scrollchor>
                </div>
                <div className="o-pack__item">
                  <Scrollchor to="funding">Funding</Scrollchor>
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
