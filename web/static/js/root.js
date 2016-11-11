import React, { Component } from "react"
import { Provider } from "react-redux"
import { Router, Route, browserHistory } from "react-router"

import configureStore from './configure_store'
import MainLayout from "./components/main_layout"
import Main from "./components/main"

const store = configureStore()

class Root extends Component {
  render() {
    return (
      <Provider store={store}>
        <Router history={browserHistory}>
          <Route component={MainLayout}>
            <Route path="/" component={Main} />
          </Route>
        </Router>
      </Provider>
    )
  }
}

export default Root
