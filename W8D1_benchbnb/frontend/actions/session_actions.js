import * as SessionAPIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    user: currentUser
  };
};

export const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER
  };
};

export const receiveErrors = (errors) => {
  return {
    type: RECEIVE_ERRORS,
    errors: errors.responseJSON
  };
};

export const login = user => dispatch => {
  return SessionAPIUtil.login(user).then(
    payload => dispatch(receiveCurrentUser(payload)),
    errors => dispatch(receiveErrors(errors))
  );
};

export const logout = () => dispatch => {
  return SessionAPIUtil.logout().then(
    payload => dispatch(logoutCurrentUser(payload)),
    errors => dispatch(receiveErrors(errors))
  );
};

export const signup = (user) => dispatch => {
  return SessionAPIUtil.signup(user).then(
    payload => dispatch(receiveCurrentUser(payload)),
    errors => dispatch(receiveErrors(errors))
  );
};
