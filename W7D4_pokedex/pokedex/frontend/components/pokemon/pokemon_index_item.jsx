import React from 'react';
import { Link } from 'react-router-dom';

export default (props) => {
  const poke = props.poke;
  return (
    <li className="poke-li">
      <Link to={`/pokemon/${poke.id}`}>
        <img
          className="poke-pic"
          src={poke.image_url}></img>
        <span>{poke.name}</span>
      </Link>
    </li>
  );

};
