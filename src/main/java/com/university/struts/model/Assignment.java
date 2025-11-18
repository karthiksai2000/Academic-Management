package com.university.struts.model;

import java.util.Date;

public class Assignment {
    private String studentId;
    private String studentName;
    private String courseName;
    private String assignmentTitle;
    private String assignmentContent;
    private Date submissionDate;
    private int wordCount;
    
    // Constructors
    public Assignment() {
        this.submissionDate = new Date();
    }
    
    public Assignment(String studentId, String studentName, String courseName, 
                     String assignmentTitle, String assignmentContent) {
        this();
        this.studentId = studentId;
        this.studentName = studentName;
        this.courseName = courseName;
        this.assignmentTitle = assignmentTitle;
        this.assignmentContent = assignmentContent;
        calculateWordCount();
    }
    
    // Business logic
    public void calculateWordCount() {
        if (assignmentContent != null && !assignmentContent.trim().isEmpty()) {
            String text = assignmentContent.trim();
            this.wordCount = text.isEmpty() ? 0 : text.split("\\s+").length;
        } else {
            this.wordCount = 0;
        }
    }
    
    // Getters and Setters
    public String getStudentId() { return studentId; }
    public void setStudentId(String studentId) { this.studentId = studentId; }
    
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    
    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }
    
    public String getAssignmentTitle() { return assignmentTitle; }
    public void setAssignmentTitle(String assignmentTitle) { this.assignmentTitle = assignmentTitle; }
    
    public String getAssignmentContent() { return assignmentContent; }
    public void setAssignmentContent(String assignmentContent) { 
        this.assignmentContent = assignmentContent;
        calculateWordCount();
    }
    
    public Date getSubmissionDate() { return submissionDate; }
    public void setSubmissionDate(Date submissionDate) { this.submissionDate = submissionDate; }
    
    public int getWordCount() { return wordCount; }
    public void setWordCount(int wordCount) { this.wordCount = wordCount; }
}