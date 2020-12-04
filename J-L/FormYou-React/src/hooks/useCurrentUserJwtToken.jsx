import React from "react";
import Cookies from 'js-cookie';

const useCurrentUserJwtToken = () => {
    return Cookies.get('jwt_token');
}

export default useCurrentUserJwtToken;