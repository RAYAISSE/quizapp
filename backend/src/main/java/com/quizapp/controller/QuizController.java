package com.quizapp.controller;

import com.quizapp.dto.QuestionDTO;
import com.quizapp.dto.ScoreResponseDTO;
import com.quizapp.dto.SubmitAnswersDTO;
import com.quizapp.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/quiz")
@CrossOrigin(origins = "*")
public class QuizController {
    @Autowired
    private QuizService quizService;

    @GetMapping
    public List<QuestionDTO> getQuestions() {
        return quizService.getAllQuestions();
    }

    @PostMapping("/submit")
    public ScoreResponseDTO submitAnswers(@RequestBody SubmitAnswersDTO answers) {
        return quizService.submitAnswers(answers);
    }
}
