import React from 'react';

function Question({ question, selectedAnswer, onAnswerChange }) {
  return (
    <div className="question-container">
      <h2 className="question-text">{question.text}</h2>
      <p className="question-category">Catégorie : {question.category}</p>
      
      <div className="answers-list">
        {question.answers.map((answer) => (
          <label key={answer.id} className="answer-option">
            <input
              type="radio"
              name={`question-${question.id}`}
              value={answer.id}
              checked={selectedAnswer === answer.id}
              onChange={() => onAnswerChange(answer.id)}
            />
            <span className="answer-text">{answer.text}</span>
          </label>
        ))}
      </div>
    </div>
  );
}

export default Question;
