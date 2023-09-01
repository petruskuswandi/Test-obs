<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Halaman Login</title>
    <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
            align-items: flex-start;
        }
        label {
            font-weight: bold;
            text-align: left;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            padding: 5px;
            margin: 5px 0;
        }
        .login-button {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Selamat datang!</h1>
    <div class="form-container">
        <form action="LoginServlet" method="post" id="loginForm">
            <div class="form-group">
                <label for="userId">User ID</label>
                <input type="text" id="userId" name="userId" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group login-button">
                <input type="submit" value="Login">
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $("#loginForm").submit(function(event) {
            // Check if User ID and Password fields are empty
            if ($("#userId").val() === "" || $("#password").val() === "") {
                alert("User ID and Password are required.");
                event.preventDefault(); // Prevent form submission
            }
        });
    });
</script>
</body>
</html>
