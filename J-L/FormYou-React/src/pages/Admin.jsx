import React, { useState } from "react";
import UserDashboard from "../components/Admin/UserDashboard";
import FormationsDashboard from "../components/Admin/FormationsDashboard";
import RoomDashboard from "../components/Admin/RoomDashboard";
import CategoryDashboard from "../components/Admin/CategoryDashboard";
import SessionDashboard from "../components/Admin/SessionDashboard";

const Admin = () => {
	const [dashboardStatus, setDashboardStatus] = useState("users");

	const switchDashboard = (x) => {
		setDashboardStatus(x);
	};

	const display = () => {
		if (dashboardStatus === "users") {
			return <UserDashboard />;
		} else if (dashboardStatus === "lessons") {
			return <FormationsDashboard />;
		} else if (dashboardStatus === "rooms") {
			return <RoomDashboard />;
		} else if (dashboardStatus === "categories") {
			return <CategoryDashboard />;
		} else if (dashboardStatus === "sessions") {
			return <SessionDashboard />;
		}
	};

	return (
		<div className="container d-flex flex-column justify-content-center">
			<h1 className="text-center mt-4">Tableau de commande</h1>
			<div className="btn-group mt-2 mb-4" role="group">
				<button
					onClick={() => switchDashboard("users")}
					className="btn btn-secondary"
				>
					Utilisateurs
				</button>
				<button
					onClick={() => switchDashboard("lessons")}
					className="btn btn-secondary"
				>
					Formations
				</button>
				<button
					onClick={() => switchDashboard("rooms")}
					className="btn btn-secondary"
				>
					Salles
				</button>
				<button
					onClick={() => switchDashboard("categories")}
					className="btn btn-secondary"
				>
					Catégories
				</button>
				<button
					onClick={() => switchDashboard("sessions")}
					className="btn btn-secondary"
				>
					Sessions
				</button>
			</div>
			{display()}
		</div>
	);
};

export default Admin;
