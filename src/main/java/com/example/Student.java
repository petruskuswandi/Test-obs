package com.example;

import java.util.List;

public class Student {
    private String Id;
    private String StudentName;
    private Long Marks;

    public Student(String id, Long marks, String studentName) {
        Id = id;
        Marks = marks;
        StudentName = studentName;
    }

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public Long getMarks() {
        return Marks;
    }

    public void setMarks(Long marks) {
        Marks = marks;
    }

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String studentName) {
        StudentName = studentName;
    }

    public double getPassPercentage(List<Student> students) {
        int passedStudents = 0;
        for (Student student : students) {
            if (student.getMarks() >= 40) {
                passedStudents++;
            }
        }
        if (!students.isEmpty()) {
            return ((double) passedStudents / students.size()) * 100.00;
        } else {
            return 0.00;
        }
    }


    public boolean CheckLulus(){
        return Marks >= 40;
    }
}
