import { merge } from 'lodash';
import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';

const todosReducer = (state={}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_TODOS: {
      const newState = {};
      for (let i = 0; i < action.todos.length; i++) {
        newState[action.todos[i].id] = action.todos[i];
      }
      return newState;
    }

    case RECEIVE_TODO: {
      const newState = {[action.todo.id]: action.todo};

      return merge({}, state, newState);
    }

    case REMOVE_TODO: {
      const newState = merge({}, state);
      delete newState[action.id];
      return newState;
    }

    default:
      return state; // {1: {id: 1, data: 'thing'}, 2: {id: 2, data: 'thing2'}}
  }
};

export default todosReducer;
