import React, { Component } from "react"
import { connect } from 'react-redux'

import Timeline from './timeline'

class History extends Component {
  render() {
    const { churches } = this.props

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
              <ul className="">
              {churches.map((item, index) => {
                return (
                  <li key={index}>
                    {item.name}
                  </li>
                )
              })}
              </ul>
            </div>
            <div className="o-layout__item u-1/1">
              <Timeline items={churches} />
            </div>
          </div>
        </div>
      </section>
    )
  }
}

function mapStateToProps(state) {
  const { churches } = state

  return {
    churches: churches.items,
  }
}

export default connect(mapStateToProps)(History)
