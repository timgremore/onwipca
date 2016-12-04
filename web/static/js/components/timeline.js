import React, { Component } from "react"
import moment from 'moment'

const classNames = require('classnames')

class Timeline extends Component {
  render() {
    const { items } = this.props

    return (
      <ul className="c-timeline">
        {items.map((item, index) => {
          const foundedOn = moment(item.particularized_at).format('MMMM YYYY')
          const cityStateZip = `${item.city}, ${item.state} ${item.zipcode}`

          const timelineItemClass = classNames({
            'c-timeline__item': true,
            'c-timeline__item--reverse': !(index % 2)
          })

          const flagClass = classNames({
            'o-flag': true,
            'o-flag--top': true,
            'o-flag--reverse': !(index % 2)
          })

          const mapUrl = `https://maps.google.com/?=${item.street} ${cityStateZip}`

          return (
            <li key={index} className={timelineItemClass}>
              <div className="c-timeline__item__container">
                <h4 className="u-margin-none">{item.name}</h4>
                <p className="u-margin-none u-margin-bottom"><em>{foundedOn}</em></p>
                <div className={flagClass}>
                  <div className="o-flag__img">
                    <img src={item.photo} alt="{item.name}" />
                  </div>
                  <div className="o-flag__body">
                    <p>
                      {item.street}<br />
                      {cityStateZip}
                    </p>
                    <p>
                      <a className="c-link" href={item.url}>
                        <i className="c-material-icons u-margin-right-small">link</i>
                      </a>
                      <a className="c-link" href={mapUrl}>
                        <i className="c-material-icons">directions</i>
                      </a>
                    </p>
                  </div>
                </div>
              </div>
            </li>
          )
        })}
      </ul>
    )
  }
}

export default Timeline
