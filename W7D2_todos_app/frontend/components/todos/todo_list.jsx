import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

export default class TodoList extends React.Component {

  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const { todos, errors, deleteTodo, createTodo, updateTodo } = this.props;

    const lis = todos.map(todo => {
      return (<TodoListItem
      key={todo.id}
      todo={todo}
      deleteTodo={deleteTodo}
      createTodo={createTodo}
      updateTodo={updateTodo}/>);
    });

    return (
      <div className="total-body-workout">
        <ul>
          {lis}
        </ul>

        <TodoForm
          submit={createTodo}
          errors={errors}
          />
      </div>
    );
  }
}
