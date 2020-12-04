import { FETCH_POSTS_REQUEST, FETCH_POSTS_SUCCESS, FETCH_POSTS_FAILED } from './postsTypes';
import API from '../../api/API';

const fetchPostsRequested = () => ({
  type: FETCH_POSTS_REQUEST,
});

const fetchPostsSuccess = (posts) => ({
  type: FETCH_POSTS_SUCCESS,
  posts,
});

const fetchPostsFailed = (error) => ({
  type: FETCH_POSTS_FAILED,
  error,
});

const fetchPosts = () => (dispatch) => {
  dispatch(fetchPostsRequested());
  API.getPosts()
    .then((result) => {
      if (result.error) {
        dispatch(fetchPostsFailed(result.message));
      } else dispatch(fetchPostsSuccess(result));
    })
    .catch((error) => {
      dispatch(fetchPostsFailed(error));
    });
};

export default fetchPosts;
