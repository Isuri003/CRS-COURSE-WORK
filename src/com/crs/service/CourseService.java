package com.crs.service;

import com.crs.model.Course;
import com.crs.util.DatabaseUtil;

import java.sql.*;

public class CourseService {

    public void addCourse(Course course) {
        try (Connection conn = DatabaseUtil.getConnection()) {
            String query = "INSERT INTO Courses (title, credit_hours, department, prerequisites, max_enrollment) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, course.getTitle());
                stmt.setInt(2, course.getCreditHours());
                stmt.setString(3, course.getDepartment());
                stmt.setInt(4, course.getPrerequisites());
                stmt.setInt(5, course.getMaxEnrollment());
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

