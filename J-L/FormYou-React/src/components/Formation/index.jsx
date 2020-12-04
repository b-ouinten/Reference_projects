import React from "react";
import { Redirect, useHistory } from "react-router-dom";
import { capitalize } from "../../helpers/string";
import "./index.scss";
import firstNWords from '../../helpers/firstTenWords';

const Formation = ({ id, title, description, created_at, updated_at }) => {


    const history = useHistory()

    // helper to for redirection redirect
    const redirect = (url) => {
        history.push(url)

    }


    return (
        <div className="card p-4 border-rounded" onClick={() => redirect(`/formation/${id}`)} id={id}>


            <div className="row">


                <div className="col-4 d-flex flex-column justify-content-center">

                    <img src="https://images.pexels.com/photos/6335/man-coffee-cup-pen.jpg" alt="" className="img-fluid" />

                </div>

                <div className="col-8">

                    <h5>{capitalize(title)}</h5>

                    {
                        description && <p>{firstNWords(description)}</p>
                    }

                </div>



            </div>


        </div>
    )

}

export default Formation