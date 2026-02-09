package com.quizapp.dto;

import java.util.Map;

public class SubmitAnswersDTO {
    private Map<Long, Long> answers;

    public SubmitAnswersDTO() {}

    public SubmitAnswersDTO(Map<Long, Long> answers) {
        this.answers = answers;
    }

    public Map<Long, Long> getAnswers() {
        return answers;
    }

    public void setAnswers(Map<Long, Long> answers) {
        this.answers = answers;
    }
}
