import * as APIs from '../utils/todo_api_util.js';
import { clearErrors, receiveErrors } from './error_actions';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos: todos // [ {id: 1, ...etc}, {id: 2, ...}]
  };
};
export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo: todo // is this in format {id: 2, data: 'thing2'}?
  };
};
export const removeTodo = (id) => {
  return {
    type: REMOVE_TODO,
    id: id
  };
};

export const fetchTodos = () => dispatch => {
  return APIs.fetchTodos().then(response => dispatch(receiveTodos(response)));
};

export const createTodo = (todo) => dispatch => {
  return APIs.createTodo(todo)
    .then(
      response => dispatch(receiveTodo(response)),
      err => dispatch(receiveErrors(err.responseJSON)))
    .then(
      () => dispatch(clearErrors())
    );
};

export const updateTodo = (todo) => dispatch => {
  return APIs.updateTodo(todo).then(response => dispatch(receiveTodo(response)));
};

export const deleteTodo = (todo) => dispatch => {
  return APIs.deleteTodo(todo).then(response => dispatch(removeTodo(response.id)));
};
