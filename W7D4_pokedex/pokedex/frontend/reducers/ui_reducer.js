// import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

export default (state={}, action) => {
  Object.freeze(state);

  switch (action.type) {
    default:
      return state;
  }
};
