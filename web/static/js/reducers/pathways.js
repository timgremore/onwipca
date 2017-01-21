import {
  RECEIVE_PATHWAYS,
  SELECT_PATHWAY,
  DESELECT_PATHWAY,
} from '../actions/pathways';

const pathways = (state = {
  items: [],
  selected: 0,
}, action) => {

  switch (action.type) {
    case RECEIVE_PATHWAYS:
      return Object.assign({}, state, {
        items: action.items
      })

    case SELECT_PATHWAY:
      const selectedPathway = state.selected == action.pathway ? 0 : action.pathway
      return Object.assign({}, state, {
        selected: selectedPathway,
      })

    case DESELECT_PATHWAY:
      return Object.assign({}, state, {
        selected: 0,
      })

    default:
      return state
  }
}

export default pathways
