import React from "react";
import Cookies from 'js-cookie';
import jwt_decode from 'jwt-decode';

const useCurrentUserId = () => {

    if (Cookies.get('jwt_token')) {
        const jwt_token = Cookies.get('jwt_token');
        const user_id = jwt_decode(jwt_token).sub;
        return user_id;
    }
    else {
        return null
    }
}

export default useCurrentUserId;
