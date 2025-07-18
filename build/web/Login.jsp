<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login / Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: #f5f6fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .form-wrapper {
            width: 100%;
            max-width: 420px;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .form-wrapper h3 {
            margin-bottom: 25px;
            font-weight: 700;
            text-align: center;
        }

        .toggle-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            cursor: pointer;
            color: #007bff;
            text-decoration: underline;
        }

        .form-error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }

        .form-hidden {
            display: none;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <!-- Sign In Form -->
    <form class="form-signin" action="login" method="post">
        <h3>Sign In</h3>
        <p class="form-error">${mess}</p>
        <div class="mb-3">
            <input name="user" type="text" class="form-control" placeholder="Username" required autofocus>
        </div>
        <div class="mb-3">
            <input name="pass" type="password" class="form-control" placeholder="Password" required>
        </div>
        <div class="form-check mb-3">
            <input class="form-check-input" name="remember" value="1" type="checkbox" id="rememberCheck">
            <label class="form-check-label" for="rememberCheck">Remember me</label>
        </div>
        <button class="btn btn-primary w-100" type="submit"><i class="fas fa-sign-in-alt"></i> Login</button>
        <span class="toggle-link" onclick="toggleForm()">Don't have an account? Sign Up</span>
    </form>

    <!-- Sign Up Form -->
    <form class="form-signup form-hidden" action="signup" method="post">
        <h3>Sign Up</h3>
        <p class="form-error">${mess}</p>
        <div class="mb-3">
            <input name="user" type="text" class="form-control" placeholder="Username" required>
        </div>
        <div class="mb-3">
            <input name="email" type="email" class="form-control" placeholder="Email" required>
        </div>
        <div class="mb-3">
            <input name="pass" type="password" class="form-control" placeholder="Password" required>
        </div>
        <div class="mb-3">
            <input name="repass" type="password" class="form-control" placeholder="Repeat Password" required>
        </div>
        <button class="btn btn-success w-100" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
        <span class="toggle-link" onclick="toggleForm()">Already have an account? Sign In</span>
    </form>
</div>

<!-- JS -->
<script>
    function toggleForm() {
        document.querySelector('.form-signin').classList.toggle('form-hidden');
        document.querySelector('.form-signup').classList.toggle('form-hidden');
    }
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
