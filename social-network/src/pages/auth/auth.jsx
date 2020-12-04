/* eslint-disable react/prop-types */
import './auth.scss';
import React, { useState, useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { Redirect } from 'react-router-dom';
import { handleAuth } from '../../redux';

const Auth = ({ children, type }) => {
  const { isAuthenticated, error } = useSelector((state) => state.authState);
  const dispatch = useDispatch();

  const [alert, setAlert] = useState(null);

  const handleSubmit = (event) => {
    event.preventDefault();
    const data = new FormData(event.target);
    const inputs = Array.from(data.entries());
    const identifiers = Object.fromEntries(inputs);

    const errors = inputs.reduce((acc, input) => (input[1] === '' ? [...acc, input[0]] : []), []);

    if (errors.length) setAlert((`You must provide ${errors.length < 3 ? errors.join(' and ') : errors.join(', ')}.`));
    else {
      setAlert(null);
      dispatch(handleAuth(identifiers, type));
    }
  };

  useEffect(
    () => {
      setAlert(error);
    },
    [error],
  );

  const handleOnInput = () => setAlert(null);

  if (isAuthenticated) return <Redirect to="/" />;

  return (
    <div className="auth">
      <form onSubmit={handleSubmit} onInput={handleOnInput}>
        <div className="container">
          {
            alert && (
            <div className="warning">
              <p>{alert}</p>
            </div>
            )
          }

          {children}

          <button type="submit">Submit</button>
        </div>
      </form>
    </div>
  );
};

export default Auth;
