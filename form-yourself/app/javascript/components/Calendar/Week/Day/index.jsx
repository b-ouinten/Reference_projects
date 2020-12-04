import React from 'react'

const Day = ({ day, sessions }) => {
  const days = ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]
  let this_day = days[day.getDay()]
  
  return (
  <div className="card border-primary mb-3">
    <div className="card-header">
      <div className="card-title">{ this_day } { day.getDate() }</div>
    </div>

    <div className="card-body">
      { sessions.map( (session) => (
        <div className="row">
          - {session.training.title}
        </div>
      ))}
    </div>
  </div>
  )
}

export default Day