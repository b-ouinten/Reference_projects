import React, { useState } from "react";
import { useParams } from "react-router-dom";
import CardFormationDetail from "../components/CardFormationDetail";
import FormationSessionCalendar from "../components/FormationSessionCalendar";
import { useContext } from "react";
import modalContext from "../context/modalContext";

const FormationPage = () => {
	const { id } = useParams();

	const { isModalOpen } = useContext(modalContext);

	const [formation, setFormation] = useState(null);

	return (
		<div
			className={`container-fluid m-auto d-flex flex-column justify-content-center align-items-center ${
				isModalOpen && "mask"
			}`}
			style={{ minHeight: "95vh" }}
		>
			<h2 className="align-self-start px-4">
				Choisir une session de formation :
			</h2>

			<div className="row col-12 p-4">
				<div
					className="col-lg-7 col-12 d-block overflow-auto bg-white p-0"
					id="container-card-room"
				>
					{formation && (
						<FormationSessionCalendar formation_id={id} formation={formation} />
					)}
				</div>

				<div
					className="col-lg-4 offset-lg-1 col-12 border-neumorphic bg-white p-4 d-flex flex-column border-rounded"
					style={{ height: "max-content", maxHeight: "75vh" }}
				>
					<CardFormationDetail
						formation_id={id}
						formation={formation}
						formation_details={(value) => setFormation(value)}
					/>
				</div>
			</div>
		</div>
	);
};

export default FormationPage;
