import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

export default class PokemonIndex extends React.Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemon = this.props.allPokemon;
    const lis = pokemon.map( poke => {
      return <PokemonIndexItem poke={poke} key={poke.id}/>;
    });


    return (
      <ul className='all-poke-list'>
        {lis}
      </ul>
    );
  }

}
