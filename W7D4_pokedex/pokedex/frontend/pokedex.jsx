import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { Provider } from 'react-redux';
import PokemonIndex from './components/pokemon/pokemon_index_container.js';
import PokemonDetail from './components/pokemon/pokemon_detail.jsx';
import { HashRouter, Route } from 'react-router-dom';

const store = configureStore();

const Root = ({ store }) => {
  return(
    <HashRouter>
      <Provider store={store}>
        <div className='main'>
          <div className='poke-list'>
            <Route path='/' component={PokemonIndex} />
          </div>
          <div className='poke-details-container'>
            <Route path='/pokemon/:pokemonId' component={PokemonDetail} />
          </div>
        </div>
      </Provider>
    </HashRouter>
  );
};


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});

// TEST:
// import { fetchAllPokemon } from './util/api_util';
// import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions.js';
window.getState = store.getState;
// window.dispatch = store.dispatch;
// window.fetchAllPokemon = fetchAllPokemon;
// window.receiveAllPokemon = receiveAllPokemon;
// window.requestAllPokemon = requestAllPokemon;
// const getSuccess = pokemon => console.log(receiveAllPokemon(pokemon));
// fetchAllPokemon().then(getSuccess);
