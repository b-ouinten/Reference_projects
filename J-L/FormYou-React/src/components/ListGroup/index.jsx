import React, { useState, useEffect } from "react";
import { capitalize } from "../../helpers/string";
import ListGroupItem from "../ListGroupItem/index";

const ListGroup = ({ categories, searchFilters }) => {
	const [activeFilters, setActiveFilters] = useState([]);

	const handleFilter = (value) => {
		if (activeFilters.find((e) => e.id === value.id)) {
			let otherFilters = activeFilters.filter((e) => e.id != value.id);
			setActiveFilters([...otherFilters]);
		} else {
			setActiveFilters([...activeFilters, value]);
		}
	};

	useEffect(() => {
		searchFilters(activeFilters);
	}, [activeFilters]);

	return (
		<ul className="list-group d-block overflow-auto" style={{ height: "45vh" }}>
			{categories.map((category) => {
				let { id, name, created_at, updated_at } = category;

				return (
					<ListGroupItem
						key={id}
						name={name}
						id={id}
						text={capitalize(name)}
						handleFilter={(value) => {
							handleFilter(value);
						}}
					/>
				);
			})}
		</ul>
	);
};

export default ListGroup;
