/* eslint-disable react/prop-types */
import React from 'react';
import { Link } from 'react-router-dom';

const NavElem = ({
  path, icon, label, width, height, className,
}) => (
  <li>
    <Link to={path} className={className}>
      <img src={icon} alt={label} width={width || '23'} height={height || '23'} />
      <span>{label}</span>
    </Link>
  </li>
);

export default NavElem;
