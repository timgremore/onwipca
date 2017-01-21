import {
  RECEIVE_PATHWAYS,
  SELECT_PATHWAY,
} from '../actions/pathways';

const pathways = (state = {
  items: [],
  selected: null,
}, action) => {

  switch (action.type) {
    case RECEIVE_PATHWAYS:
      return Object.assign({}, state, {
        items: action.items
      })

    case SELECT_PATHWAY:
      return Object.assign({}, state, {
        selected: action.pathway,
      })

    default:
      return state
  }
}

export default pathways
