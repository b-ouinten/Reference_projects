import {
  AUTH_REQUEST, AUTH_SUCCESS, AUTH_FAILED, DEAUTH,
} from './authTypes';

const initialState = {
  ongoing: false,
  isAuthenticated: false,
  id: null,
  error: '',
};

const authReducer = (state = initialState, { type, id, error }) => {
  switch (type) {
    case AUTH_REQUEST:
      return {
        ...state,
        ongoing: true,
      };
    case AUTH_SUCCESS:
      return {
        ...state,
        ongoing: false,
        isAuthenticated: true,
        id,
        error: '',
      };
    case AUTH_FAILED:
      return {
        ...state,
        ongoing: false,
        error,
      };
    case DEAUTH:
      return {
        ...state,
        isAuthenticated: false,
        id: null,
      };
    default: return state;
  }
};

export default authReducer;
