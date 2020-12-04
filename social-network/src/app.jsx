// eslint-disable-next-line import/no-unresolved
import './app.scss';
import React from 'react';
import { Provider } from 'react-redux';
import SocialNetwork from './pages/socialNetwork';
import store from './redux/store';

const App = () => (
  <Provider store={store}>
    <SocialNetwork />
  </Provider>
);

export default App;
