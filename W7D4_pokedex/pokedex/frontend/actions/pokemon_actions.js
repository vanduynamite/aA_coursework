import * as APIUtil from '../util/api_util';
export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON";

export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const receivePokemon = (pokemon) => {
  return {
    type: RECEIVE_ONE_POKEMON,
    pokemon
  };
};

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(payload => dispatch(receiveAllPokemon(payload)))
);

export const fetchPokemon = (id) => dispatch => (
  APIUtil.fetchPokemon(id).then(payload => dispatch(receivePokemon(payload)))
);
