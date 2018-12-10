import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store';
import Root from './components/root';
import { receiveTodos, receiveTodo, removeTodo } from './actions/todo_actions';
import { allTodos } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});

// TEST
window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.allTodos = allTodos;

// const newTodos = [
//   { id: 1, title: "Bathe", body: "clean thoroughly" },
//   { id: 2, title: "Brush teeth", body: "and floss!!" },
//   { id: 3, title: "Sleep", body: "for at least 1hr" },
//   { id: 4, title: "Eat breakfast", body: "bacon egg and cheese"}
// ];

// store.dispatch(receiveTodos(newTodos));
