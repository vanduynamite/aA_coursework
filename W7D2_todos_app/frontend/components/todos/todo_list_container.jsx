import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import * as Actions from '../../actions/todo_actions';

const msp = state => {
  return {
    todos: allTodos(state),
    errors: state.errors,
  };
};

const mdp = dispatch => {
  return {
    fetchTodos: () => dispatch(Actions.fetchTodos()),
    createTodo: (todo) => dispatch(Actions.createTodo(todo)),
    updateTodo: (todo) => dispatch(Actions.updateTodo(todo)),
    deleteTodo: (todo) => dispatch(Actions.deleteTodo(todo)),
  };
};

export default connect(msp, mdp)(TodoList);
