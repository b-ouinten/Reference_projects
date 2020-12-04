import React, { useState, useEffect } from 'react'
import Week from './Week'

const Calendar = () => {
  const [sessionsArray, setSessionsArray] = useState([]);

  const date = new Date(), y = date.getFullYear(), m = date.getMonth();
  const firstDay = new Date(y, m, 1);

  useEffect( () => {
    fetch("/api/v1/trainings_sessions")
      .then((response) => response.json())
      .then((response) => {
        response?.map( (session) => {
          if (new Date(session.session_date).getMonth() === m) setSessionsArray( previousArray => [session, ...previousArray] )
        })
      })
  }, []); 

  const getFirstDayOfWeek = (weekNumber) => {
    const days = [["Monday", 0], ["Tuesday", 1], ["Wednesday", 2], ["Thursday", 3], ["Friday", 4], ["Saturday", 5], ["Sunday", 6]];

    return new Date(y, m, 1 - days[firstDay.getDay()][1] + 7 * weekNumber)
  }

  let calendar_structure = []

  for (let i = 0; i < 5; i++) {
    calendar_structure.push(
      <Week 
        first_day = { getFirstDayOfWeek(i) }
        sessions = { sessionsArray }
      />
    )
  }

  return (
    <main className="container-fluid">
      <div className="row justifiy-content-center">
        <div className="col-md-12">
          {calendar_structure}
        </div>
      </div>
    </main>
  )
}

export default Calendar