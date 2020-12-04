import React, { useState, useEffect } from "react";
import Formation from '../components/Formation/index';
import CardSearch from '../components/CardSearch/index';
import { API_ENDPOINTS } from "../services/ApiRequest/config/config";
import API_REQUEST from '../services/ApiRequest/ApiRequest';

const FormationsPage = () => {

    // STATE CONTAINING ALL FORMATIONS DISPLAYED IN THE PAGE (LEFT SIDE)
    const [formations, setFormations] = useState([]);

    // STATE CONTAINING CATEGORIES DISPLAYED ON THE SEARCH CARD (RIGHT SIDE)
    const [categories, setCategories] = useState([]);

    // STATE CONTAINING CURRENT FILTERS APPLIED ON THE FORMATION DISPLAY
    const [searchFilters, setSearchFilters] = useState([]);

    const [searchValue, setSearchValue] = useState("");

    // FUNCTION TO FETCH AND SET FORMATION STATE
    const fetchAndSetFormations = async () => {
        const formation_datas = await API_REQUEST.find(API_ENDPOINTS["formations"]);
        setFormations(formation_datas);
    }

    const handleSearchValue = (value) => {
        setSearchValue(value);
    }

    // FETCH AND SET FORMATION STATE AT FIRST LOAD OF THE PAGE (NO DEPENDENCIES)
    useEffect(() => {

        const setCategoriesANdFormations = async () => {
            fetchAndSetFormations()
            const categories = await API_REQUEST.find(API_ENDPOINTS["categories"])
            setCategories(categories);
        }
        setCategoriesANdFormations()


    }, []);


    // FETCH AND SET FORMATION STATE ACCORDING USER FILTERS
    useEffect(() => {

        const fetchFormations = async () => {
            setFormations([]);
            const category_promises = searchFilters.map((category_promise) => API_REQUEST.find(API_ENDPOINTS["categories"] + `/${category_promise.id}`));
            const categories = await Promise.all(category_promises).then((results) => results);
            const formations = [];
            categories.map((nested_formations) => nested_formations.map((formation) => formations.push(formation)));
            formations.length > 0 ? setFormations(formations) : fetchAndSetFormations();
        }

        fetchFormations();


    }, [searchFilters]);


    useEffect(() => {


        const fetchFormations = async () => {
            const formations = await API_REQUEST.find(API_ENDPOINTS["formations"]);
            if (searchValue.length > 2) {
                setFormations([]);
                const regexp = new RegExp(searchValue.toLowerCase(), 'g')
                const selected_formations = formations.filter((formation) => {
                    return formation.title.toLowerCase().match(regexp)?.length > 0 || formation.description.toLowerCase().match(regexp)?.length > 0
                });

                setFormations(selected_formations)
            } else {
                setFormations(formations)
            }
        }


        fetchFormations();


    }, [searchValue])

    // RENDER
    return (
        <div className="container-fluid m-auto d-flex flex-column justify-content-center align-items-center" style={{ minHeight: "95vh" }}>

            <h2 className="align-self-start px-4">Les Formations disponibles:</h2>

            <div className="row p-4">

                <div className="col-lg-8 col-12 d-block overflow-auto" id="container-card-room">

                    <div className="card-columns">

                        {
                            formations.map((formation) => {
                                let { id, title, description, created_at, updated_at } = formation;
                                return <Formation key={id} id={id} title={title} description={description} created_at={created_at} updated_at={updated_at} />
                            })
                        }

                    </div>

                </div>

                <div className="col-lg-3 d-lg-block d-none offset-lg-1">

                    <CardSearch categories={categories} searchValue={searchValue} searchFilters={(values) => setSearchFilters(values)} setSearchValue={(value) => handleSearchValue(value)} />

                </div>
            </div>

        </div>

    )
}

export default FormationsPage;