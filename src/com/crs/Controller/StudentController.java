package com.crs.controller;

import com.crs.model.Student;
import com.crs.service.StudentService;

public class StudentController {

    private StudentService studentService;

    public StudentController() {
        this.studentService = new StudentService();
    }

    public void registerStudent(String name, String dob, String programOfStudy, int year, String contactInfo) {
        Student student = new Student();
        student.setName(name);
        student.setDob(dob);
        student.setProgramOfStudy(programOfStudy);
        student.setYear(year);
        student.setContactInfo(contactInfo);
        
        studentService.addStudent(student);
    }
}

