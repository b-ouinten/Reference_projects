import React, { useContext } from "react";
import { parseDate } from "../../helpers/parseDate";
import { capitalize } from "../../helpers/string";
import API_REQUEST from "../../services/ApiRequest/ApiRequest";
import Cookies from "js-cookie";
import { API_ENDPOINTS } from "../../services/ApiRequest/config/config";
import isUserSignIn from "../../helpers/signActions";
import { Link, useHistory } from "react-router-dom";
import modalContext from "../../context/modalContext";
import useCurrentUserId from '../../hooks/useCurrentUserId';
import useCurrentUserJwtToken from '../../hooks/useCurrentUserJwtToken';
import useCurrentLocation from '../../hooks/useCurrentLocation';


const ModalContentEvent = ({ title, start, end, seatLeft, allDay, resource, currentLocation, ...rest }) => {

    const history = useHistory()

    // helper to for redirection redirect
    const redirect = (url) => {
        history.push(url)

    }

    // Custom hook to get currentuserId
    const userId = useCurrentUserId();
    // Custom hook to get current user jwt token
    const userJwtToken = useCurrentUserJwtToken();
    const appPath = useCurrentLocation();
    // context method to set modal opened or closed
    const { setModalIsOpen } = useContext(modalContext)


    // method to subscribe current user to a formation of his choice
    const handleUserSubscription = async ({ formation_id, id }) => {

        if (isUserSignIn()) {
            const datas = {
                "formation_attendance": {
                    "formation_id": `${formation_id}`,
                    "formation_session_id": `${id}`
                }
            }
            const response = await API_REQUEST.create(datas, API_ENDPOINTS['formation_attendances'], true, userJwtToken);
            if (response.status == 201) {
                setModalIsOpen(false)
                redirect("/profile")
            }
        } else {
            console.log("You have to be signed in to make this action")
        }

    }

    // method to unsubscribe current user to an attendance of his choice
    const handleUserUnSubscription = async ({ formation_attendance }) => {
        if (isUserSignIn()) {

            const response = await API_REQUEST.delete(API_ENDPOINTS['formation_attendances'] + `/${formation_attendance.id}`, true, userJwtToken);

            if (response.ok) {
                setModalIsOpen(false)
            }

        } else {
            console.log("You have to be signed in to make this action")
        }

    }

    return (
        <>
            <h2 className="text-center">{title && capitalize(title)}</h2>

            <h5>Date de début</h5>

            <h5>{start && parseDate(start)}</h5>

            <h5> Date de fin :</h5>

            <h5>{end && parseDate(end)}</h5>

            <h5>Nombre de place restante :</h5>

            <h5>{seatLeft && seatLeft}</h5>

            {
                isUserSignIn() && appPath == "/profile" &&

                (
                    <div className="row">
                        <button className="btn btn-scheme-2 btn-lg col-12 my-4" onClick={() => handleUserUnSubscription(resource)} type="submit" >ANNULER</button>
                    </div>
                )

            }

            {
                isUserSignIn() && appPath != "/profile" &&
                (

                    (
                        <div className="row">
                            <button className="btn btn-scheme-2 btn-lg col-12 my-4" onClick={() => handleUserSubscription(resource)} type="submit" >JE PARTICIPE</button>
                        </div>
                    )

                )
            }

            {
                !isUserSignIn() &&
                (
                    <div className="row">
                        <Link to="/signin" className="btn btn-scheme-2 btn-lg col-12 my-4" onClick={() => setModalIsOpen(false)}>SE CONNECTER</Link>
                    </div>
                )

            }


        </>

    )
}

export default ModalContentEvent
