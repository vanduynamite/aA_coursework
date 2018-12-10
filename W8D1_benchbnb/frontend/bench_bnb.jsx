import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

const store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});


// DEBUG:
import * as actions from './actions/session_actions';
window.store = store;
window.actions = actions;
window.getState = store.getState;
window.dispatch = store.dispatch;
