package com.crs.service;

import com.crs.util.DatabaseUtil;

import java.sql.*;

public class ReportService {

    public void generateEnrollmentReport() {
        try (Connection conn = DatabaseUtil.getConnection()) {
            String query = "SELECT s.name, c.title, e.semester FROM Enrollments e " +
                           "JOIN Students s ON e.student_id = s.student_id " +
                           "JOIN Courses c ON e.course_id = c.course_id WHERE e.status = 'enrolled'";

            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    String studentName = rs.getString("name");
                    String courseTitle = rs.getString("title");
                    String semester = rs.getString("semester");
                    System.out.println(studentName + " - " + courseTitle + " - " + semester);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

