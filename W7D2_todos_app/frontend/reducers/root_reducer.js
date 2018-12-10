import todos from './todos_reducer';
import { combineReducers } from 'redux';
import errors from './error_reducer';

export default combineReducers({
  todos,
  errors
});
