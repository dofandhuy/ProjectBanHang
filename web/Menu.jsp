<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Link Bootstrap + Font Awesome -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    .navbar-custom {
        background-color: #212529;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }
    .navbar-brand span {
        font-weight: bold;
        color: #00d1b2;
    }
    .nav-link {
        color: #ffffff !important;
        font-weight: 500;
    }
    .nav-link:hover {
        color: #00d1b2 !important;
    }
    .search-bar {
        width: 250px;
    }
    .badge-cart {
        position: absolute;
        top: 0;
        right: 0;
        background: red;
        color: white;
        border-radius: 50%;
        font-size: 0.7rem;
        padding: 2px 6px;
    }

</style>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="home">
            <i class="fas fa-store"></i> <span>MEJIN SHOP</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavbar"
                aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home"><i class="fas fa-home"></i> Home</a>
                </li>
                <c:if test="${sessionScope.acc != null && sessionScope.acc.isAdmin eq 'TRUE'}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-cogs"></i> Admin Panel
                        </a>
                        <div class="dropdown-menu" aria-labelledby="adminDropdown">
                            <a class="dropdown-item" href="manage"><i class="fas fa-box"></i> Manage Products</a>
                            <a class="dropdown-item" href="manageuser"><i class="fas fa-users-cog"></i> Manage Users</a>
                            <a class="dropdown-item" href="manageorder"><i class="fas fa-clipboard-list"></i> Manage Orders</a>
                        </div>
                    </li>
                </c:if>
            </ul>

            <!-- Search Bar -->
            <form action="search" method="get" class="d-flex align-items-center mr-3">
                <input name="txt" value="${txtS}" type="text" class="form-control form-control-sm search-bar"
                       placeholder="Search products...">
                <button type="submit" class="btn btn-success btn-sm ml-2">
                    <i class="fas fa-search"></i>
                </button>
            </form>


            <!-- Right Section: User + Cart -->
            <ul class="navbar-nav ml-auto">
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="myaccount.jsp">
                            <i class="fas fa-user"></i> Hello, <strong>${sessionScope.acc.user_name}</strong>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                    </li>
                </c:if>

                <!-- Cart Icon -->
                <c:if test="${sessionScope.acc == null || sessionScope.acc.isAdmin ne 'TRUE'}">
                    <li class="nav-item position-relative ml-3">
                        <a class="nav-link" href="Cart.jsp">
                            <i class="fas fa-shopping-cart fa-lg"></i>
                            <span class="badge-cart"><c:out value="${fn:length(sessionScope.cart.items)}" /></span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero banner -->
<section class="jumbotron text-center bg-light mb-0">
    <div class="container">
        <h1 class="jumbotron-heading font-weight-bold">Thời trang cao cấp, giá cực mềm</h1>
        <p class="lead text-muted">
            Mua sắm dễ dàng – Uy tín tạo nên thương hiệu suốt hơn 10 năm.
        </p>
    </div>
</section>
