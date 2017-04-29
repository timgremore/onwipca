import React, { Component } from "react"
import Sticky from 'react-stickynode'
import { Link } from 'react-router'
import Scrollchor from 'react-scrollchor'

class Mast extends Component {
  render () {
    const offset = -80;

    return (
      <Sticky innerZ="10">
        <div className="o-wrapper">
          <div className="o-layout">
            <div className="o-layout__item u-1/1 c-mast">
              <Scrollchor to="home">
                <img src="/images/logo.svg" width="80" />
              </Scrollchor>

              <div className="c-navbar o-pack u-float-right u-1/2 u-3/4@tablet u-1/2@desk">
                <div className="o-pack__item">
                  <Scrollchor to="mission" animate={{offset: offset}}>Mission</Scrollchor>
                </div>
                <div className="o-pack__item">
                  <Scrollchor to="pathways" animate={{offset: offset}}>Pathways</Scrollchor>
                </div>
                <div className="o-pack__item">
                  <Scrollchor to="funding" animate={{offset: offset}}>Funding</Scrollchor>
                </div>
                <div className="o-pack__item">
                  <Scrollchor to="contact" animate={{offset: offset}}>Contact</Scrollchor>
                </div>
                <div className="o-pack__item">
                  {document.getElementsByName('guardian-token').length > 0 ?
                    <a href="/my-account">Account</a> :
                    <a href="/login">Login</a>}
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
