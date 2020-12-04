import React from 'react';

const TrainingCard = ({ title, description, teacher_name, next_sessions_date }) => (
  <div className="card border-primary mb-3" >
    <div className="card-header">
      <div className="card-title">{ title }</div>
    </div>
    <div className="card-body">
      <div className="row">
        <div className="col-md-6">
          <p>{ description }</p>
          <footer className="blockquote-footer">
            { teacher_name }
          </footer>
        </div>
        <div className="col-md-6">
          <p>Prochaines formations :</p>
          { next_sessions_date.map((date, index) => (
            <div key={index} className="row justify-content-center">
              { new Date(date).getDate() }   -  { new Date(date).getMonth() }
            </div>
          ))}
        </div>
      </div>
    </div>
  </div>
)

export default TrainingCard