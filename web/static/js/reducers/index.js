import { combineReducers } from 'redux';
import users from './users'
import churches from './churches'
import pathways from './pathways'

const index = combineReducers({
  users,
  churches,
  pathways,
})

export default index;

