<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Mejin Shop | Trang chủ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap & Font -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500;600&display=swap" rel="stylesheet">

        <!-- Custom CSS -->
        <style>
            body {
                font-family: 'Quicksand', sans-serif;
                background-color: #f8f9fa;
            }

            .category-title {
                font-size: 1.2rem;
                font-weight: 600;
                padding: 12px 16px;
                background: #0d6efd;
                color: #fff;
                border-top-left-radius: .5rem;
                border-top-right-radius: .5rem;
            }

            .category-link {
                text-decoration: none;
                color: #333;
                display: block;
                padding: 10px 16px;
                transition: background 0.3s;
            }

            .category-link:hover {
                background-color: #e9ecef;
                color: #0d6efd;
            }

            .product-card {
                border: none;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.08);
                transition: transform 0.2s ease;
            }

            .product-card:hover {
                transform: translateY(-5px);
            }

            .product-img {
                height: 220px;
                object-fit: cover;
                border-radius: 12px 12px 0 0;
            }

            .product-name {
                font-weight: 600;
                color: #333;
                text-decoration: none;
            }

            .product-name:hover {
                color: #0d6efd;
            }

            .product-price {
                font-weight: bold;
                color: #dc3545;
            }

            .btn-buy {
                background-color: #198754;
                color: white;
                font-weight: 500;
            }

            .btn-buy:hover {
                background-color: #157347;
            }

            .section-title {
                font-size: 1.5rem;
                font-weight: bold;
                margin-bottom: 24px;
            }
        </style>
    </head>
    <body>

        <!-- Navigation -->
        <jsp:include page="Menu.jsp" />

        <!-- Breadcrumb -->
        <div class="container mt-4">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-white p-2 rounded shadow-sm">
                    <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sản phẩm nổi bật</li>
                </ol>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="container mb-5">
            <div class="row g-4">

                <!-- Sidebar - Categories -->
                <!-- Sidebar - Categories -->
                <div class="col-lg-3">

                    <!-- Danh mục -->
                    <div class="card shadow-sm mb-4">
                        <div class="category-title"><i class="fa fa-list"></i> Danh mục</div>
                        <c:forEach items="${listCC}" var="o">
                            <a href="category?cid=${o.cid}" class="category-link">${o.cname}</a>
                        </c:forEach>
                    </div>

                    <!-- Khoảng giá -->
                    <div class="card shadow-sm mb-4 p-3">
                        <h6 class="fw-bold"><i class="fa fa-dollar-sign"></i> Giá</h6>
                        <input type="range" min="10" max="540" value="100" class="form-range" id="priceRange">
                        <div class="d-flex justify-content-between mt-2 text-danger fw-bold">
                            <span>$10</span>
                            <span>$540</span>
                        </div>
                    </div>

                    <!-- Màu sắc -->
                    <div class="card shadow-sm mb-4 p-3">
                        <h6 class="fw-bold"><i class="fa fa-palette"></i> Màu sắc</h6>
                        <div class="d-flex flex-wrap gap-2">
                            <label><input type="radio" name="color"> White</label>
                            <label><input type="radio" name="color"> Red</label>
                            <label><input type="radio" name="color"> Blue</label>
                            <label><input type="radio" name="color"> Gray</label>
                            <label><input type="radio" name="color"> Black</label>
                            <label><input type="radio" name="color"> Green</label>
                        </div>
                    </div>

                    <!-- Kích thước phổ biến -->
                    <div class="card shadow-sm mb-4 p-3">
                        <h6 class="fw-bold"><i class="fa fa-ruler-combined"></i> Kích thước phổ biến</h6>
                        <div class="d-flex flex-wrap gap-2">
                            <button class="btn btn-outline-secondary btn-sm">S</button>
                            <button class="btn btn-outline-secondary btn-sm">M</button>
                            <button class="btn btn-outline-secondary btn-sm">L</button>
                            <button class="btn btn-outline-secondary btn-sm">XL</button>
                            <button class="btn btn-outline-secondary btn-sm">XXL</button>
                        </div>
                    </div>

                    <!-- Sản phẩm mới nhất -->
                    <c:if test="${not empty p}">
                        <div class="card shadow-sm mt-4">
                            <div class="category-title bg-success"><i class="fa fa-star"></i> Sản phẩm mới nhất</div>
                            <div class="card-body text-center">
                                <img src="${p.image}" class="img-fluid rounded mb-2" alt="${p.name}" style="max-width: 120px;">
                                <h6>${p.name}</h6>
                                <p class="text-muted small">${p.description}</p>
                                <p class="product-price text-danger fw-bold">${p.price} đ</p>
                                <a href="detail?product_id=${p.id}" class="btn btn-sm btn-outline-primary">Xem chi tiết</a>
                            </div>
                        </div>
                    </c:if>

                </div>

                <!-- Product List -->
                <div class="col-lg-9">
                    <div class="section-title">Sản phẩm nổi bật</div>
                    <div class="row g-4">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-md-4 col-sm-6">
                                <div class="card product-card h-100">
                                    <img src="${o.image}" class="product-img" alt="${o.name}">
                                    <div class="card-body d-flex flex-column">
                                        <a href="detail?product_id=${o.id}" class="product-name mb-1">${o.name}</a>
                                        <p class="text-muted small">${o.description}</p>
                                        <div class="mt-auto d-flex justify-content-between align-items-center">
                                            <span class="product-price">${o.price} đ</span>
                                            <a href="add-to-cart?pid=${o.id}" class="btn btn-buy btn-sm">
                                                <i class="fas fa-cart-plus"></i> Mua
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="Footer.jsp" />

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
