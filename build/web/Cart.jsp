<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    entity.Cart cart = (entity.Cart) session.getAttribute("cart");
    double total = 0;
    int totalQuantity = 0;

    if (cart != null) {
        for (entity.Item item : cart.getItems()) {
            total += item.getProduct().getPrice() * item.getQuantity();
            totalQuantity += item.getQuantity();
        }
    }

    double vat = total * 0.1;
    double finalTotal = total + vat;

    request.setAttribute("total", total);
    request.setAttribute("vat", vat);
    request.setAttribute("totalQuantity", totalQuantity);
    request.setAttribute("finalTotal", finalTotal);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng | Mejin Shop</title>

        <!-- Bootstrap + Font Awesome -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>
            .shopping-cart {
                background: #f8f9fa;
                padding: 30px 0;
            }
            .cart-table img {
                width: 70px;
                border-radius: 8px;
            }
            .btnSub, .btnAdd {
                border: none;
                background-color: #e9ecef;
                width: 30px;
                height: 30px;
                border-radius: 50%;
                font-weight: bold;
            }
            .btnSub:hover, .btnAdd:hover {
                background-color: #adb5bd;
                color: white;
            }
        </style>
    </head>

    <body>
        <jsp:include page="Menu.jsp" />

        <div class="shopping-cart">
            <div class="container">
                <div class="bg-white rounded shadow-sm p-4 mb-4">

                    <!-- Cart Table -->
                    <h4 class="mb-4">Giỏ hàng của bạn</h4>
                    <div class="table-responsive">
                        <table class="table cart-table">
                            <thead class="thead-light">
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.cart.items}" var="i">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="${i.product.image}" alt="${i.product.name}">
                                                <div class="ml-3">
                                                    <h6 class="mb-0">${i.product.name}</h6>
                                                    <small>Size: ${i.size}, Màu: ${i.color}</small>
                                                </div>
                                            </div>
                                        </td>
                                        <td><strong>${i.product.price} đ</strong></td>
                                        <td>
                                            <c:if test="${i.quantity > 1}">
                                                <a href="sub?id=${i.product.id}&size=${i.size}&color=${i.color}" class="btnSub">−</a>
                                            </c:if>
                                            <c:if test="${i.quantity <= 1}">
                                                <span class="btnSub text-muted">−</span>
                                            </c:if>
                                            <strong class="mx-2">${i.quantity}</strong>
                                            <a href="plus?id=${i.product.id}&size=${i.size}&color=${i.color}" class="btnAdd">+</a>
                                        </td>
                                        <td>
                                            <a href="remove?id=${i.product.id}&size=${i.size}&color=${i.color}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <p class="form-error">${message}</p>
                    <!-- Summary + Voucher -->
                    <div class="row mt-4">


                        <div class="col-md-6">
                            <div class="bg-light rounded p-3">
                                <h6 class="text-uppercase font-weight-bold">Tổng thanh toán</h6>
                                <ul class="list-unstyled">
                                    <li class="d-flex justify-content-between mt-2">
                                        <span>Tổng tiền hàng</span><strong>${total} đ</strong>
                                    </li>
                                    <li class="d-flex justify-content-between mt-2">
                                        <span>Phí vận chuyển</span><strong>Free ship</strong>
                                    </li>
                                    <li class="d-flex justify-content-between mt-2">
                                        <span>VAT (10%)</span><strong>${vat} đ</strong>
                                    </li>
                                    <hr>
                                    <li class="d-flex justify-content-between mt-2">
                                        <span class="font-weight-bold">Thành tiền</span>
                                        <h5 class="font-weight-bold text-danger">${finalTotal} đ</h5>
                                    </li>
                                </ul>
                                <form action="buy" method="post">
                                    <button type="submit" class="btn btn-success btn-lg w-100">
                                        <i class="fas fa-credit-card"></i> Thanh toán ngay
                                    </button>
                                </form>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <!-- Scripts -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
