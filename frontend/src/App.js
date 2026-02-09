import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Home from './pages/Home';
import Quiz from './pages/Quiz';
import Results from './pages/Results';
import './App.css';

function App() {
  const [currentPage, setCurrentPage] = useState('home');
  const [questions, setQuestions] = useState([]);
  const [answers, setAnswers] = useState({});
  const [score, setScore] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleStartQuiz = async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await axios.get('http://localhost:8081/api/quiz');
      setQuestions(response.data);
      setAnswers({});
      setCurrentPage('quiz');
    } catch (err) {
      setError('Erreur lors du chargement des questions');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleSubmitQuiz = async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await axios.post('http://localhost:8081/api/quiz/submit', {
        answers: answers
      });
      setScore(response.data);
      setCurrentPage('results');
    } catch (err) {
      setError('Erreur lors de la soumission des réponses');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleAnswerChange = (questionId, answerId) => {
    setAnswers({
      ...answers,
      [questionId]: answerId
    });
  };

  const handleBackToHome = () => {
    setCurrentPage('home');
    setQuestions([]);
    setAnswers({});
    setScore(null);
  };

  return (
    <div className="app">
      {error && <div className="error-message">{error}</div>}
      
      {currentPage === 'home' && (
        <Home onStartQuiz={handleStartQuiz} loading={loading} />
      )}
      
      {currentPage === 'quiz' && (
        <Quiz 
          questions={questions} 
          answers={answers}
          onAnswerChange={handleAnswerChange}
          onSubmit={handleSubmitQuiz}
          loading={loading}
        />
      )}
      
      {currentPage === 'results' && (
        <Results score={score} onBackToHome={handleBackToHome} />
      )}
    </div>
  );
}

export default App;
