import React from 'react'
import Days from './Day'

const Week = ({ first_day, sessions }) => {
  let days = []
  for (let i = 0; i < 7; i++) {
    let this_day = new Date(first_day.setDate(first_day.getDate()+1))
    let sessions_of_the_day = []
    sessions.map( (session) => {
      if (new Date(session.session_date).getDate() === this_day.getDate()) {
        sessions_of_the_day.push(session)
      }
    })

    days.push(
      <div className="col-md-1">
        <Days 
          day={this_day}
          sessions = {sessions_of_the_day}
        />
      </div>
    )
  }

  return (
    <div className="row justify-content-center">
      { days }
    </div>
  )
}

export default Week