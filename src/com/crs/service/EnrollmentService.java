package com.crs.service;

import com.crs.util.DatabaseUtil;

import java.sql.*;

public class EnrollmentService {

    public boolean registerCourse(int studentId, int courseId) {
        // Check  student prerequisites 
        if (!meetsPrerequisites(studentId, courseId)) {
            return false;
        }

        //capacity check
        if (!hasAvailableSeats(courseId)) {
            return false;
        }

        // Registration
        try (Connection conn = DatabaseUtil.getConnection()) {
            String query = "INSERT INTO Enrollments (student_id, course_id, status, semester) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, studentId);
                stmt.setInt(2, courseId);
                stmt.setString(3, "enrolled");
                stmt.setString(4, "Spring 2025");
                stmt.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean dropCourse(int studentId, int courseId) {
        
        try (Connection conn = DatabaseUtil.getConnection()) {
            String query = "DELETE FROM Enrollments WHERE student_id = ? AND course_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, studentId);
                stmt.setInt(2, courseId);
                stmt.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean meetsPrerequisites(int studentId, int courseId) {
        
        return true;
    }

    private boolean hasAvailableSeats(int courseId) {
        // Check about available seats
        try (Connection conn = DatabaseUtil.getConnection()) {
            String query = "SELECT COUNT(*) AS enrolled FROM Enrollments WHERE course_id = ? AND status = 'enrolled'";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, courseId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    int enrolled = rs.getInt("enrolled");
                    String capacityQuery = "SELECT max_enrollment FROM Courses WHERE course_id = ?";
                    try (PreparedStatement stmt2 = conn.prepareStatement(capacityQuery)) {
                        stmt2.setInt(1, courseId);
                        ResultSet rs2 = stmt2.executeQuery();
                        if (rs2.next()) {
                            int maxEnrollment = rs2.getInt("max_enrollment");
                            return enrolled < maxEnrollment;
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

