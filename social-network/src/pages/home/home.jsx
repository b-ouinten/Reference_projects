import './home.scss';
import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';

import NewPostForm from './newPostForm';
import Post from './post';

import fetchPosts, { authSuccess } from '../../redux';
import { authCookieHandler } from '../../tools';

const { getAuthCookie } = authCookieHandler;

const Home = () => {
  const { posts } = useSelector((state) => state.postsState);

  const dispatch = useDispatch();

  useEffect(
    () => dispatch(fetchPosts()),
    [dispatch],
  );

  const authUserIfAuthCookieExist = () => {
    const authCookie = getAuthCookie();
    if (authCookie) { dispatch(authSuccess(authCookie.currentUserId)); }
  };

  useEffect(
    () => { authUserIfAuthCookieExist(); },
    [],
  );

  return (
    <div className="home">
      <p className="intro">
        Wazo is a social networking service on which users post and interact with messages.
        Registered users can post and like messages, but unregistered users can only read them.
      </p>
      <NewPostForm />
      <div className="posts">
        {
          posts.map((post) => <Post key={post.id} post={post} />)
        }
      </div>
    </div>
  );
};

export default Home;
