/* eslint-disable react/prop-types */
import './deauthButton.scss';
import React from 'react';
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux';

import { handleDeauth } from '../../../redux';

import logoutIcon from '../../../assets/icons/logout.png';

const DeauthButton = () => {
  const history = useHistory();
  const dispatch = useDispatch();

  const logout = () => {
    dispatch(handleDeauth());
    history.push('/login');
  };

  const handleOnClick = () => { logout(); };

  return (
    <button type="button" className="deauth-button" onClick={handleOnClick}>
      <img src={logoutIcon} alt="deauth" width="23" height="23" />
      <span>Logout</span>
    </button>
  );
};

export default DeauthButton;
