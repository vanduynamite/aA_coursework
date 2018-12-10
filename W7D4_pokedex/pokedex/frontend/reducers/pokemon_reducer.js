import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

export default (state={}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);

    case RECEIVE_ONE_POKEMON: {
      const pokemon = action.pokemon.pokemon;
      return merge({}, state, pokemon);
    }

    default:
      return state;
  }
};
