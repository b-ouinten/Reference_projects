import React, { useState, useEffect} from "react";
import AddIcon from "../../../assets/icons/plus.svg";
import EditIcon from "../../../assets/icons/edit.svg";
import TrashIcon from "../../../assets/icons/trash.svg";
import { Modal, Button } from "react-bootstrap";
import API_REQUEST from '../../../services/ApiRequest/ApiRequest';
import Cookies from "js-cookie";

const CategoryDashboard = () => {

		//STATES
		const [show, setShow] = useState(false);
		const [showCreateModal, setShowCreateModal] = useState(false);
		const [categories, setCategories] = useState([]);
		const [categorySelected, setCategorySelected] = useState({});

		const handleClose = () => {
			setCategorySelected({});
			setShow(false);
		}
	
		const handleCloseCreateModal = () => {
			setShowCreateModal(false);
		}
	
		const handleShow = (category) =>  {
			setCategorySelected(category);
			setShow(true);
		}
	
		const handleShowCreateModal = () =>  {
			setShowCreateModal(true);
		}
	
		const handleCategories = async () => {
		
			// request to /formations
			const response = await API_REQUEST.find("/categories");
			setCategories(response);
		}

		useEffect(() => {
			handleCategories();
		}, [show, showCreateModal])

		const deleteCategory = async (category) => {
			//request to DELETE /categories
			const response = await API_REQUEST.delete(
				`/categories/${category.id}`,
				true,
				Cookies.get("jwt_token")
			);

			handleCategories()
		}

		const createCategory = async (event) => {
			event.preventDefault();
			const form = event.currentTarget;
			const formdata = new FormData(form);
	
			const name = formdata.get("category-name");
	
			//request to POST /formations
			const response = await API_REQUEST.create(
				{
					category: {
						name: name
					}
				},
				`/categories`,
				true,
				Cookies.get("jwt_token")
			)
	
			handleCloseCreateModal();
	
		}

		const editCategory = async (event) => {
			event.preventDefault();
	
			const form = event.currentTarget;
			const formdata = new FormData(form);
	
			const name = formdata.get("category-name");
	
			
			//request to PUT /categories
			const response = await API_REQUEST.update(
				{
					category: {
						name: name
					}
				},
				`/categories/${categorySelected.id}`,
				true,
				Cookies.get("jwt_token")
				);
	
			handleClose();
		}
	

	
	return (
		<div>
			<table className="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Name</th>
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
					{  categories.map((category) => (
						<tr>
							<td scope="row">{category.id}</td>
							<td>{category.name}</td>
							<td>
								<a href="#">
									<img
										src={TrashIcon}
										alt="Ajouter"
										width="25"
										height="25"
										onClick={() => deleteCategory(category)}
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
										onClick={() => handleShow(category)}
									/>
								</a>
							</td>
						</tr>
					))
					}
				</tbody>
			</table>

			<Modal show={show} onHide={handleClose}>
				<Modal.Header closeButton>
				<Modal.Title>{categorySelected.name}</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<form onSubmit={editCategory}>
						<p>Editer la catégorie de formation</p>
						
						<input name="category-name" type="text" placeholder="Nouveau nom" /><br />
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
				<Modal.Title>Créer une catégorie de formation</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<form onSubmit={createCategory}>
						
						<input name="category-name" type="text" placeholder="Nom" /><br />
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

export default CategoryDashboard;
