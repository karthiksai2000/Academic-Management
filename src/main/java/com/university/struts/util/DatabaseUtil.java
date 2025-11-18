package com.university.struts.util;

import com.university.struts.model.Assignment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtil {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/student_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
    
    public static boolean saveAssignment(Assignment assignment) {
        String sql = "INSERT INTO assignments (student_id, student_name, course_name, " +
                    "assignment_title, assignment_content, submission_date, word_count) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, assignment.getStudentId());
            stmt.setString(2, assignment.getStudentName());
            stmt.setString(3, assignment.getCourseName());
            stmt.setString(4, assignment.getAssignmentTitle());
            stmt.setString(5, assignment.getAssignmentContent());
            stmt.setTimestamp(6, new Timestamp(assignment.getSubmissionDate().getTime()));
            stmt.setInt(7, assignment.getWordCount());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static List<Assignment> getAllAssignments() {
        List<Assignment> assignments = new ArrayList<>();
        String sql = "SELECT * FROM assignments ORDER BY submission_date DESC";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Assignment assignment = new Assignment();
                assignment.setStudentId(rs.getString("student_id"));
                assignment.setStudentName(rs.getString("student_name"));
                assignment.setCourseName(rs.getString("course_name"));
                assignment.setAssignmentTitle(rs.getString("assignment_title"));
                assignment.setAssignmentContent(rs.getString("assignment_content"));
                assignment.setSubmissionDate(rs.getTimestamp("submission_date"));
                assignment.setWordCount(rs.getInt("word_count"));
                
                assignments.add(assignment);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return assignments;
    }
    
    // Create table if not exists (for testing)
    public static void createTableIfNotExists() {
        String sql = "CREATE TABLE IF NOT EXISTS assignments (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "student_id VARCHAR(10) NOT NULL, " +
                    "student_name VARCHAR(100) NOT NULL, " +
                    "course_name VARCHAR(100) NOT NULL, " +
                    "assignment_title VARCHAR(200) NOT NULL, " +
                    "assignment_content TEXT NOT NULL, " +
                    "submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                    "word_count INT NOT NULL" +
                    ")";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}