package com.university.struts.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.university.struts.model.Assignment;
import com.university.struts.util.DatabaseUtil;
import java.util.List;

public class ViewAssignmentsAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    
    private List<Assignment> assignments;
    private String message;
    
    public String execute() {
        try {
            // Initialize database table if not exists
            DatabaseUtil.createTableIfNotExists();
            
            // Get all assignments from database
            assignments = DatabaseUtil.getAllAssignments();
            
            if (assignments == null || assignments.isEmpty()) {
                message = "No assignments submitted yet.";
            } else {
                message = "Found " + assignments.size() + " assignment(s)";
            }
            
            return SUCCESS;
            
        } catch (Exception e) {
            message = "Error retrieving assignments: " + e.getMessage();
            return ERROR;
        }
    }
    
    // Getters and Setters
    public List<Assignment> getAssignments() { return assignments; }
    public void setAssignments(List<Assignment> assignments) { this.assignments = assignments; }
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
}