/* eslint-disable no-underscore-dangle */
import {
  createStore, compose, applyMiddleware, combineReducers,
} from 'redux';
import middleware from 'redux-thunk';

import postsReducer from './posts/postsReducer';
import authReducer from './auth/authReducer';

const globalState = combineReducers({
  postsState: postsReducer,
  authState: authReducer,
});

const store = createStore(
  globalState,
  compose(
    applyMiddleware(middleware),
    window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
  ),
);

export default store;
