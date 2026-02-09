package com.quizapp.service;

import com.quizapp.dto.AnswerDTO;
import com.quizapp.dto.QuestionDTO;
import com.quizapp.dto.ScoreResponseDTO;
import com.quizapp.dto.SubmitAnswersDTO;
import com.quizapp.entity.Answer;
import com.quizapp.entity.Question;
import com.quizapp.repository.AnswerRepository;
import com.quizapp.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class QuizService {
    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private AnswerRepository answerRepository;

    public List<QuestionDTO> getAllQuestions() {
        List<Question> questions = questionRepository.findAll();
        
        return questions.stream()
                .map(question -> {
                    QuestionDTO dto = new QuestionDTO();
                    dto.setId(question.getId());
                    dto.setText(question.getText());
                    dto.setCategory(question.getCategory());
                    
                    // Récupérer les réponses sans montrer la bonne réponse
                    List<AnswerDTO> answersDTO = answerRepository.findAll().stream()
                            .filter(answer -> answer.getQuestion().getId().equals(question.getId()))
                            .map(answer -> new AnswerDTO(answer.getId(), answer.getText()))
                            .collect(Collectors.toList());
                    
                    dto.setAnswers(answersDTO);
                    return dto;
                })
                .collect(Collectors.toList());
    }

    public ScoreResponseDTO submitAnswers(SubmitAnswersDTO submittedAnswers) {
        Map<Long, Long> answers = submittedAnswers.getAnswers();
        int score = 0;
        int totalQuestions = 0;

        // Parcourir toutes les questions
        List<Question> questions = questionRepository.findAll();
        
        for (Question question : questions) {
            totalQuestions++;
            Long submittedAnswerId = answers.get(question.getId());
            
            if (submittedAnswerId != null) {
                // Vérifier si la réponse soumise est correcte
                Answer submittedAnswer = answerRepository.findById(submittedAnswerId).orElse(null);
                
                if (submittedAnswer != null && submittedAnswer.getIsCorrect()) {
                    score++;
                }
            }
        }

        ScoreResponseDTO response = new ScoreResponseDTO();
        response.setScore(score);
        response.setTotalQuestions(totalQuestions);
        response.setMessage("Votre score : " + score + "/" + totalQuestions);
        
        return response;
    }
}
