<%@ page import="com.example.Department" %>
<%@ page import="com.example.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Success Page</title>
  <style>
    /* CSS untuk gaya popup */
    .popup {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: white;
      border: 1px solid #ccc;
      padding: 20px;
      box-shadow: 0px 0px 10px #888888;
      z-index: 9999;
    }
  </style>
</head>
<body>
<h2>Welcome, <a href="#" onclick="showPopup('<%= session.getAttribute("studentName") %>')"><%= session.getAttribute("username") %></a></h2>
<p>You have successfully logged in!</p>
<table border="1">
  <tr>
    <th>Department</th>
    <th>Student ID</th>
    <th>Marks</th>
    <th>Pass %</th>
  </tr>
  <%
    List<Department> departmentList = (List<Department>) request.getSession().getAttribute("departmentList");

    for (Department department : departmentList) {
      List<Student> students = department.getStudents();
      int rowCount = students.size(); // Menghitung jumlah siswa dalam departemen
      boolean departmentDisplayed = false; // Variabel untuk menandai apakah kolom "Department" telah ditampilkan
      boolean passPercentageDisplayed = false; // Variabel untuk menandai apakah kolom "Pass %" telah ditampilkan
  %>
  <%
    for (Student student : students) {
      String passPercentage = String.format("%.2f", student.getPassPercentage(department.getStudents()));
  %>
  <tr>
    <%
      // Menampilkan department hanya pada baris pertama departemen
      if (!departmentDisplayed) {
    %>
    <td rowspan="<%= rowCount %>" style="text-align: center"><%= department.getDepartmentName() %></td>
    <%
        departmentDisplayed = true;
      }
    %>
    <td><a href="#" onclick="showPopup('<%= student.getStudentName() %>')"><%= student.getId() %></a></td>
    <td><%= student.getMarks() %></td>
    <%
      // Menampilkan pass percentage hanya pada baris pertama departemen
      if (!passPercentageDisplayed) {
    %>
    <td rowspan="<%= rowCount %>" style="text-align: center"><%= passPercentage %></td>
    <%
        passPercentageDisplayed = true;
      }
    %>
  </tr>
  <%
    }
  %>
  <%
    }
  %>
</table>

<!-- Popup untuk menampilkan nama siswa -->
<div id="popup" class="popup">
  <span id="popupContent"></span>
  <button onclick="hidePopup()">Close</button>
</div>

<script>
  function showPopup(studentName) {
    document.getElementById("popupContent").innerHTML = "Student Name: " + studentName;
    document.getElementById("popup").style.display = "block";
  }

  function hidePopup() {
    document.getElementById("popup").style.display = "none";
  }
</script>

</body>
</html>
