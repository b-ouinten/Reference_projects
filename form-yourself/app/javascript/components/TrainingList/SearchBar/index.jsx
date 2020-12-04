import React, { useState, useEffect } from 'react'

const SearchBar = () => {
  const [search, setSearch] = useState('')

  return (
  <form onSubmit = { (event) => {
    event.preventDefault()
    
  }}>
    <input
      className="form-control mr-sm-2"
      type="text"
      placeholder="Saississez votre recherche..."
      value={search}
      onChange={(event) => setSearch(event.target.value)}
    />
    {/* <button 
      className="btn btn-secondary mt-3"
      type="submit"
    >Rechercher</button> */}
  </form>
  )
}

export default SearchBar