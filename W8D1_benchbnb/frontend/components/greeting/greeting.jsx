import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ( { currentUser, logout } ) => {
  if (currentUser) {

    return (
      <header>
        <h2>
          Hi there, {currentUser.username}!
        </h2>
        <button onClick={ logout }>Log Out</button>
      </header>
    );
  } else {
    return (
      <header>
        <h2>
          Hi there!
        </h2>
        <Link to={'/login'}>Sign In</Link>
        <br></br>
        <Link to={'/signup'}>Sign Up</Link>
      </header>
    );
  }

};

export default Greeting;
