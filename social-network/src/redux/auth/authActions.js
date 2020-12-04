import {
  AUTH_REQUEST, AUTH_SUCCESS, AUTH_FAILED, DEAUTH,
} from './authTypes';

import API from '../../api/API';
import { authCookieHandler } from '../../tools';

const { setAuthCookie, removeAuthCookie } = authCookieHandler;

const authRequested = () => ({
  type: AUTH_REQUEST,
});

const authSuccess = (id) => ({
  type: AUTH_SUCCESS,
  id,
});

const authFailed = (error) => ({
  type: AUTH_FAILED,
  error,
});

const deauth = () => ({
  type: DEAUTH,
});

const handleAuth = (identifiers, type) => (dispatch) => {
  dispatch(authRequested());
  API.auth(identifiers, type)
    .then((result) => {
      if (result.error) {
        dispatch(authFailed(
          result.message[0].messages.map((message) => message.message).join(' '),
        ));
      } else {
        setAuthCookie(result.user.id, result.jwt);
        dispatch(authSuccess(result.user.id));
      }
    })
    .catch((error) => dispatch(authFailed(error)));
};

const handleDeauth = () => (dispatch) => {
  removeAuthCookie();
  dispatch(deauth());
};

export { handleAuth, authSuccess, handleDeauth };
