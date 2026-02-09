import React from 'react';

function Results({ score, onBackToHome }) {
  const percentage = Math.round((score.score / score.totalQuestions) * 100);
  
  return (
    <div className="page results-page">
      <div className="container">
        <h1>Résultats</h1>
        
        <div className="score-container">
          <div className="score-circle">
            <span className="score-text">{score.score}/{score.totalQuestions}</span>
            <span className="percentage-text">{percentage}%</span>
          </div>
        </div>

        <p className="result-message">{score.message}</p>

        <button 
          onClick={onBackToHome}
          className="btn btn-primary"
        >
          Retour à l'accueil
        </button>
      </div>
    </div>
  );
}

export default Results;
