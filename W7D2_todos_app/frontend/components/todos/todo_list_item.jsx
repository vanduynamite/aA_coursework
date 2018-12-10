import React from 'react';

const TodoListItem = (props) => {
  const buttonText = props.todo.done ? "Mark Incomplete" : "Mark Complete";
  const klass = props.todo.done ? "complete" : "incomplete";

  const completeButtonClick = () => props.updateTodo({
    id: props.todo.id,
    title: props.todo.title,
    body: props.todo.body,
    done: !props.todo.done,
  });

  const deleteButtonClick = () => props.deleteTodo(props.todo);

  const listItemClick = (e) => {
    const curClass = e.target.className;

    if (curClass === "todo-item") {
      e.target.className = "todo-item-expanded";
    } else {
      e.target.className = "todo-item";
    }
  } ;

  return (
    <li className="todo-item"
      onClick={listItemClick} >
      <div className="todos">
        <p className="todo-title">{props.todo.title}</p>
        <p className="todo-body">{props.todo.body}</p>
      </div>

      <div className="buttons">
        <button
          className={klass}
          onClick={completeButtonClick}>
          {buttonText}
        </button>
        <button
          className="delete"
          onClick={deleteButtonClick}>
          Delete
        </button>
      </div>
    </li>
  );
};

export default TodoListItem;
