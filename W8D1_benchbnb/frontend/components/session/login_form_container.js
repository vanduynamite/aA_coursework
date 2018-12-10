import React from 'react';
import { connect } from 'react-redux';
import SessionForm from './session_form';
import { login } from '../../actions/session_actions';

const msp = state => {
  const errors = state.errors.session;
  const formType = 'login';

  return {
    errors,
    formType,
  };
};

const mdp = dispatch => {
  return {
    processForm: (user) => dispatch(login(user)),
  };
};

export default connect(msp, mdp)(SessionForm);


// {
//   entities: {
//     users: {}
//   },
//   session: {
//     id: null,
//   },
//   errors: {
//     session: []
//   }
// }
