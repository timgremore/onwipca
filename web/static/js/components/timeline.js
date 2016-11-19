import React, { Component } from "react"

class Timeline extends Component {
  render() {
    const { items } = this.props

    return (
      <ul className="c-timeline">
        {items.map((item, index) => {
          return (
            <li key={index} className="c-timeline__item">
              <div className="c-timeline__item__container">
                {item.name}
              </div>
            </li>
          )
        })}
      </ul>
    )
  }
}

export default Timeline
