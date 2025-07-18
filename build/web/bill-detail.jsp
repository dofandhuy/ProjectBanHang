
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết đơn hàng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap + FontAwesome -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container my-5">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Bill Detail</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>Product</th>
                                    <th>Image</th>
                                    <th>Quantity</th>
                                    <th>Size</th>
                                    <th>Color</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${details}" var="d">
                                <tr>
                                    <td>${d.product.name}</td>
                                    <td><img src="${d.product.image}" width="60" height="60"/></td>
                                    <td>${d.quantity}</td>
                                    <td>${d.size}</td>
                                    <td>${d.color}</td>
                                    <td>${d.price}₫</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="User?action=showorder" class="btn btn-secondary mt-3"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
