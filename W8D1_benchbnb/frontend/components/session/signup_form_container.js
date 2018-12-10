import React from 'react';
import { connect } from 'react-redux';
import SessionForm from './session_form';
import { signup } from '../../actions/session_actions';

const msp = state => {
  const errors = state.errors.session;
  const formType = 'signup';

  return {
    errors,
    formType,
  };
};

const mdp = dispatch => {
  return {
    processForm: (user) => dispatch(signup(user)),
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
