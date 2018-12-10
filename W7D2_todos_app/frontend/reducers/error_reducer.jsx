import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';

const errorReducer = (state=[], action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ERRORS:
    case CLEAR_ERRORS:
    {
      const newState = action.errors;
      return newState;
    }
    default:
      return state;
  }
};

export default errorReducer;
