<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt hàng thành công | Mejin Shop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">

    <jsp:include page="Menu.jsp" />

    <div class="container mt-5">
        <div class="alert alert-success text-center p-5 shadow-sm">
            <h3 class="mb-3"><i class="fas fa-check-circle text-success"></i> Cảm ơn bạn đã đặt hàng!</h3>
            <p>${success}</p>
            <a href="home" class="btn btn-outline-primary mt-3">Tiếp tục mua sắm</a>
        </div>
    </div>
</body>
</html>
