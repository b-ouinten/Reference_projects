import React from "react";
import "./index.scss";


const FormGroup = ({ label, inputName, inputId, inputType, placeholder, value }) => {
    return (
        <div className="form-group">

            <label htmlFor="">{label}</label>

            <input type={inputType} className="form-control" name={inputName} id={inputId} placeholder={placeholder} value={value} />

        </div>
    )
}

export default FormGroup;