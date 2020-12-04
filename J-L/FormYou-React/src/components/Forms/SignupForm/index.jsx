import React, { useEffect, useState } from "react";
import signupImage from "../../../assets/img/signup.jpg";
import CheckBoxCard from "../../CheckoxCard/index";
import FormGroup from "../../FormGroup/index";
import API_REQUEST from "../../../services/ApiRequest/ApiRequest";
import { API_ENDPOINTS } from "../../../services/ApiRequest/config/config.js";
import { useDispatch } from "react-redux";
import Cookies from "js-cookie";
import { useHistory } from "react-router-dom";

const SignupForm = () => {
	// STATES
	const [currentStep, setCurrentStep] = useState(1);
	const [accountType, setAccountType] = useState("student");
	const [userDatas, setUserDatas] = useState({});
	const [roles, setRoles] = useState([]);

	// importing dipatch actions
	const dispatch = useDispatch();

	// importing history form react router dom
	const history = useHistory();

	// analysing submit form
	const handleClick = (event) => {
		event.preventDefault();

		if (currentStep === 1) {
			let firstname = document.querySelector("#firstname").value;
			let lastname = document.querySelector("#lastname").value;
			let email = document.querySelector("#email").value;
			let password = document.querySelector("#password").value;
			let password_confirmation = document.querySelector(
				"#password_confirmation",
			).value;

			setUserDatas({
				...userDatas,
				firstname: firstname,
				lastname: lastname,
				email: email,
				password: password,
				password_confirmation: password_confirmation,
			});
			setCurrentStep(2);
		} else {
			setCurrentStep(1);
		}
	};

	// listening for account choice by user
	const handleAccountChoice = (value) => {
		Array.from(document.querySelectorAll(".checkbox-card")).map((e) =>
			e.classList.remove("selected"),
		);
		document.querySelector(`#${value}`).classList.add("selected");

		value = value.split("-")[1];
		setAccountType(value);
	};

	const handleRegistration = async (event) => {
		// preventing default http behaviour
		event.preventDefault();

		// destructuring object userDatas state containing user registration infos
		let {
			firstname,
			lastname,
			email,
			password,
			password_confirmation,
			accountType: { id },
		} = userDatas;

		// request to /signup token
		const response = await API_REQUEST.signUp(
			{
				user: {
					first_name: firstname,
					last_name: lastname,
					email: email,
					password: password,
					password_confirmation: password_confirmation,
					role_id: accountType,
				},
			},
			API_ENDPOINTS["signup"],
		);

		// accessing jwt token
		const jwt = response.headers.get("Authorization");
		Cookies.set("jwt_token", jwt);

		// accessing data of response
		const current_user = await response.json().data;

		// constructing payload
		const payload = {
			current_user,
		};

		// dispatching action to redux store
		dispatch({
			type: "SET_CURRENT_USER",
			payload,
		});

		history.push("/profile");
	};

	// setting accountype
	useEffect(() => {
		setUserDatas({ ...userDatas, accountType: accountType });
	}, [accountType]);

	// loading roles at first load of app page
	useEffect(() => {
		const fetchRoles = async () => {
			const roles = await API_REQUEST.find(API_ENDPOINTS["roles"], false, null);

			setRoles(roles);
		};

		fetchRoles();
	}, []);

	return (
		<div
			className="container d-flex flex-column align-items-center justify-content-center"
			style={{ minHeight: "95vh" }}
		>
			<div className="row col-12 border-0 p-0  border-neumorphic">
				<div
					className="col-6 p-0 d-none d-lg-block border-neumorphic"
					style={{ height: "75vh" }}
				>
					<img
						src={signupImage}
						alt="signin image"
						className="h-100 w-100 m-0 p-0"
					/>
				</div>

				<div
					className="col-lg-6 col-12 bg-white px-4 d-block overflow-auto"
					style={{ height: "75vh", paddingTop: "5rem" }}
				>
					{currentStep === 2 && (
						<svg
							onClick={(event) => {
								handleClick(event);
							}}
							id="pevious-step"
							width="32"
							height="32"
							viewBox="0 0 32 32"
							fill="none"
							xmlns="http://www.w3.org/2000/svg"
						>
							<path
								d="M18.3944 29.5056L16.8088 31.0911C16.1375 31.7625 15.0519 31.7625 14.3877 31.0911L0.503515 17.2141C-0.167838 16.5428 -0.167838 15.4572 0.503515 14.793L14.3877 0.908789C15.059 0.237435 16.1446 0.237435 16.8088 0.908789L18.3944 2.49433C19.0729 3.17282 19.0586 4.27984 18.3658 4.94405L9.75963 13.1431H30.2859C31.2358 13.1431 32 13.9073 32 14.8572V17.1427C32 18.0926 31.2358 18.8568 30.2859 18.8568H9.75963L18.3658 27.0559C19.0657 27.7201 19.08 28.8271 18.3944 29.5056Z"
								fill="black"
							/>
						</svg>
					)}
					<form action="">
						<h1>INSCRIPTION</h1>

						<div className="row d-flex flex-wrap my-4">
							<div className="col-8 d-flex align-item-center">
								{currentStep === 1 ? (
									<h5>Informations de connexion</h5>
								) : (
									<h5>Type de compte </h5>
								)}
							</div>
							<div className="col-4 d-flex align-item-center">
								<span className="w-100 text-right">{currentStep}/2</span>
							</div>
						</div>

						{currentStep === 1 ? (
							<>
								<FormGroup
									label="Prenom:"
									inputName="firstname"
									inputId="firstname"
									inputType="text"
									placeholder="John"
								/>

								<FormGroup
									label="Nom:"
									inputName="lastname"
									inputId="lastname"
									inputType="text"
									placeholder="Doe"
								/>

								<FormGroup
									label="Adresse email:"
									inputName="email"
									inputId="email"
									inputType="text"
									placeholder="email@example.com"
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
									onClick={(event) => handleClick(event)}
								>
									VALIDER
								</button>
							</>
						) : (
							<>
								{roles.map(
									(role) =>
										role.name != "admin" && (
											<CheckBoxCard
												key={role.id}
												handleAccountChoice={(value) =>
													handleAccountChoice(value)
												}
												id={`${role.name}-${role.id}`}
												label={role.name.toUpperCase()}
											/>
										),
								)}

								<button
									className="btn btn-scheme-2 btn-lg col-12 my-4"
									type="submit"
									onClick={(event) => handleRegistration(event)}
								>
									VALIDER
								</button>
							</>
						)}
					</form>
				</div>
			</div>
		</div>
	);
};

export default SignupForm;
