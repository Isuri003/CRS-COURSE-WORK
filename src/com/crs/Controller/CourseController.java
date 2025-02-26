package com.crs.controller;

import com.crs.model.Course;
import com.crs.service.CourseService;

public class CourseController {

    private CourseService courseService;

    public CourseController() {
        this.courseService = new CourseService();
    }

    public void addCourse(String title, int creditHours, String department, int prerequisites, int maxEnrollment) {
        Course course = new Course();
        course.setTitle(title);
        course.setCreditHours(creditHours);
        course.setDepartment(department);
        course.setPrerequisites(prerequisites);
        course.setMaxEnrollment(maxEnrollment);

        courseService.addCourse(course);
    }
}

