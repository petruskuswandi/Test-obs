package com.example;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String USERID = "1010290";
    private static final String PASSWORD = "kocag";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user input from the login form
        String username = request.getParameter("userId");
        String password = request.getParameter("password");

        // Check if the input credentials match the hardcoded values
        if (USERID.equals(username) && PASSWORD.equals(password)) {
            // Create a session for the authenticated user
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // Redirect to a success page
            response.sendRedirect("index.jsp");
        } else {
            // If the credentials don't match, redirect back to the login page with an error message
            response.sendRedirect("login.jsp?error=1");
        }
    }

    private List<Department> getHardcodedDepartmentData() {
        List<Department> departmentList = new ArrayList<>();
        Department department1 = new Department("Dep 1");
        Department department2 = new Department("Dep 2");
        Department department3 = new Department("Dep 3");

        // Add students to each department
        department1.UpdateStudent(new Student("S1", 35L));
        department1.UpdateStudent(new Student("S2", 70L));
        department1.UpdateStudent(new Student("S3", 60L));
        department1.UpdateStudent(new Student("S4", 90L));

        department2.UpdateStudent(new Student("S5",  30L));

        department3.UpdateStudent(new Student("S6", 32L));
        department3.UpdateStudent(new Student("S7", 70L));
        department3.UpdateStudent(new Student("S8", 20L));

        departmentList.add(department1);
        departmentList.add(department2);
        departmentList.add(department3);

        for (Department department : departmentList) {
            // Misalnya, Anda dapat memeriksa jumlah siswa yang lulus dalam setiap departemen
            double passPercentage = department.CheckPassCondition(department.getStudents());
            System.out.println("Pass Percentage for " + department.getDepartment() + ": " + passPercentage);
        }
        return departmentList;
    }
}