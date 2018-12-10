import React from 'react';
import { Route } from 'react-router-dom';
import Greeting from './greeting/greeting_container';
import Login from './session/login_form_container';
import Signup from './session/signup_form_container';

const App = () => {
  return (
    <div>
      <h1>Benchy Bench McBencherson</h1>
      <Greeting />
      <Route path='/signup' component={Signup} />
      <Route path='/login' component={Login} />
    </div>
  );
};

export default App;
