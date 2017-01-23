import React from "react"
import ReactDOM from "react-dom"

import Root from "./root"

if (document.getElementById('onwipca-app')) {
  ReactDOM.render(
    <Root />,
    document.getElementById('onwipca-app')
  )
}
