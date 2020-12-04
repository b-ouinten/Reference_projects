import { authCookieHandler } from '../tools';

const { getAuthCookie } = authCookieHandler;

const root = 'http://localhost:1337/';
const loginUrl = 'auth/local';
const registrationUrl = 'auth/local/register';
const profileUrl = 'users/me';

const urls = {
  login: loginUrl,
  registration: registrationUrl,
  profile: profileUrl,
};

const getPosts = () => fetch(`${root}posts?_limit=20&_sort=created_at:desc`)
  .then((response) => response.json());

const auth = (body, type) => fetch(`${root}${urls[type]}`, {
  method: 'post',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify(body),
})
  .then((response) => response.json());

const getProfile = () => fetch('http://localhost:1337/users/me', {
  method: 'get',
  headers: {
    Authorization: `Bearer ${getAuthCookie().token}`,
    'Content-Type': 'application/json',
  },
})
  .then((response) => response.json());

const API = {
  auth,
  getPosts,
  getProfile,
};

export default API;
