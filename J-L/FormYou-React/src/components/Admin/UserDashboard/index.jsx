import React, { useState, useEffect} from "react";
import { Modal, Button } from "react-bootstrap";
import TickIcon from "../../../assets/icons/acc-den-tick.svg";
import TrashIcon from "../../../assets/icons/trash.svg";
import API_REQUEST from '../../../services/ApiRequest/ApiRequest';
import Cookies from "js-cookie";

const UserDashboard = () => {
	
	//STATES
	const [show, setShow] = useState(false);
	const [users, setUsers] = useState([]);
	const [userSelected, setUserSelected] = useState({});

	const handleClose = () => setShow(false);
	
	const handleShow = (user) => {
		setUserSelected(user)
		setShow(true);
	}

	useEffect(() => {
		handleUsers();
	}, [show])

	const handleUsers = async () => {
	
		// request to /users
		const response = await API_REQUEST.find("/users");
		setUsers(response);
	}

	const editUserStatus = async (status) => {

		//request to PUT /users
		const response = await API_REQUEST.update(
			{
				user: {
					is_validated: status
				}
			},
			`/users/${userSelected.id}`,
			true,
			Cookies.get("jwt_token")
			);

		handleClose()
	}

	const deleteUser = async (user) => {
	
		//request to DELETE /users
		const response = await API_REQUEST.delete(
			`/users/${user.id}`,
			true,
			Cookies.get("jwt_token")
			);

		handleUsers()
	}

	return (
		<div>
			<table className="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Prénom</th>
						<th scope="col">Nom</th>
						<th scope="col">Age</th>
						<th scope="col">Email</th>
						<th scope="col">Rôle</th>
						<th scope="col">Accepté</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					{ users.map((user) => (
						<tr>
							<th scope="row">{user.id}</th>
							<td>{user.first_name}</td>
							<td>{user.last_name}</td>
							<td>
							{
								user.age
							}
							{
								!user.age &&
									"Non renseigné"
							}
							</td>
							<td>{user.email}</td>
							<td>
							{
								user.role_id === 1 &&
								"Student"
							}
							{
								user.role_id === 2 &&
								"Admin"
							}
							{
								user.role_id === 3 &&
								"Teacher"
							}
							</td>
							<td>
							{
								user.is_validated &&
								  	"Oui"
							}
							{
								!user.is_validated &&
									"Non"
							}
							</td>
							<td>
								<a href="#">
									<img
										src={TrashIcon}
										alt="Delete a user"
										width="25"
										height="25"
										onClick={() => deleteUser(user)}
									/>
								</a>
							</td>
							<td>
								<a href="#">
									<img
										src={TickIcon}
										alt="Accept or refuse user"
										width="25"
										height="25"
										onClick={() => handleShow(user)}
									/>
								</a>
							</td>
						</tr>	
					))}
				</tbody>
			</table>

				<Modal show={show} onHide={handleClose}>
					<Modal.Header closeButton>
					<Modal.Title>{`${userSelected.first_name} ${userSelected.last_name}`}</Modal.Title>
					</Modal.Header>
					<Modal.Body>Mettre à jour le statut de cet utilisateur</Modal.Body>
					<Modal.Footer>
					<Button variant="success" onClick={() => editUserStatus(true)}>
						Valider
					</Button>
					<Button variant="danger" onClick={() => editUserStatus(false)}>
						Refuser
					</Button>
					</Modal.Footer>
				</Modal>

		</div>
	);
};

export default UserDashboard;

