import React, { useState, useEffect } from "react";
import AddIcon from "../../../assets/icons/plus.svg";
import EditIcon from "../../../assets/icons/edit.svg";
import TrashIcon from "../../../assets/icons/trash.svg";
import { Modal, Button } from "react-bootstrap";
import API_REQUEST from "../../../services/ApiRequest/ApiRequest";
import Cookies from "js-cookie";

const RoomDashboard = () => {
	//STATES
	const [show, setShow] = useState(false);
	const [showCreateModal, setShowCreateModal] = useState(false);
	const [rooms, setRooms] = useState([]);
	const [roomSelected, setRoomSelected] = useState({});

	const handleClose = () => {
		setRoomSelected({});
		setShow(false);
	};

	const handleCloseCreateModal = () => {
		setShowCreateModal(false);
	};

	const handleShow = (room) => {
		setRoomSelected(room);
		setShow(true);
	};

	const handleShowCreateModal = () => {
		setShowCreateModal(true);
	};

	const handleRooms = async () => {
		// request to /formations
		const response = await API_REQUEST.find("/rooms");
		setRooms(response);
	};

	const createRoom = async (event) => {
		event.preventDefault();
		const form = event.currentTarget;
		const formdata = new FormData(form);

		const name = formdata.get("room-name");

		//request to POST /formations
		const response = await API_REQUEST.create(
			{
				room: {
					name: name,
				},
			},
			`/rooms`,
			true,
			Cookies.get("jwt_token"),
		);

		handleCloseCreateModal();
	};

	useEffect(() => {
		handleRooms();
	}, [show, showCreateModal]);

	const deleteRoom = async (room) => {
		//request to DELETE /rooms
		const response = await API_REQUEST.delete(
			`/rooms/${room.id}`,
			true,
			Cookies.get("jwt_token"),
		);

		handleRooms();
	};

	const editRoom = async (event) => {
		event.preventDefault();

		const form = event.currentTarget;
		const formdata = new FormData(form);

		const name = formdata.get("room-name");

		//request to PUT /rooms
		const response = await API_REQUEST.update(
			{
				room: {
					name: name,
				},
			},
			`/rooms/${roomSelected.id}`,
			true,
			Cookies.get("jwt_token"),
		);

		handleClose();
	};

	return (
		<div>
			<table className="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nom</th>
						<th scope="col">
							<a href="#">
								<img
									src={AddIcon}
									alt="Ajouter"
									width="25"
									height="25"
									onClick={handleShowCreateModal}
								/>
							</a>
						</th>
					</tr>
				</thead>
				<tbody>
					{rooms.map((room) => (
						<tr>
							<td scope="row">{room.id}</td>
							<td>{room.name}</td>
							<td>
								<a href="#">
									<img
										src={TrashIcon}
										alt="Delete a room"
										width="25"
										height="25"
										onClick={() => deleteRoom(room)}
									/>
								</a>
							</td>
							<td>
								<a href="#">
									<img
										src={EditIcon}
										alt="Éditer"
										width="25"
										height="25"
										onClick={() => handleShow(room)}
									/>
								</a>
							</td>
						</tr>
					))}
				</tbody>
			</table>

			<Modal show={show} onHide={handleClose}>
				<Modal.Header closeButton>
					<Modal.Title>{roomSelected.name}</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<form onSubmit={editRoom}>
						<p>Editer la salle de classe</p>

						<input name="room-name" type="text" placeholder="Nouveau nom" />
						<br />
						<Button variant="success" type="submit">
							Valider
						</Button>
						<Button variant="secondary" onClick={handleClose}>
							Annuler
						</Button>
					</form>
				</Modal.Body>
			</Modal>

			<Modal show={showCreateModal} onHide={handleCloseCreateModal}>
				<Modal.Header closeButton>
					<Modal.Title>Créer une salle de classe</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<form onSubmit={createRoom}>
						<input name="room-name" type="text" placeholder="Nom" />
						<br />
						<Button variant="success" type="submit">
							Valider
						</Button>
						<Button variant="secondary" onClick={handleCloseCreateModal}>
							Annuler
						</Button>
					</form>
				</Modal.Body>
			</Modal>
		</div>
	);
};

export default RoomDashboard;
