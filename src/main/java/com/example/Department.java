package com.example;

import java.util.ArrayList;
import java.util.List;

public class Department {
    private String DepartmentName;
    private List<Student> Students;
    private Integer Total;

    public Department(String departmentName){
        DepartmentName = departmentName;
        Students = new ArrayList<>();
        Total = 0;
    }

    public String getDepartment() {
        return DepartmentName;
    }

    public void setDepartment(String department) {
        DepartmentName = department;
    }

    public List<Student> getStudents() {
        return Students;
    }

    public void setStudents(List<Student> students) {
        Students = students;
    }

    public Integer getTotal() {
        return Total;
    }

    public void setTotal(Integer total) {
        Total = total;
    }

    public Double CheckPassCondition(List<Student> students){
        int result = 0;
        for (Student student: students) {
            if (student.getMarks() >= 40) {
                result ++;
            }
        }

        if (!students.isEmpty()) {
            return ((double)result/students.size())*100;
        } else {
            return 0.0;
        }
    }

    public void UpdateStudent(Student student){
        Students.add(student);

        if (student.CheckLulus()){
            Total++;
        }
    }

    public String getDepartmentName() {
        return DepartmentName;
    }

    public void setDepartmentName(String departmentName) {
        DepartmentName = departmentName;
    }
}
