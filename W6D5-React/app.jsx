import React from 'react';
import ReactDOM from 'react-dom';
import Calculator from './calculator';
// import Congrats from './congrats';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Calculator/>, root);
});
