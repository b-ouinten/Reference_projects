import React from 'react';
import ReactDOM from 'react-dom';
import {
  BrowserRouter as Router
} from "react-router-dom";
import { Provider } from 'react-redux';

import App from '../components/app';
import store from '../redux-config/store';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Router>
      <Provider store={store}>
        <App />
      </Provider>
    </Router>,
    document.body.appendChild(document.createElement('div')),
  )
})
