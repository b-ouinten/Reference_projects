import React from 'react';

import Home from '../pages/Home';
import Register from '../pages/Register';
import Login from '../pages/Login';
import Calendar from '../pages/Calendar';
import Logout from '../pages/Logout';

const pagesMap = {
  '': {
    label: 'Home',
    page: <Home />,
  },
  register: {
    label: 'Join us',
    page: <Register />,
  },
  login: {
  label: 'Login',
  page: <Login />,
  },
  logout: {
    label: 'Logout',
    page: <Logout />,
  },
  calendar: {
    label: 'Sessions planning',
    page: <Calendar />,
  }
};

export default pagesMap;