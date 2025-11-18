package com.university.struts.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.university.struts.model.Assignment;
import com.university.struts.util.DatabaseUtil;
import java.util.regex.Pattern;

public class AssignmentAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    
    private Assignment assignment;
    private String message;
    
    private static final Pattern STUDENT_ID_PATTERN = Pattern.compile("^S\\d{5}$");
    private static final int MIN_WORD_COUNT = 300;
    
    public AssignmentAction() {
        assignment = new Assignment();
    }
    
    // Method to show empty form
    public String showForm() {
        System.out.println("showForm() called - displaying empty form");
        return SUCCESS;
    }
    
    // Method to handle form submission
    public String execute() {
        try {
            System.out.println("execute() called - processing form submission");

            // Validate input
            if (hasErrors()) {
                System.out.println("Validation errors found, returning INPUT");
                return INPUT;
            }

            // Calculate word count
            assignment.calculateWordCount();
            System.out.println("Word count calculated: " + assignment.getWordCount());

            // Save to database
            boolean success = DatabaseUtil.saveAssignment(assignment);

            if (success) {
                message = "Assignment submitted successfully!";
                System.out.println("Assignment saved successfully");
                return SUCCESS;
            } else {
                message = "Error saving assignment to database.";
                addActionError(message);
                return ERROR;
            }

        } catch (Exception e) {
            message = "System error: " + e.getMessage();
            addActionError(message);
            e.printStackTrace();
            return ERROR;
        }
    }

    // Check if there are any validation errors
   
    
    @Override
    public void validate() {
        System.out.println("validate() called");
        
        if (assignment == null) {
            assignment = new Assignment();
            addActionError("Assignment object is null");
            return;
        }
        
        // Validate Student Name
        if (assignment.getStudentName() == null || assignment.getStudentName().trim().isEmpty()) {
            addFieldError("assignment.studentName", "Student Name is required");
            System.out.println("Student Name validation failed");
        }
        
        // Validate Student ID
        if (assignment.getStudentId() == null || assignment.getStudentId().trim().isEmpty()) {
            addFieldError("assignment.studentId", "Student ID is required");
            System.out.println("Student ID validation failed - empty");
        } else if (!STUDENT_ID_PATTERN.matcher(assignment.getStudentId()).matches()) {
            addFieldError("assignment.studentId", "Student ID must be in format S12345");
            System.out.println("Student ID validation failed - format incorrect: " + assignment.getStudentId());
        }
        
        // Validate Course Name
        if (assignment.getCourseName() == null || assignment.getCourseName().trim().isEmpty()) {
            addFieldError("assignment.courseName", "Course Name is required");
            System.out.println("Course Name validation failed");
        }
        
        // Validate Assignment Title
        if (assignment.getAssignmentTitle() == null || assignment.getAssignmentTitle().trim().isEmpty()) {
            addFieldError("assignment.assignmentTitle", "Assignment Title is required");
            System.out.println("Assignment Title validation failed");
        }
        
        // Validate Assignment Content
        if (assignment.getAssignmentContent() == null || assignment.getAssignmentContent().trim().isEmpty()) {
            addFieldError("assignment.assignmentContent", "Assignment Content is required");
            System.out.println("Assignment Content validation failed - empty");
        } else {
            // Calculate word count for validation
            assignment.calculateWordCount();
            if (assignment.getWordCount() < MIN_WORD_COUNT) {
                addFieldError("assignment.assignmentContent", 
                             "Minimum 300 words required. Current: " + assignment.getWordCount());
                System.out.println("Assignment Content validation failed - word count: " + assignment.getWordCount());
            }
        }
        
        System.out.println("Validation completed. Errors: " + hasErrors());
    }
    
    // Getters and Setters
    public Assignment getAssignment() { 
        if (assignment == null) {
            assignment = new Assignment();
        }
        return assignment; 
    }
    
    public void setAssignment(Assignment assignment) { 
        this.assignment = assignment; 
    }
    
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
}