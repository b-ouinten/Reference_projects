import React from "react";
import "./index.scss";


const ListGroupItem = ({ handleFilter, name, id, text }) => {
    const handleClick = (event) => {
        handleFilter({ name: event.target.name, id: event.target.id, checked: event.target.checked });
    }
    return (
        <li className="list-group-item"><input type="checkbox" name={name} id={id} className="mr-4" onClick={handleClick} />{text}</li>
    )
}


export default ListGroupItem;