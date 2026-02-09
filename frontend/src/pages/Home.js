import React from 'react';

function Home({ onStartQuiz, loading }) {
  return (
    <div className="page home-page">
      <div className="container">
        <h1>Bienvenue sur QuizApp</h1>
        <p>Testez vos connaissances avec notre quiz interactif</p>
        <button 
          onClick={onStartQuiz} 
          disabled={loading}
          className="btn btn-primary"
        >
          {loading ? 'Chargement...' : 'Démarrer le Quiz'}
        </button>
      </div>
    </div>
  );
}

export default Home;
