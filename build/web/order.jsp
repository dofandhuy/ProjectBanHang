<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng | Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Boxicons -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7fa;
        }
        .main-container {
            max-width: 1200px;
            margin: auto;
            padding: 2rem 1rem;
        }
        .admin-title {
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .order-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .table th {
            background-color: #2a4d80;
            color: white;
            vertical-align: middle;
        }
        .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>

    <!-- Menu cố định -->
    <jsp:include page="Menu.jsp"/>

    <!-- Nội dung chính -->
    <div class="main-container">
        <div class="admin-title">
            <i class='bx bx-receipt bx-sm text-primary'></i>
            <h4 class="mb-0">Danh sách đơn hàng</h4>
        </div>

        <div class="order-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <p class="text-muted mb-0">Tổng số đơn: <strong>${fn:length(bill)}</strong></p>
                <button class="btn btn-outline-primary btn-sm" onclick="printTable()">
                    <i class='bx bx-printer'></i> In danh sách
                </button>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered text-center" id="sampleTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Khách hàng</th>
                            <th>SĐT</th>
                            <th>Địa chỉ</th>
                            <th>Ngày mua</th>
                            <th>Tổng tiền</th>
                            <th>Thanh toán</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bill}" var="b">
                            <tr>
                                <td>${b.bill_id}</td>
                                <td>${b.account.user_name}</td>
                                <td>(+84) ${b.phone}</td>
                                <td>${b.address}</td>
                                <td>${b.date}</td>
                                <td><strong>${b.total}</strong></td>
                                <td>
                                    <span class="badge bg-${b.payment eq 'Đã thanh toán' ? 'success' : 'warning'}">
                                        ${b.payment}
                                    </span>
                                </td>
                                <td>
                                    <a href="manageorder?action=showdetail&bill_id=${b.bill_id}"
                                       class="btn btn-sm btn-outline-info">
                                        <i class='bx bx-detail'></i> Chi tiết
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer giữ nguyên -->
    <jsp:include page="Footer.jsp"/>

    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function printTable() {
            const table = document.getElementById('sampleTable').outerHTML;
            const win = window.open('', '', 'width=800,height=600');
            win.document.write('<html><head><title>In đơn hàng</title></head><body>');
            win.document.write(table);
            win.document.write('</body></html>');
            win.document.close();
            win.print();
        }
    </script>
</body>
</html>
