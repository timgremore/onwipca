import { combineReducers } from 'redux';
import users from './users'
import churches from './churches'

const index = combineReducers({
  users,
  churches,
})

export default index;

