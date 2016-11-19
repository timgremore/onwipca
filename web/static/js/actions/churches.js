import fetch from 'isomorphic-fetch'

export const RECEIVE_CHURCHES = 'RECEIVE_CHURCHES';
export const REQUEST_CHURCHES = 'REQUEST_CHURCHES';

export function requestChurches(json) {
  return {
    type: REQUEST_CHURCHES,
  }
}

export function receiveChurches(json) {
  return {
    type: RECEIVE_CHURCHES,
    items: json.data
  }
}

export function fetchChurches() {
  return function (dispatch) {
    dispatch(requestChurches())

    return fetch('/api/churches', {
      method: 'GET',
    })
      .then((response) => response.json())
      .then((json) => {
        dispatch(receiveChurches(json))
      })
  }
}