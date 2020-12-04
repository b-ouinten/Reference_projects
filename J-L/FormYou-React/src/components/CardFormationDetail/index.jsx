import React from "react";
import { capitalize } from "../../helpers/string";
import { useEffect, useState } from 'react';
import API_REQUEST from "../../services/ApiRequest/ApiRequest";
import { API_ENDPOINTS } from "../../services/ApiRequest/config/config";
import { parseDate } from "../../helpers/parseDate";

const CardFormationDetail = ({ formation_id, formation_details, formation }) => {

    useEffect(() => {

        const fetchFormation = async () => {
            const response = await API_REQUEST.find(API_ENDPOINTS["formations"] + `/${formation_id}`);
            formation_details(response)
        }

        fetchFormation()

    }, [])


    return (

        <div>

            <p className="text-muted">{formation && parseDate(formation.created_at)}</p>
            <h1>{formation && capitalize(formation.title)}</h1>


            <p className="my-4">{formation?.description}</p>

        </div>
    )

}

export default CardFormationDetail