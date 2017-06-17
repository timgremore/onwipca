import React, { Component } from "react"
import Sticky from 'react-stickynode'
import { Link } from 'react-router'
import Scrollchor from 'react-scrollchor'

const classNames = require('classnames')

class Mast extends Component {
  constructor() {
    super()

    this.state = {
      closed: true
    }
  }

  _toggleMenu() {
    this.setState({
      closed: !this.state.closed
    })
  }

  _closeMenu() {
    this.setState({
      closed: true
    })
  }

  render () {
    const offset = document.documentElement.clientWidth > 450 ? -80 : -90;
    const packClassNames = classNames({
      'o-pack': true,
      'o-pack--closed': this.state.closed,
    })

    return (
      <Sticky innerZ="10">
        <div className="o-wrapper">
          <div className="o-layout">
            <div className="o-layout__item u-1/1 c-mast">
              <Scrollchor to="home">
                <img src="/images/logo.svg" width="80" />
              </Scrollchor>

              <div className="c-navbar u-float-right u-3/4@tablet u-1/2@desk">
                <div className="c-navbar__menu">
                  <a href="#0" onClick={this._toggleMenu.bind(this)}>
                    <img src="/images/ic_menu_white_24px.svg" />
                  </a>
                </div>

                <div className={packClassNames}>
                  <div className="o-pack__item">
                    <Scrollchor beforeAnimate={this._closeMenu.bind(this)} to="mission" animate={{offset: offset}}>Mission</Scrollchor>
                  </div>
                  <div className="o-pack__item">
                    <Scrollchor beforeAnimate={this._closeMenu.bind(this)} to="pathways" animate={{offset: offset}}>Pathways</Scrollchor>
                  </div>
                  <div className="o-pack__item">
                    <Scrollchor beforeAnimate={this._closeMenu.bind(this)} to="funding" animate={{offset: offset}}>Funding</Scrollchor>
                  </div>
                  <div className="o-pack__item">
                    <Scrollchor beforeAnimate={this._closeMenu.bind(this)} to="contact" animate={{offset: offset}}>Contact</Scrollchor>
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
        </div>
      </Sticky>
    )
  }
}

export default Mast;
