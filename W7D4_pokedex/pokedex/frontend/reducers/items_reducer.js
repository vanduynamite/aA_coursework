import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';
import { merge } from 'lodash';

export default (state={}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ONE_POKEMON: {
      const pokemonItems = action.pokemon.items;
      return merge({}, state, pokemonItems);
    }

    default:
      return state;
  }
};
