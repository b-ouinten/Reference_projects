import './profile.scss';
import React, { useState, useEffect } from 'react';
import API from '../../api/API';

const { getProfile } = API;

const Profile = () => {
  const [currentUser, setCurrentUser] = useState({});
  const { username, email, description } = currentUser;

  useEffect(
    () => getProfile()
      .then((result) => {
        if (result.error) console.log(result.message);
        else setCurrentUser(result);
      }).catch((error) => console.log(error)),
    [],
  );

  return (
    <div className="profile">
      <h1>{username}</h1>
      <p className="email">{email}</p>
      <p className="description">{description}</p>
    </div>
  );
};

export default Profile;
