import React, { Component } from "react"
import moment from 'moment'

const classNames = require('classnames')

class Timeline extends Component {
  render() {
    const { items } = this.props

    return (
      <ul className="c-timeline u-margin-bottom-none">
        {items.map((item, index) => {
          const foundedOn = moment(item.particularized_at).format('MMMM YYYY')
          const cityStateZip = `${item.city}, ${item.state} ${item.zipcode}`

          const timelineItemClass = classNames({
            'c-timeline__item': true,
          })

          const flagClass = classNames({
            'o-flag': true,
            'o-flag--top': true,
          })

          const mapUrl = `https://maps.google.com/?=${item.street} ${cityStateZip}`

          return (
            <li key={index} className={timelineItemClass}>
              <div className="c-timeline__item__container">
                <img src={item.logo} alt="{item.name}" />
              </div>
              <div className="c-timeline__item__container">
                <h4 className="u-margin-none">{item.name}</h4>
                <p className="u-margin-none u-margin-bottom"><em>{foundedOn}</em></p>
                <p>
                  {item.street}<br />
                  {cityStateZip}<br />
                  <a className="c-link" href={item.url}>
                    <i className="c-material-icons u-margin-right-small">link</i>
                  </a>
                  <a className="c-link" href={mapUrl}>
                    <i className="c-material-icons">directions</i>
                  </a>
                </p>
              </div>
            </li>
          )
        })}
      </ul>
    )
  }
}

export default Timeline
