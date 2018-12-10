
export const allTodos = (state) => {
  return Object.values(state.todos);
  // return Object.keys(state.todos).map(id => state.todos[id]);
};
