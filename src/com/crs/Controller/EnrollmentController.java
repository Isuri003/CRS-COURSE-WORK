package com.crs.controller;

import com.crs.model.Enrollment;
import com.crs.service.EnrollmentService;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;

public class EnrollmentController {

    private EnrollmentService enrollmentService;

    public EnrollmentController() {
        this.enrollmentService = new EnrollmentService();
    }

    @FXML
    private Button enrollButton;

    @FXML
    private Button dropButton;

    @FXML
    public void handleEnroll() {
        int studentId = 1;  // Assume that we have a logged-in student with ID 1
        int courseId = 1;   // Assume that the user selects a course with ID 1

        boolean success = enrollmentService.registerCourse(studentId, courseId);

        if (success) {
            showAlert(AlertType.INFORMATION, "Enrollment Successful", "You have successfully enrolled in the course.");
        } else {
            showAlert(AlertType.ERROR, "Enrollment Failed", "You cannot enroll in this course due to prerequisites or capacity issues.");
        }
    }

    @FXML
    public void handleDrop() {
        int studentId = 1;  // Assume we have a logged-in student with ID 1
        int courseId = 1;   // Assume the user selects a course with ID 1

        boolean success = enrollmentService.dropCourse(studentId, courseId);

        if (success) {
            showAlert(AlertType.INFORMATION, "Course Dropped", "You have successfully dropped the course.");
        } else {
            showAlert(AlertType.ERROR, "Drop Failed", "Unable to drop the course.");
        }
    }

    private void showAlert(AlertType alertType, String title, String message) {
        Alert alert = new Alert(alertType);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}

