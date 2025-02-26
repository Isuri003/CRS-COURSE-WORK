package com.crs.service;

import com.crs.model.Student;
import com.crs.util.DatabaseUtil;

import java.sql.*;

public class StudentService {

    public void addStudent(Student student) {
        try (Connection conn = DatabaseUtil.getConnection()) {
            String query = "INSERT INTO Students (name, dob, program_of_study, year, contact_info) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, student.getName());
                stmt.setString(2, student.getDob());
                stmt.setString(3, student.getProgramOfStudy());
                stmt.setInt(4, student.getYear());
                stmt.setString(5, student.getContactInfo());
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

