import "bootswatch/dist/cyborg/bootstrap.min.css";

import React, { useEffect } from 'react';
import { useDispatch } from "react-redux";

import Navbar from "./Navbar";
import Routes from '../routes';
import { authCookieHandler } from '../tools';
import { authSuccess } from '../redux-config';

const { getAuthCookie } = authCookieHandler;

const App = () => {
  const dispatch = useDispatch();

  const authUserIfAuthCookieExist = () => {
    const authCookie = getAuthCookie();
    if (authCookie) { dispatch(authSuccess(authCookie.currentUserId)); }
  };

  useEffect(
    () => { authUserIfAuthCookieExist(); },
    [],
  );
  
  return (
    <>
      <Navbar />
      <Routes />
    </>
  )
};

export default App;
