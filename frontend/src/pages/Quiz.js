import React, { useState } from 'react';
import Question from '../components/Question';

function Quiz({ questions, answers, onAnswerChange, onSubmit, loading }) {
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);

  const handleNext = () => {
    if (currentQuestionIndex < questions.length - 1) {
      setCurrentQuestionIndex(currentQuestionIndex + 1);
    }
  };

  const handlePrevious = () => {
    if (currentQuestionIndex > 0) {
      setCurrentQuestionIndex(currentQuestionIndex - 1);
    }
  };

  const currentQuestion = questions[currentQuestionIndex];
  const allAnswered = questions.every(q => answers[q.id] !== undefined);

  return (
    <div className="page quiz-page">
      <div className="container">
        <div className="progress-bar">
          <div 
            className="progress-fill" 
            style={{ width: `${((currentQuestionIndex + 1) / questions.length) * 100}%` }}
          ></div>
        </div>
        
        <div className="progress-text">
          Question {currentQuestionIndex + 1} sur {questions.length}
        </div>

        {currentQuestion && (
          <Question
            question={currentQuestion}
            selectedAnswer={answers[currentQuestion.id]}
            onAnswerChange={(answerId) => onAnswerChange(currentQuestion.id, answerId)}
          />
        )}

        <div className="navigation-buttons">
          <button 
            onClick={handlePrevious} 
            disabled={currentQuestionIndex === 0}
            className="btn btn-secondary"
          >
            Précédent
          </button>

          {currentQuestionIndex < questions.length - 1 ? (
            <button 
              onClick={handleNext}
              className="btn btn-secondary"
            >
              Suivant
            </button>
          ) : (
            <button 
              onClick={onSubmit}
              disabled={!allAnswered || loading}
              className="btn btn-primary"
            >
              {loading ? 'Chargement...' : 'Terminer et voir les résultats'}
            </button>
          )}
        </div>
      </div>
    </div>
  );
}

export default Quiz;
