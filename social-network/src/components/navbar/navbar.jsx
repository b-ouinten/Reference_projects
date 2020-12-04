import './navbar.scss';
import React from 'react';
import { useSelector } from 'react-redux';

import NavElem from './navElem';
import DeauthButton from './deauthButton';

import logo from '../../assets/icons/logo.png';
import home from '../../assets/icons/home.png';
import login from '../../assets/icons/login.png';
import register from '../../assets/icons/register.webp';
import profile from '../../assets/icons/profile.png';

const Navbar = () => {
  const { isAuthenticated } = useSelector((state) => state.authState);

  return (
    <ul className="navbar">
      <NavElem path="/" icon={logo} label="Wazo" width="50" height="50" className="logo" />
      <NavElem path="/" label="Home" icon={home} />
      {
        !isAuthenticated
        && (
          <>
            <NavElem path="/login" label="Login" icon={login} />
            <NavElem path="/register" label="Join us" icon={register} show={!isAuthenticated} />
          </>
        )
      }
      {
        isAuthenticated
        && (
          <>
            <NavElem path="/profile" label="Profile" icon={profile} />
            <DeauthButton />
          </>
        )
      }
    </ul>
  );
};

export default Navbar;
