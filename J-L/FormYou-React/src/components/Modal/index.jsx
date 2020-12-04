import React, { useContext } from "react";
import modalContext from "../../context/modalContext";
import ModalCloseIcon from "../../assets/icons/modal/close_modal.png";
import "./index.scss"

const Modal = ({ modalContent: ModalContent, datas }) => {

    const { isModalOpen, setModalIsOpen } = useContext(modalContext);


    const handleCloseModal = () => {
        setModalIsOpen(false)
    }



    return (

        isModalOpen && (

            <div className="col-md-3 col-12 bg-white my-auto shadow-sm d-flex flex-column justify-content-around" id="modal">

                <img src={ModalCloseIcon} alt="fermer le menu" id="close-modal" onClick={handleCloseModal} />

                <ModalContent {...datas} />
            </div>
        )
    )

}

export default Modal;