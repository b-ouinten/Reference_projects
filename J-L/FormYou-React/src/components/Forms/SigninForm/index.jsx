import React, { useState, useEffect } from "react";
// import { FormattedMessage } from 'react-intl';
import signinImage from "../../../assets/img/signin.jpg";
import FormGroup from "../../FormGroup/index";
import API_REQUEST from "../../../services/ApiRequest/ApiRequest";
import { API_ENDPOINTS } from "../../../services/ApiRequest/config/config.js";
import { useDispatch } from "react-redux";
import { setCurrentUser } from "../../../redux/actions";
import Cookies from "js-cookie";
import { useHistory } from "react-router-dom";

const SigninForm = () => {
	//STATES
	const [userDatas, setUserDatas] = useState(null);

	// importing dipatch actions
	const dispatch = useDispatch();

  // importing history form react router dom
  const history = useHistory();

  //analysing submit form
  const handleSubmit = (event) => {
    event.preventDefault();

    const form = event.currentTarget;
    const formdata = new FormData(form);

    const email = formdata.get("email");
    const password = formdata.get("password");

    setUserDatas({ ...userDatas, email: email, password: password });
  }

  // launch handle registration when userdatas update
  useEffect(() => {
    handleRegistration();
  }, [userDatas])

  const handleRegistration = async () => {

    if (!userDatas) { return }

    // destructuring object userDatas state containing user registration infos
    const { email, password } = userDatas

    // request to /signup token
    const response = await API_REQUEST.signIn(
      {
        user: {
          email: email,
          password: password
        }
      }
      , API_ENDPOINTS["signin"]);

    // accessing jwt token
    const jwt = response.headers.get("Authorization");

    if (jwt) {
      Cookies.set("jwt_token", jwt)

      // accessing data of response
      const data = await response.json();
      const { email: userEmail } = data.data.attributes;
      const { id: userId } = data.data;

      // constructing payload
      const payload = {
        id: userId, email: userEmail
      }

      // dispatching action to redux store
      dispatch(setCurrentUser(payload));
      localStorage.setItem("current_user", JSON.stringify(payload));
      history.push("/")
    }
  }

  return (
    <div className="container d-flex flex-column justify-content-center" style={{ minHeight: "95vh" }}>

      <div className="row col-12 border-0 p-0 border-neumorphic">

        <div className="col-6 p-0 d-none d-lg-block" style={{ height: "75vh" }}>
          <img src={signinImage} alt="signin image" className="h-100 w-100 m-0 p-0" />
        </div>

        <div className="col-lg-6 col-12 bg-white p-4 d-flex flex-column justify-content-around" style={{ height: "75vh" }}>
          <form action="" onSubmit={handleSubmit}>
            <h1 className="my-5">CONNEXION</h1>
            <FormGroup label="Adresse email:" inputName="email" inputId="email" inputType="text" placeholder="email@example.com" />
            <FormGroup label="Mot de passe:" inputName="password" inputId="password" inputType="password" />
            <button className="btn btn-scheme-2 btn-lg col-12 my-4" type="submit" >VALIDER</button>
          </form>
        </div>

      </div>

    </div>
  );
};

export default SigninForm;
