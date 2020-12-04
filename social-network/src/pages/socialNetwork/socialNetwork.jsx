/* eslint-disable react/prop-types */
import './socialNetwork.scss';
import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Navbar from '../../components/navbar';
import PagesContainer from './pagesContainer';
import News from '../../components/news';

const SocialNetwork = () => (
  <div className="social-network">
    <Navbar />
    <div className="website-content">
      <Switch>
        <Route exact path="/">
          <PagesContainer />
        </Route>
        <Route path="/:slug">
          <PagesContainer />
        </Route>
      </Switch>
      <News />
    </div>
  </div>
);

export default SocialNetwork;
