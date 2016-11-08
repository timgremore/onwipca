import { createStore, applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'
import createLogger from 'redux-logger'

import index from './reducers/index'

const loggerMiddleware = createLogger()

export default function configureStore(preloadedState) {
  return createStore(
    index,
    preloadedState,
    applyMiddleware(
      thunkMiddleware,
      loggerMiddleware
    )
  )
}
