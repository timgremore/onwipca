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
                <h4 className="u-margin-bottom-zero">{item.name}</h4>
                <div className="o-flag">
                  <div className="o-flag__img">
                    <img src={item.photo} alt="{item.name}" />
                  </div>
                  <div className="o-flag__body">
                    <p>Founded: {foundedOn}</p>
                    {item.founder ?
                      <p>{item.founder.first_name} {item.founder.last_name}</p>
                      :
                      null}
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
