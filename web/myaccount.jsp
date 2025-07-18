<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Tài Khoản Của Tôi | MyShop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap 5 + FontAwesome -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            body {
                background-color: #f0f2f5;
                font-family: 'Segoe UI', sans-serif;
            }
            .account-wrapper {
                padding: 50px 0;
            }
            .account-sidebar .nav-link {
                padding: 15px 20px;
                font-size: 15px;
                color: #333;
                border-radius: 0;
            }
            .account-sidebar .nav-link.active {
                background-color: #0d6efd;
                color: #fff;
            }
            .account-card {
                background: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 1px 10px rgba(0,0,0,0.05);
            }
            .account-sidebar .nav-link {
                font-size: 15px;
                color: #212529 !important;
                background-color: #ffffff;
                transition: background-color 0.2s ease;
            }

            .account-sidebar .nav-link:hover {
                background-color: #f1f3f5;
            }

            .account-sidebar .nav-link.active {
                background-color: #e9ecef;
                font-weight: bold;
                border-left: 4px solid #0d6efd;
            }

            .account-sidebar .nav-link i {
                width: 20px;
                text-align: center;
            }

            .account-sidebar .nav-link span {
                vertical-align: middle;
            }
        </style>
    </head>
    <body>

        <!-- Menu -->
        <jsp:include page="Menu.jsp"/>

        <!-- Content -->
        <div class="container account-wrapper">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-3 mb-4">
                    <div class="nav flex-column nav-pills account-sidebar shadow-sm rounded-3 bg-white" role="tablist">
                        <a class="nav-link py-3 px-4 border-bottom active" data-bs-toggle="pill" href="#info">
                            <i class="fas fa-id-card me-2 text-primary"></i> <span class="text-dark">Thông tin tài khoản</span>
                        </a>

                        <a class="nav-link py-3 px-4 border-bottom" data-bs-toggle="pill" href="#address">
                            <i class="fas fa-map-marker-alt me-2 text-success"></i> <span class="text-dark">Địa chỉ đặt hàng</span>
                        </a>
                        <a class="nav-link py-3 px-4 border-bottom" data-bs-toggle="pill" href="#orders">
                            <i class="fas fa-box me-2 text-warning"></i> <span class="text-dark">Lịch sử đơn hàng</span>
                        </a>
                        <a class="nav-link py-3 px-4 text-danger" href="logout">
                            <i class="fas fa-sign-out-alt me-2"></i> <span class="text-danger">Đăng xuất</span>
                        </a>
                    </div>
                </div>




                <!-- Tab Content -->
                <div class="col-md-9">
                    <div class="tab-content">

                        <!-- Thông tin tài khoản -->
                        <div class="tab-pane fade show active" id="info">
                            <div class="account-card">
                                <h5 class="mb-4">Thông tin tài khoản</h5>
                                <form action="User?action=updateinfo" method="POST">
                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">Họ và tên</label>
                                        <input type="text" class="form-control" name="user_name" value="${sessionScope.acc.user_name}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="user_email" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="user_email" value="${sessionScope.acc.email}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="user_pass" class="form-label">Mật khẩu</label>
                                        <input type="password" class="form-control" name="user_pass" value="${sessionScope.acc.password}">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                </form>
                            </div>
                        </div>

                        <!-- Địa chỉ đặt hàng -->
                        <div class="tab-pane fade" id="address">
                            <div class="account-card">
                                <h5 class="mb-4">Cập nhật địa chỉ đặt hàng</h5>
                                <form action="User?action=updateAddress" method="POST">
                                    <div class="mb-3">
                                        <label class="form-label">Địa chỉ</label>
                                        <input type="text" class="form-control" name="address" value="${sessionScope.order_address}"  required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Số điện thoại</label>
                                        <input type="number" class="form-control" name="phone" value="${sessionScope.order_phone}"  required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Lưu địa chỉ</button>
                                </form>
                            </div>
                        </div>

                        <!-- Lịch sử đơn hàng -->
                        <div class="tab-pane fade" id="orders">
                            <div class="account-card">
                                <h5 class="mb-4">Lịch sử đơn hàng</h5>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Mã đơn</th>
                                                <th>Ngày đặt</th>
                                                <th>Thanh toán</th>
                                                <th>Địa chỉ</th>
                                                <th>Tổng tiền</th>
                                                <th>Chi tiết</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${bill}" var="b">
                                                <tr>
                                                    <td>#${b.bill_id}</td>
                                                    <td>${b.date}</td>
                                                    <td>${b.payment}</td>
                                                    <td>${b.address}</td>
                                                    <td>${b.total}₫</td>
                                                    <td><a href="User?action=showdetail&bill_id=${b.bill_id}" class="btn btn-sm btn-outline-info">Xem</a></td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty bill}">
                                                <tr><td colspan="6" class="text-center text-muted">Bạn chưa có đơn hàng nào.</td></tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div> <!-- tab-content -->
                </div>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="Footer.jsp"/>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
