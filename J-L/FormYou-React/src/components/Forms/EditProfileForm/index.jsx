import React, { useEffect, useState } from "react";
import FormGroup from "../../FormGroup/index";
import jwt_decode from "jwt-decode";
import Cookies from "js-cookie";
import API_REQUEST from "../../../services/ApiRequest/ApiRequest";
import { API_ENDPOINTS } from "../../../services/ApiRequest/config/config";

const EditProfileForm = ({}) => {
	const [userDatas, setUserDatas] = useState({});

	const handleUpdateProfile = async (event) => {
		event.preventDefault();

		const firstNameInputValue = document.querySelector("#firstname").value;
		const lastNameInputValue = document.querySelector("#lastname").value;
		const emailInputValue = document.querySelector("#lastname").value;
		const passwordInputValue = document.querySelector("#password").value;
		const passwordConfirmationValue = document.querySelector(
			"#password_confirmation",
		).value;
		const ageInputValue = document.querySelector("#age").value;

		if (
			firstNameInputValue !== "" &&
			lastNameInputValue !== "" &&
			emailInputValue !== "" &&
			passwordInputValue !== "" &&
			passwordConfirmationValue !== "" &&
			ageInputValue !== ""
		) {
			if (passwordInputValue === passwordConfirmationValue) {
				const jwt_token = Cookies.get("jwt_token");
				const user_id = jwt_decode(jwt_token).sub;

				const user_role = await API_REQUEST.find(
					API_ENDPOINTS["users"] + `/${user_id}/roles`,
					true,
					jwt_token,
				);

				const response = await API_REQUEST.update(
					{
						user: {
							first_name: firstNameInputValue,
							last_name: lastNameInputValue,
							email: emailInputValue,
							password: passwordInputValue,
							password_confirmation: passwordConfirmationValue,
							age: ageInputValue,
							role_id: user_role.id,
						},
					},

					API_ENDPOINTS["users"] + `/${user_id}`,
					true,
					jwt_token,
				).then((e) => e.json());

				console.log(response);
			}
		} else {
			console.error("All fields must be filled");
		}
	};

	useEffect(() => {
		const fetchUserDatas = async () => {
			const jwt_token = Cookies.get("jwt_token");
			const user_id = jwt_decode(jwt_token).sub;
			const response = await API_REQUEST.find(
				API_ENDPOINTS["users"] + `/${user_id}`,
				true,
				jwt_token,
			);
			setUserDatas(response);
		};

		fetchUserDatas();
	}, []);

	return (
		<form action="">
			<h1 className="text-center">Votre profil</h1>

			<FormGroup
				label="Prenom:"
				inputName="firstname"
				inputId="firstname"
				inputType="text"
			/>

			<FormGroup
				label="Nom:"
				inputName="lastname"
				inputId="lastname"
				inputType="text"
			/>

			<FormGroup
				label="Age:"
				inputName="age"
				inputId="age"
				inputType="number"
			/>

			<FormGroup
				label="Adresse email:"
				inputName="email"
				inputId="email"
				inputType="text"
				value={userDatas?.data?.attributes?.email}
			/>
			<FormGroup
				label="Mot de passe:"
				inputName="password"
				inputId="password"
				inputType="password"
			/>
			<FormGroup
				label="Confirmer le mot de passe:"
				inputName="password_confirmation"
				inputId="password_confirmation"
				inputType="password"
			/>

			<button
				className="btn btn-scheme-2 btn-lg col-12 my-4"
				type="submit"
				onClick={handleUpdateProfile}
			>
				VALIDER
			</button>
		</form>
	);
};

export default EditProfileForm;
