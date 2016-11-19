import React, { Component } from "react"
import moment from 'moment'

class Timeline extends Component {
  render() {
    const { items } = this.props

    return (
      <ul className="c-timeline">
        {items.map((item, index) => {
          const foundedOn = moment(item.particularized_at).format('MMM Do, YYYY')

          return (
            <li key={index} className="c-timeline__item">
              <div className="c-timeline__item__container">
                <span className="u-float-right u-copy-small">{foundedOn}</span>
                <h4>{item.name}</h4>
              </div>
            </li>
          )
        })}
      </ul>
    )
  }
}

export default Timeline
