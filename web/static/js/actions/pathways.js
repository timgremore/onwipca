import fetch from 'isomorphic-fetch'

export const RECEIVE_PATHWAYS = 'RECEIVE_PATHWAYS';
export const REQUEST_PATHWAYS = 'REQUEST_PATHWAYS';

export function requestPathways(json) {
  return {
    type: REQUEST_PATHWAYS,
  }
}

export function receivePathways(json) {
  return {
    type: RECEIVE_PATHWAYS,
    items: json.data
  }
}

export function selectStage(stage) {
  return {
    type: SELECT_STAGE,
    stage: stage,
  }
}

export function fetchPathways() {
  return function (dispatch) {
    dispatch(requestPathways())

    return fetch('/api/pathways', {
      method: 'GET',
    })
      .then((response) => response.json())
      .then((json) => {
        dispatch(receivePathways(json))
      })
  }
}
