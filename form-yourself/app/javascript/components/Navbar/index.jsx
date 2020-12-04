import React from 'react'
import { Link } from 'react-router-dom'
import { useSelector } from 'react-redux';

const Navbar = ()  => {
  const { isAuthenticated } = useSelector((state) => state);
  
  return (
    <nav className="navbar navbar-expand-lg navbar-dark bg-primary">
      <a className="navbar-brand" href="/">FORM-YOURSELF</a>
      <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>

      <div className="collapse navbar-collapse" id="navbarColor01">
        <ul className="navbar-nav mr-auto">
          <li className="nav-item active">
            <a className="nav-link" href="/">Home
              <span className="sr-only">(current)</span>
            </a>
          </li>
          {
            !isAuthenticated &&
            (
              <>
                <li className="nav-item">
                  <a className="nav-link" href="/register/">Sign Up</a>
                </li>
                <li className="nav-item">
                  <a className="nav-link" href="/login/">Log In</a>
                </li>
              </>
            )
          }
          {
            isAuthenticated && 
            (
              <li className="nav-item">
                <a className="nav-link" href="/logout">Log Out</a>
              </li>
            )
          }
          <li className="nav-item">
            <Link to="/calendar" className="nav-link">Calendrier</Link>
          </li>
        </ul>
      </div>
    </nav>
  )
}

export default Navbar