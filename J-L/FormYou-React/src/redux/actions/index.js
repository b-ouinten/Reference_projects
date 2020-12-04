

const setCurrentUser = (current_user) => {
  return {
    type: "SET_CURRENT_USER",
    payload: current_user
  }
}

const removeCurrentUser = () => {
  return {
    type: "REMOVE_CURRENT_USER"
  }
}


export { setCurrentUser, removeCurrentUser }
