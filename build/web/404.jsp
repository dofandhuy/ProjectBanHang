<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>404 - Không tìm thấy trang</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- Bootstrap & Style -->
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <style>
        .error-section {
            padding: 80px 0;
            text-align: center;
            background-color: #f8f9fa;
        }

        .error-section h1 {
            font-size: 120px;
            font-weight: 800;
            color: #dc3545;
            margin-bottom: 20px;
        }

        .error-section p {
            font-size: 20px;
            color: #555;
        }

        .error-section a.btn-home {
            margin-top: 20px;
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 4px;
            text-decoration: none;
        }

        .error-section a.btn-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <div class="off_canvars_overlay"></div>

    <!-- Menu -->
    <jsp:include page="Menu.jsp"/>

    <!-- 404 Error Section -->
    <div class="error-section">
        <div class="container">
            <h1>404</h1>
            <p>Xin lỗi, trang bạn tìm kiếm không tồn tại hoặc đã bị xóa.</p>
            <a class="btn-home" href="home">Quay về trang chủ</a>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="Footer.jsp"/>

    <!-- JS Scripts -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
    <script src="https://www.google.com/jsapi"></script>
    <script src="assets/js/map.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
</body>

</html>
