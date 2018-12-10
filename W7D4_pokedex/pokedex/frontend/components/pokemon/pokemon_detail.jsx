import React from 'react';
import { connect } from 'react-redux';
import { fetchPokemon } from '../../actions/pokemon_actions.js';
import { selectPokemonsItems } from '../../reducers/selectors.js';

class PokemonDetail extends React.Component {

  componentDidMount() {
    this.props.fetchPokemon(this.props.pokemonId);
  }

  componentDidUpdate(oldProps) {
    if (oldProps.pokemonId !== this.props.pokemonId) {
      this.props.fetchPokemon(this.props.pokemonId);
    }
  }

  render() {
    const pokemon = this.props.pokemon;
    const items = this.props.items;

    const lis = items.map( (item) => {
      return (
        <li className='li-item-pic' key={item.id}>
          <img className="item-pic" src={item.image_url}></img>
        </li>
      );
    });

    return (
      <div className="poke-details">
        <img className="big-poke-pic" src={pokemon.image_url}></img>
        <span className='name'>{pokemon.name}</span>
        <span className='detail'>Type: {pokemon.poke_type}</span>
        <span className='detail'>Attack: {pokemon.attack}</span>
        <span className='detail'>Defense: {pokemon.defense}</span>
        <span className='detail'>Moves: {pokemon.moves}</span>
        <div className="item-container">
          <ul className="item-list">
            {lis}
          </ul>
        </div>
      </div>
    );
  }

}

const msp = (state, ownProps) => {
  const pokemonId = ownProps.match.params.pokemonId;
  const pokemon = state.entities.pokemon[pokemonId] || {};
  const itemList = pokemon.item_ids || [];
  const items = selectPokemonsItems(state, itemList) || [];

  return {
    pokemonId,
    pokemon,
    items,
  };
};

const mdp = (dispatch) => {
  return {
    fetchPokemon: (id) => dispatch(fetchPokemon(id)),
  };
};

export default connect(msp, mdp)(PokemonDetail);
