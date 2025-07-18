<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="Menu.jsp" />
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Management Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            img {
                max-width: 100px;
                height: auto;
            }
            .card-header {
                background-color: #0d6efd;
                color: white;
            }
            .modal-body input,
            .modal-body textarea,
            .modal-body select {
                margin-bottom: 1rem;
            }
        </style>
    </head>

    <body>
        <div class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>Product Manager</h2>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Product</button>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td><img src="${o.image}" alt="product-img"></td>
                                <td>${o.price} $</td>
                                <td>
                                    <a href="edit?pid=${o.id}" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="delete?pid=${o.id}" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>

            <!-- Add Product Modal -->
            <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form action="add" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addProductLabel">Add New Product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body row">
                                <div class="col-md-6">
                                    <label>Product ID</label>
                                    <input type="text" name="product_id" class="form-control">

                                    <label>Category</label>
                                    <select name="category_id" class="form-select">
                                        <option value="0">-- Select Category --</option>
                                        <c:forEach items="${listCC}" var="cat">
                                            <option value="${cat.cid}">${cat.cname}</option>
                                        </c:forEach>
                                    </select>

                                    <label>Product Name</label>
                                    <input type="text" name="product_name" class="form-control">

                                    <label>Price</label>
                                    <input type="number" name="price" class="form-control">
                                </div>

                                <div class="col-md-6">
                                    <label>Size</label>
                                    <input type="text" name="size" class="form-control">

                                    <label>Color</label>
                                    <input type="text" name="color" class="form-control">

                                    <label>Quantity</label>
                                    <input type="number" name="quantity" class="form-control">

                                    <label>Product Image</label>
                                    <input type="file" name="product_img" class="form-control" accept="image/*">
                                </div>

                                <div class="col-12">
                                    <label>Description</label>
                                    <textarea name="describe" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Add Product</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="Footer.jsp" /> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>