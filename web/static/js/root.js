import React, { Component } from "react"
import { Provider } from "react-redux"
import { Router, Route, browserHistory } from "react-router"

import configureStore from './configure_store'
import Main from "./components/main"

const store = configureStore()

class Root extends Component {
  render() {
    return (
      <Provider store={store}>
        <Router history={browserHistory}>
          <Route path="/" component={Main} />
        </Router>
      </Provider>
    )
  }
}

export default Root
