import Cookies from 'js-cookie';
import jwt_decode from "jwt-decode";
import API_REQUEST from "../services/ApiRequest/ApiRequest"

const isAdmin = async () => {
  if(Cookies.get("jwt_token")){
    const token = Cookies.get("jwt_token");
    const user_id = jwt_decode(token.replace('Bearer%','')).sub;
    const response = await API_REQUEST.find(`/users/${user_id}/roles`, true, token);
    
    if (response.id === 2){
      console.log(true);
      return true
    } else {
      console.log(false);
      return false
    }

  } else {
    console.log(false);
    return false
  }
}

export default isAdmin;