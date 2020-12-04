import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom'

import TrainingCard from './TrainingCard'

const TrainingList = () => {
  const [trainingsArray, setTrainingsArray] = useState([]); 

  const define_next_session = (training) => {
    let next_sessions = []
    training.sessions.map((session) => {
      // let now = new Date()
      // console.log(now)
      // if(session.session_date.isAfter(now)) {
        console.log(session)
        if (next_sessions.length === 3) {
          let next_sessions_sorted = next_sessions.sort( (a, b) => a.session_date > b.session_date)
          if ( next_sessions_sorted.last.session_date > session.Date.now()) {
            next_sessions_sorted.pop()
            next_sessions_sorted.push(session)
            next_sessions = next_sessions_sorted
          }
        }
        if (next_sessions.length < 3) next_sessions.push(session)
      // }
    })
    return next_sessions.map((session) => session.session_date)
  }
  

  useEffect( () => {
    fetch("/api/v1/trainings")
      .then((response) => response.json())
      .then((response) => {
        response?.map( (training) => {
          setTrainingsArray( previousArray => [training, ...previousArray] )
        })
      })
  }, []);

  return (
    <main>
      <h4 className="text-center">Voici la liste des formations</h4>
      <div className="row mb-5">
        <div className="col-md-8 text-center">
          <Link to='/calendar'>Passer en mode calendrier</ Link>
        </div>
      </div>

      <div className="container">
        <div className="row">
          { trainingsArray.map( (training) => (
            <div className="col-md-4" key = {training.id}>
              <TrainingCard
                title = { training.title }
                description = { training.description }
                teacher_name = { training.profile.first_name + ' ' + training.profile.last_name }
                next_sessions_date = { define_next_session(training) }
              />
            </div>
          )
          )}
        </div>
      </div>
    </main> 
  )
}

export default TrainingList;
