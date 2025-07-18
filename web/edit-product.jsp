<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
    <head>
        <title>Edit Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"/>
        <div class="container mt-5">
            <h3>Edit Product</h3>
            <form action="update" method="post" enctype="multipart/form-data" class="row">
                <div class="col-md-6">
                    <label>ID</label>
                    <input type="text" name="product_id" class="form-control" value="${product.id}" readonly>

                    <label>Category</label>
                    <select name="category_id" class="form-select">
                        <c:forEach items="${listCC}" var="cat">
                            <option value="${cat.cid}" ${cat.cid == product.cate.cid ? "selected" : ""}>
                                ${cat.cname}
                            </option>
                        </c:forEach>
                    </select>

                    <label>Name</label>
                    <input type="text" name="product_name" class="form-control" value="${product.name}">

                    <label>Price</label>
                    <input type="number" name="price" class="form-control" value="${product.price}">
                </div>

                <div class="col-md-6">
                    <label>Quantity</label>
                    <input type="number" name="quantity" class="form-control" value="${product.quantity}">

                    <label>Current Image</label><br>
                    <img src="${product.image}" width="100"><br>
                    <label>Change Image</label>
                    <input type="file" name="product_img" class="form-control" accept="image/*">

                    <input type="hidden" name="old_image" value="${product.image}">

                    <label>Description</label>
                    <textarea name="describe" class="form-control">${product.description}</textarea>
                </div>

                <div class="col-12 mt-3">
                    <button class="btn btn-primary">Update</button>
                    <a href="manage" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>

</html>

