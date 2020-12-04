import { FETCH_POSTS_REQUEST, FETCH_POSTS_SUCCESS, FETCH_POSTS_FAILED } from './postsTypes';

const initialState = {
  loading: false,
  posts: [],
  error: '',
};

const postsReducer = (state = initialState, { type, posts, error }) => {
  switch (type) {
    case FETCH_POSTS_REQUEST:
      return {
        ...state,
        loading: true,
      };
    case FETCH_POSTS_SUCCESS:
      return {
        ...state,
        loading: false,
        posts,
        error: '',
      };
    case FETCH_POSTS_FAILED:
      return {
        ...state,
        loading: false,
        error,
      };
    default: return state;
  }
};

export default postsReducer;
