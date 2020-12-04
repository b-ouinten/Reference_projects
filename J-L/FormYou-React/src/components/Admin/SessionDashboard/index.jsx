import React, { useState, useEffect } from "react";
import AddIcon from "../../../assets/icons/plus.svg";
import EditIcon from "../../../assets/icons/edit.svg";
import API_REQUEST from "../../../services/ApiRequest/ApiRequest";
import TrashIcon from "../../../assets/icons/trash.svg";
import Cookies from "js-cookie";
import { Modal, Button } from "react-bootstrap";

const SessionDashboard = () => {
	//STATES
	const [show, setShow] = useState(false);
	const [showCreateModal, setShowCreateModal] = useState(false);
	const [sessions, setSessions] = useState([]);
	const [sessionSelected, setSessionSelected] = useState({});
	const [formations, setFormations] = useState([]);

	const handleClose = () => {
		setSessionSelected({});
		setShow(false);
	};

	const handleCloseCreateModal = () => {
		setShowCreateModal(false);
	};

	const handleShow = (session) => {
		setSessionSelected(session);
		setShow(true);
	};

	const handleShowCreateModal = () => {
		setShowCreateModal(true);
	};

	useEffect(() => {
		handleSessions();
	}, [show, showCreateModal]);

	const handleSessions = async () => {
		// request to /formations
		const response = await API_REQUEST.find("/formations");
		setFormations(response);
	};

	return (
		<div>
			<table className="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Formation</th>
						<th scope="col">Capacité</th>
						<th scope="col">Salle</th>
						<th scope="col">
							<a href="#">
								<img src={AddIcon} alt="Ajouter" width="25" height="25" />
							</a>
						</th>
					</tr>
				</thead>
				<tbody>
					{sessions.map((session) => (
						<tr>
							<td>{session.id}</td>
							<td>{session.formation_id}</td>
							<td>{session.capacity} places</td>
							<td>{session.room_id}</td>
							<td>
								<a href="#">
									<img src={EditIcon} alt="Éditer" width="25" height="25" />
								</a>
							</td>
						</tr>
					))}
				</tbody>
			</table>
		</div>
	);
};

export default SessionDashboard;
