import React from "react";

import EditProfileForm from "../components/Forms/EditProfileForm/index";
import FormationAttendancesCalendar from "../components/FormationAttendancesCalendar/index";

const Profile = () => {
	return (
		<div
			className="container-fluid m-auto d-flex flex-column justify-content-center align-items-center"
			style={{ minHeight: "95vh" }}
		>
			<h2 className="align-self-start px-4">Vos évènements :</h2>

			<div className="row col-12 p-4">
				<div
					className="col-lg-7 col-12 d-block overflow-auto bg-white p-0"
					id="container-card-room"
				>
					<FormationAttendancesCalendar />
				</div>

				<div
					className="col-lg-4 offset-lg-1 col-12 border-neumorphic bg-white p-4 d-flex flex-column justify-content-around border-rounded"
					style={{ height: "75vh" }}
				>
					<EditProfileForm />
				</div>
			</div>
		</div>
	);
};

export default Profile;
