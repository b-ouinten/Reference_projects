import React from "react";
import "./index.scss";

const CheckBoxCard = ({ handleAccountChoice, id, label }) => {
    return (
        <div className="btn btn-lg col-12 my-4 bg-white btn-scheme checkbox-card" id={id} onClick={() => handleAccountChoice(id)}>
            <p>{label}</p>
        </div>
    )
}

export default CheckBoxCard;