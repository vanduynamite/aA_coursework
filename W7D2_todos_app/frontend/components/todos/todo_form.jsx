import React from 'react';

export default class TodoForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {title: '', body: ''};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();

    const todo = {
      title: this.state.title,
      body: this.state.body,
      done: false,
    };

    this.props.submit(todo).then(() => this.setState({title: '', body: ''}));
  }

  update(field) {
    return e => {
      this.setState({[field]: e.target.value});
    };
  }

  render() {
    const errors = this.props.errors;
    const lis = errors.map(error => {
      return (<li className="error">{error}</li>);
    });
    return (
      <form className="form-new" onSubmit={ this.handleSubmit }>
        <div className="input-box">
          <label className="todo-title" htmlFor='title'>New Todo: </label>
          <input id='title'
            type='text'
            onChange={ this.update('title') }
            value={ this.state.title }>
          </input>
        </div>

        <div className="input-box">
          <label className="todo-title" htmlFor='body'>Description: </label>
          <input id='body'
            type='text'
            onChange={ this.update('body') }
            value={ this.state.body }>
          </input>
        </div>
        <ul>{lis}</ul>
        <button className="submit-todo" onClick={this.handleSubmit}>Add Todo</button>
      </form>
    );
  }

}
