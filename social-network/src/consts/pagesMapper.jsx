import React from 'react';

import Home from '../pages/home';
import Login from '../pages/login';
import Registration from '../pages/registration';
import Profile from '../pages/profile';

const pagesMap = {
  '': {
    label: 'Home',
    page: <Home />,
  },
  login: {
    label: 'Login',
    page: <Login />,
  },
  register: {
    label: 'Join us',
    page: <Registration />,
  },
  profile: {
    label: 'Profile',
    page: <Profile />,
  },
};

export default pagesMap;
