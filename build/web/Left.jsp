
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Sidebar Column -->
<div class="col-lg-3 col-md-4 mb-4">

    <!-- Categories Card -->
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-primary text-white fw-bold">
            <i class="fas fa-th-list"></i> Categories
        </div>
        <ul class="list-group list-group-flush">
            <c:forEach items="${listCC}" var="o">
                <li class="list-group-item">
                    <a href="category?cid=${o.cid}" class="text-decoration-none text-dark">
                        ${o.cname}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- Last Product Card -->
    <div class="card shadow-sm">
        <div class="card-header bg-success text-white fw-bold">
            <i class="fas fa-star"></i> Last Product
        </div>
        <div class="card-body">
            <img src="${p.image}" class="img-fluid mb-2 rounded" alt="Product Image">
            <h5 class="card-title mb-1">${p.name}</h5>
            <p class="card-text small">${p.description}</p>
            <p class="text-danger fw-bold">${p.price} $</p>
            <a href="detail?product_id=${p.id}" class="btn btn-outline-primary btn-sm">
                View Detail
            </a>
        </div>
    </div>

</div>
