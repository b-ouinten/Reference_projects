import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const SigninButton = () => {
	return (
		<li className="nav-item">
			<Link to="/signin" className="nav-link">
				Se connecter
			</Link>
		</li>
	);
};

export default SigninButton;
