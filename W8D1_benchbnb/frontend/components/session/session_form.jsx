import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: '',
    };

    if (this.props.formType === 'signup') {
      this.formType = 'Sign Up';
      this.otherFormType = 'Log In';
      this.linkTo = '/login';
    } else {
      this.formType = 'Log In';
      this.otherFormType = 'Sign Up';
      this.linkTo = '/signup';
    }

    this.submit = this.submit.bind(this);
  }

  updateField(field) {
    return (e) => this.setState({[field]: e.target.value});
  }

  submit(e) {
    e.preventDefault();
    this.props.processForm(this.state);
  }

  render() {
    return (
      <form onSubmit={this.submit}>
        <h3>{this.formType}</h3>
        <Link to={this.linkTo}>{this.otherFormType}</Link>
        <br></br>
        <label htmlFor='session-username'>Username</label>
        <input
          id='session-username'
          type='text'
          value={this.state.username}
          onChange={this.updateField('username')}>
        </input>
        <br></br>
        <label htmlFor='session-password'>Password</label>
        <input
          id='session-password'
          type='password'
          value={this.state.password}
          onChange={this.updateField('password')}>
        </input>
        <br></br>
        <button>{this.formType}</button>
      </form>
    );
  }

}

export default SessionForm;
