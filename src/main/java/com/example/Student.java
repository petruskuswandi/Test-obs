package com.example;

import java.util.List;

public class Student {
    private String Id;
    private Long Marks;

    private Department Department;

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

    public Student(String id, Long marks) {
        Id = id;
        Marks = marks;

    }

    public boolean CheckLulus(){
        return Marks >= 40;
    }
}
