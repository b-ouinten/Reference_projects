import './login.scss';
import React from 'react';
import Auth from '../auth/auth';

const Login = () => (
  <Auth type="login">
    <label htmlFor="identifier">
      Identifier
      <input type="text" placeholder="Enter username or email" name="identifier" />
    </label>

    <label htmlFor="password">
      Password
      <input type="password" placeholder="Enter password" name="password" />
    </label>
  </Auth>
);

export default Login;
