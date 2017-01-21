import {
  RECEIVE_PATHWAYS,
  SELECT_STAGE,
} from '../actions/pathways';

const pathways = (state = {
  items: [],
  selected: null,
  selectedStage: 2,
}, action) => {

  switch (action.type) {
    case RECEIVE_PATHWAYS:
      return Object.assign({}, state, {
        items: action.items
      })

    default:
      return state
  }
}

export default pathways
