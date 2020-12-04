/* eslint-disable camelcase */
/* eslint-disable react/prop-types */
import './post.scss';
import React from 'react';
import { Link } from 'react-router-dom';
import faker from 'faker';
import { BsHeartFill, BsHeart } from 'react-icons/bs';
import { FaTrashAlt } from 'react-icons/fa';
import { useSelector } from 'react-redux';
import { dateHandler } from '../../../tools';

const { formatDate } = dateHandler;

const Post = ({
  post: {
    user, text, created_at, like,
  },
}) => {
  const { isAuthenticated } = useSelector((state) => state.authState);

  return (
    <div className="post">
      <div className="container">
        <div className="img-container">
          <img src={faker.image.avatar()} alt="Avatar" />
        </div>
        <div>
          <p className="header">
            <Link to="/author">{isAuthenticated && user.username}</Link>
            <span>
              {isAuthenticated && ' - '}
              {formatDate(created_at)}
            </span>
          </p>
          <p className="text">{text}</p>
        </div>
      </div>
      <div className="like-delete">
        <button type="button">
          <div>
            <BsHeartFill color="#f10054" size="16px" />
            <span>{like}</span>
          </div>
        </button>
        <button type="button">
          <div>
            <BsHeart color="#f10054" size="16px" />
            <span>{like}</span>
          </div>
        </button>
        <button type="button">
          <FaTrashAlt color="#f10054" size="16px" />
        </button>
      </div>
    </div>
  );
};

export default Post;
