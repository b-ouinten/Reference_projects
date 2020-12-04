import Cookies from 'js-cookie';

const isUserSignIn = () => {
    if (Cookies.get("jwt_token") ) {
        return true;
    } else {
        return false
    }
}


export default isUserSignIn;