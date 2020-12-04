import React, { useState, useEffect } from "react";
import "./assets/scss/main.scss";
import {
	BrowserRouter as Router,
	Route,
	Switch,
	Redirect,
} from "react-router-dom";
import Navbar from "./components/Navbar";
import Home from "./pages/Home";
import SigninPage from "./pages/Signin";
import SignupPage from "./pages/Signup";
import Profile from "./pages/Profile";
import FormationsPage from "./pages/Formations";
import FormationPage from "./pages/Formation";
import Admin from "./pages/Admin";
import isUserSignIn from "./helpers/signActions";
import isAdmin from "./helpers/isAdmin";
import modalContext from "./context/modalContext";
import Modal from "./components/Modal/index";
import ModalContentEvent from "./components/ModalContentEvent/index";

const App = () => {
	const [isModalOpen, setModalIsOpen] = useState(false);
	const [modalContent, setModalContent] = useState(null);
	const [modalDatas, setModalDatas] = useState(null);

	//Private routes who do not need authentification
	const UnAuthRoute = ({ component: Component, ...rest }) => (
		<Route
			{...rest}
			render={(props) =>
				isUserSignIn() ? (
					<Redirect to={{ pathname: "/" }} />
				) : (
						<Component {...props} />
					)
			}
		/>
	);

	//Private routes who do need authentification
	const AuthRoute = ({ component: Component, ...rest }) => (
		<Route
			{...rest}
			render={(props) =>
				isUserSignIn() ? (
					<Component {...props} />
				) : (
						<Redirect to={{ pathname: "/signin" }} />
					)
			}
		/>
	);

	const AdminRoute = ({ component: Component, ...rest }) => (
		<Route
			{...rest}
			render={(props) =>
				isAdmin() ? (
					<Component {...props} />
				) : (
						<Redirect to={{ pathname: "/" }} />
					)
			}
		/>
	);

	return (
		<modalContext.Provider
			value={{
				isModalOpen,
				setModalIsOpen,
				modalContent,
				setModalContent,
				setModalDatas,
			}}
		>
			<div className="App">
				<Router>
					<Navbar />
					<section className="page">
						<Switch>
							<Route exact path="/">
								<Home />
							</Route>
							<Route exact path="/formations">
								<FormationsPage />
							</Route>
							<AuthRoute exact path="/formation/:id" component={FormationPage} />
							<UnAuthRoute path="/signin" component={SigninPage} />
							<UnAuthRoute path="/signup" component={SignupPage} />
							<AuthRoute path="/profile" component={Profile} />
							<AuthRoute path="/admin" component={Admin} />
						</Switch>
					</section>
					<Modal modalContent={modalContent} datas={modalDatas} />
				</Router>
			</div>
		</modalContext.Provider>
	);
};

export default App;
