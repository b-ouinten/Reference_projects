import './registration.scss';
import React from 'react';
import Auth from '../auth/auth';

const Registration = () => (
  <Auth type="registration">
    <label htmlFor="username">
      Username
      <input type="text" placeholder="Enter a username" name="username" />
    </label>

    <label htmlFor="email">
      Email
      <input placeholder="Enter an email" name="email" />
    </label>

    <label htmlFor="password">
      Password
      <input type="password" placeholder="Enter a password" name="password" />
    </label>
  </Auth>
);

export default Registration;
