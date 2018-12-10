
export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon);
};

export const selectPokemonsItems = (state, itemList) => {
  const thisPokemonsItems = itemList.map( (id) => {
    return state.entities.items[id];
  });
  return thisPokemonsItems;
};
