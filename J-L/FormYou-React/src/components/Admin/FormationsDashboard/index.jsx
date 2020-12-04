import React, { useState, useEffect } from "react";
import AddIcon from "../../../assets/icons/plus.svg";
import EditIcon from "../../../assets/icons/edit.svg";
import API_REQUEST from "../../../services/ApiRequest/ApiRequest";
import TrashIcon from "../../../assets/icons/trash.svg";
import Cookies from "js-cookie";
import { Modal, Button } from "react-bootstrap";

const LessonsDashboard = () => {
	//STATES
	const [show, setShow] = useState(false);
	const [showCreateModal, setShowCreateModal] = useState(false);
	const [formations, setFormations] = useState([]);
	const [formationSelected, setFormationSelected] = useState({});
	const [teachers, setTeachers] = useState([]);
	const [categories, setCategories] = useState([]);
	const [formationCategories, setFormationCategories] = useState([]);

	const handleClose = () => {
		setFormationSelected({});
		setShow(false);
	};

	const handleCloseCreateModal = () => {
		setShowCreateModal(false);
	};

	const handleShow = (formation) => {
		setFormationSelected(formation);
		setShow(true);
	};

	const handleShowCreateModal = () => {
		setShowCreateModal(true);
	};

	useEffect(() => {
		handleFormations();
		handleTeachers();
		handleCategories();
		handleFormationCategories();
	}, [show, showCreateModal]);

	const handleFormations = async () => {
		// request to /formations
		const response = await API_REQUEST.find("/formations");
		setFormations(response);
	};

	const handleTeachers = async () => {
		let teachersArray = new Array();

		const response = await API_REQUEST.find("/users");
		response.forEach((user) => {
			if (user.role_id === 3) {
				teachersArray.push(user);
			}
		});

		setTeachers(teachersArray);
	};

	const handleCategories = async () => {
		const response = await API_REQUEST.find("/categories");
		setCategories(response);
	};

	const handleFormationCategories = async () => {
		const response = await API_REQUEST.find("/formation_categories");
		setFormationCategories(response);
	};

	const createFormationCategories = async (id, formation_id) => {
		//request to POST /categories
		const response = await API_REQUEST.create(
			{
				formation_category: {
					category_id: id,
					formation_id: formation_id,
				},
			},
			`/formation_categories`,
			true,
			Cookies.get("jwt_token"),
		);
	};

	const createFormation = async (event) => {
		event.preventDefault();
		const form = event.currentTarget;
		const categories_id = new Array();
		const formdata = new FormData(form);

		const title = formdata.get("formation-title");
		const description = formdata.get("formation-description");
		const teacher_id = formdata.get("teacher-select");
		categories_id.push(formdata.getAll("categories-select"));
		console.log(categories_id);

		//request to POST /formations
		const response = await API_REQUEST.create(
			{
				formation: {
					title: title,
					description: description,
					teacher_id: teacher_id,
				},
			},
			`/formations`,
			true,
			Cookies.get("jwt_token"),
		).then((e) => e.json());

		categories_id[0].forEach((category_id) => {
			createFormationCategories(category_id, response.id);
		});

		handleCloseCreateModal();
	};

	const deleteFormation = async (formation) => {
		//request to DELETE /formations
		const response = await API_REQUEST.delete(
			`/formations/${formation.id}`,
			true,
			Cookies.get("jwt_token"),
		);

		handleFormations();
	};

	const editFormation = async (event) => {
		event.preventDefault();

		const form = event.currentTarget;
		const categories_id = new Array();
		const formdata = new FormData(form);

		const title = formdata.get("formation-title");
		const description = formdata.get("formation-description");
		const teacher_id = formdata.get("teacher-select");
		categories_id.push(formdata.getAll("categories-select"));

		//request to PUT /users
		const response = await API_REQUEST.update(
			{
				formation: {
					title: title,
					description: description,
					teacher_id: teacher_id,
				},
			},
			`/formations/${formationSelected.id}`,
			true,
			Cookies.get("jwt_token"),
		);

		categories_id[0].forEach((category_id) => {
			createFormationCategories(category_id, formationSelected.id);
		});
		handleClose();
	};

	return (
		<div>
			<table className="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nom</th>
						<th scope="col">Description</th>
						<th scope="col">Professeur</th>
						<th scope="col">Catégories</th>
						<th scope="col">Créée le</th>
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
					{formations.map((formation) => (
						<tr>
							<th scope="row">{formation.id}</th>
							<td>{formation.title}</td>
							<td>{formation.description}</td>
							{teachers.map(
								(teacher) =>
									teacher.id === formation.teacher_id && (
										<td>{teacher.first_name}</td>
									),
							)}
							<td>
								{formationCategories.map(
									(formationCategory) =>
										formationCategory.formation_id === formation.id &&
										categories.map(
											(category) =>
												category.id === formationCategory.category_id && (
													<p>{category.name}</p>
												),
										),
								)}
							</td>
							<td>{formation.created_at}</td>
							<td>
								<a href="#">
									<img
										src={TrashIcon}
										alt="Delete a formation"
										width="25"
										height="25"
										onClick={() => deleteFormation(formation)}
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
										onClick={() => handleShow(formation)}
									/>
								</a>
							</td>
						</tr>
					))}
				</tbody>
			</table>

			<Modal show={show} onHide={handleClose}>
				<Modal.Header closeButton>
					<Modal.Title>{formationSelected.title}</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<form onSubmit={editFormation}>
						<p>Editer la formation</p>

						<input
							name="formation-title"
							type="text"
							placeholder="Nouveau titre"
						/>
						<br />
						<textarea
							name="formation-description"
							placeholder="Nouvelle description"
						/>
						<br />
						<hr />
						<select name="teacher-select">
							{teachers.map((teacher) =>
								teacher.id === formationSelected.teacher_id ? (
									<option value={teacher.id} selected>
										{teacher.first_name}
									</option>
								) : (
									<option value={teacher.id}>{teacher.first_name}</option>
								),
							)}
						</select>
						<br />
						<hr />
						<fieldset>
							<legend>Selectionnez des catégories</legend>
							{categories.map((category) => (
								<>
									<label for="categories-select">{category.name}</label>
									<br />
									<input
										type="checkbox"
										name="categories-select"
										value={category.id}
									/>
									<br />
								</>
							))}
						</fieldset>
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
					<Modal.Title>Créer une formation</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<form onSubmit={createFormation}>
						<input
							name="formation-title"
							type="text"
							placeholder="Nouveau titre"
						/>
						<br />
						<textarea
							name="formation-description"
							placeholder="Nouvelle description"
						/>
						<br />
						<hr />
						<select name="teacher-select">
							{teachers.map((teacher) => (
								<option value={teacher.id}>{teacher.first_name}</option>
							))}
						</select>
						<br />
						<hr />
						<fieldset>
							<legend>Selectionnez des catégories</legend>
							{categories.map((category) => (
								<>
									<label for="categories-select">{category.name}</label>
									<br />
									<input
										type="checkbox"
										name="categories-select"
										value={category.id}
									/>
									<br />
								</>
							))}
						</fieldset>
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

export default LessonsDashboard;
