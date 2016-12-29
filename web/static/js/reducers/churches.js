import {
  RECEIVE_CHURCHES,
  SELECT_STAGE,
} from '../actions/churches';

const churches = (state = {
  items: [],
  selected: null,
  selectedStage: 2,
}, action) => {

  switch (action.type) {
    case RECEIVE_CHURCHES:
      return Object.assign({}, state, {
        items: action.items
      })
    case SELECT_STAGE:
      return Object.assign({}, state, {
        selectedStage: action.stage,
      })

    default:
      return state
  }
}

export default churches
