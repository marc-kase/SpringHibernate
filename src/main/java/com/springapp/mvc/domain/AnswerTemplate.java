package com.springapp.mvc.domain;

/**
 * Created by mark on 6/20/16.
 */
public class AnswerTemplate {
    private Long questionId;
    private String information;

    public AnswerTemplate() {
    }

    public AnswerTemplate(Long questionId, String information) {
        this.questionId = questionId;
        this.information = information;
    }


    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }
}
