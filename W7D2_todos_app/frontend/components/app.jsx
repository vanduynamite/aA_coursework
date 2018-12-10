import React from 'react';
import Todo from './todos/todo_list_container';

const App = ({ store }) => {
  return (
    <div>
      <h1 className="title">Todos App</h1>
      <Todo />
    </div>
  );
};

export default App;
