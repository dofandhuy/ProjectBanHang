<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng | Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Boxicons -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }

        .main-content {
            padding: 2rem;
        }

        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>

<body>
    <jsp:include page="Menu.jsp" />

    <!-- Main Content -->
    <div class="main-content w-100">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Chi tiết đơn hàng</h3>
            <button class="btn btn-outline-primary" onclick="myApp.printTable()">
                <i class='bx bx-printer'></i> In dữ liệu
            </button>
        </div>

        <table class="table table-bordered table-hover bg-white" id="sampleTable">
            <thead class="table-dark text-center">
                <tr>
                    <th>Ảnh</th>
                    <th>Mã SP</th>
                    <th>Tên SP</th>
                    <th>Size</th>
                    <th>Màu</th>
                    <th>Số lượng</th>
                    <th>Đơn giá</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${detail}" var="d">
                    <tr class="text-center">
                        <td><img src="${d.product.image}" alt="ảnh" width="80px" /></td>
                        <td>${d.product.id}</td>
                        <td>${d.product.name}</td>
                        <td>${d.size}</td>
                        <td>${d.color}</td>
                        <td>${d.quantity}</td>
                        <td>${d.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        var myApp = {
            printTable: function () {
                const table = document.getElementById('sampleTable').outerHTML;
                const win = window.open('', '', 'width=800,height=600');
                win.document.write('<html><head><title>In dữ liệu</title></head><body>');
                win.document.write(table);
                win.document.write('</body></html>');
                win.document.close();
                win.print();
            }
        };
    </script>

    <jsp:include page="Footer.jsp" />
</body>

</html>
