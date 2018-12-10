import { connect } from 'react-redux';
import { selectAllPokemon } from '../../reducers/selectors';
import * as Actions from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';

const mapStateToProps = (state) => {
  return { allPokemon: selectAllPokemon(state) };
};

const mapDispatchToProps = dispatch => {
  return {
    requestAllPokemon: () => dispatch(Actions.requestAllPokemon())
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
