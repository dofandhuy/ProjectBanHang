<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>${detail.name} | Mejin Shop</title>

        <!-- Bootstrap 5 & Font -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Segoe UI', sans-serif;
            }

            .product-image img {
                border-radius: 10px;
                max-width: 100%;
            }

            .product-price {
                font-size: 1.6rem;
                color: #dc3545;
                font-weight: bold;
            }

            .product-desc {
                font-size: 0.95rem;
                color: #444;
            }

            .btn-buy {
                background-color: #198754;
                color: white;
                font-weight: 500;
            }

            .btn-buy:hover {
                background-color: #157347;
            }

            .btn-add {
                border: 1px solid #198754;
                color: #198754;
            }

            .btn-add:hover {
                background-color: #198754;
                color: #fff;
            }

            .color-badge {
                margin-right: 5px;
            }

            .size-option .btn {
                margin-right: 8px;
            }
        </style>
    </head>
    <body>

        <jsp:include page="Menu.jsp" />

        <div class="container my-5">
            <div class="row">
                <jsp:include page="Left.jsp" />

                <!-- Product Detail -->
                <div class="col-lg-9">
                    <div class="row g-4">
                        <!-- Product Image -->
                        <div class="col-md-6">
                            <div class="product-image">
                                <img src="${detail.image}" alt="${detail.name}">
                            </div>
                        </div>

                        <!-- Product Info -->
                        <div class="col-md-6">
                            <h3 class="fw-semibold">${detail.name}</h3>
                            <p class="product-price">${detail.price} đ</p>
                            <p class="text-muted mb-1">Còn lại: <strong>${detail.quantity}</strong> sản phẩm</p>
                            <p class="product-desc">${detail.description}</p>
                            <hr>

                            <form action="cart" method="post">
                                <!-- Chọn Size -->
                                <label class="form-label fw-bold">Kích thước:</label>
                                <div class="btn-group mb-3 size-option" role="group">
                                    <c:forEach items="${detail.size}" var="s" varStatus="status">
                                        <input type="radio" class="btn-check" name="size" id="size${status.index}" value="${s.size}" ${status.index == 0 ? 'checked' : ''}>
                                        <label class="btn btn-outline-secondary btn-sm" for="size${status.index}">${s.size}</label>
                                    </c:forEach>
                                </div>

                                <!-- Màu sắc -->
                                <div class="mb-3">
                                    <label class="form-label fw-bold d-block">Màu sắc:</label>
                                    <c:forEach items="${detail.color}" var="c">
                                        <span class="badge bg-secondary color-badge">${c.color}</span>
                                    </c:forEach>
                                </div>

                                <!-- Số lượng -->
                                <div class="mb-3">
                                    <label for="quantity" class="form-label fw-bold">Số lượng:</label>
                                    <input type="number" id="quantity" name="quantity" class="form-control form-control-sm" style="max-width: 100px;" value="1" min="1" max="${detail.quantity}">
                                </div>

                                <!-- Hidden fields -->
                                <input type="hidden" name="id" value="${detail.id}">
                                <input type="hidden" name="name" value="${detail.name}">
                                <input type="hidden" name="price" value="${detail.price}">
                                <input type="hidden" name="image" value="${detail.image}">

                                <!-- Nút hành động -->
                                <div class="d-flex gap-2 mt-3">
                                    <a href="buy-now?pid=${detail.id}" class="btn btn-buy btn-lg">
                                        <i class="fas fa-bolt"></i> Mua ngay
                                    </a>
                                    <button type="submit" class="btn btn-add btn-lg">
                                        <i class="fas fa-cart-plus"></i> Thêm vào giỏ
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="Footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
