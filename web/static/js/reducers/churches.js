import {
  RECEIVE_CHURCHES,
} from '../actions/churches';

const churches = (state = {
  items: [],
  selected: null,
}, action) => {

  switch (action.type) {
    case RECEIVE_CHURCHES:
      return Object.assign({}, state, {
        items: action.items
      })

    default:
      return state
  }
}

export default churches
