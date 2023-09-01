<%@ page import="com.example.Department" %>
<%@ page import="com.example.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Success Page</title>
</head>
<body>
<h2>Welcome, <%= session.getAttribute("username") %></h2>
<p>You have successfully logged in!</p>
<table border="1">
  <tr>
    <th>Department</th>
    <th>Student ID</th>
    <th>Marks</th>
    <th>Pass %</th>
  </tr>
  <%
    // Create a list of departments and add students to them
    List<Department> departmentList = new ArrayList<>();
    Department department1 = new Department("Dep 1");
    Department department2 = new Department("Dep 2");
    Department department3 = new Department("Dep 3");

    department1.UpdateStudent(new Student("S1", 35L));
    department1.UpdateStudent(new Student("S2", 70L));
    department1.UpdateStudent(new Student("S3", 60L));
    department1.UpdateStudent(new Student("S4", 90L));

    department2.UpdateStudent(new Student("S5", 30L));

    department3.UpdateStudent(new Student("S6", 32L));
    department3.UpdateStudent(new Student("S7", 70L));
    department3.UpdateStudent(new Student("S8", 20L));

    departmentList.add(department1);
    departmentList.add(department2);
    departmentList.add(department3);

    for (Department department : departmentList) {
      List<Student> students = department.getStudents();
      int rowCount = students.size();
  %>
  <tr>
    <%
      // Display the department name only for the first row of each department
      if (rowCount > 0) {
    %>
    <td rowspan="<%=rowCount%>"><%= department.getDepartment() %></td>
    <%
      }
    %>
    <td><%= students.get(0).getId() %></td>
    <td><%= students.get(0).getMarks() %></td>
    <%
      // Display the pass percentage only for the first row of each department
      if (rowCount > 0) {
    %>
    <td rowspan="<%=rowCount%>"><%= String.format("%.2f", department.CheckPassCondition(students)) %></td>
    <%
      }
    %>
  </tr>
  <%
    // Display additional students in the same department
    for (int i = 1; i < rowCount; i++) {
      Student student = students.get(i);
  %>
  <tr>
    <td><%= student.getId() %></td>
    <td><%= student.getMarks() %></td>
  </tr>
  <%
      }
    }
  %>
</table>

</body>
</html>
