<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
      
<head>
  
    <meta charset="UTF-8">

    <title>Quản lý người dùng | Admin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
</head>
<body >
    <jsp:include page="Menu.jsp" />
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Danh sách người dùng</h2>
            <button class="btn btn-outline-primary" onclick="myApp.printTable()">
                <i class="fas fa-print"></i> In danh sách
            </button>
        </div>

        <table id="sampleTable" class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên người dùng</th>
                    <th>Email</th>
                    <th>Quyền Admin</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${user}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.user_name}</td>
                        <td>${u.email}</td>
                        <td>${u.isAdmin}</td>
                        <td>
                            <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#updateModal${u.id}">
                                <i class="fas fa-edit"></i> Sửa quyền
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Modal cập nhật quyền -->
    <c:forEach items="${user}" var="u">
        <div class="modal fade" id="updateModal${u.id}" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form action="manageuser?action=update" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title">Chỉnh sửa quyền Admin</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="user_id" value="${u.id}">
                            <div class="form-group">
                                <label>Quyền quản trị</label>
                                <select name="permission" class="form-control">
                                    <option value="true" ${u.isAdmin == 'true' ? 'selected' : ''}>Cho phép</option>
                                    <option value="false" ${u.isAdmin == 'false' ? 'selected' : ''}>Hủy bỏ</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Lưu</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>

    <!-- Script -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        var myApp = {
            printTable: function () {
                var table = document.getElementById('sampleTable').outerHTML;
                var newWin = window.open('', '', 'width=800,height=600');
                newWin.document.write('<html><head><title>In danh sách</title></head><body>');
                newWin.document.write(table);
                newWin.document.write('</body></html>');
                newWin.document.close();
                newWin.print();
            }
        };

        function time() {
            let now = new Date();
            let options = { weekday: 'long', year: 'numeric', month: '2-digit', day: '2-digit' };
            let timeString = now.toLocaleDateString('vi-VN', options) + " - " +
                now.getHours() + " giờ " + now.getMinutes() + " phút " + now.getSeconds() + " giây";
            document.title = timeString;
        }
    </script>
    <jsp:include page="Footer.jsp" />
</body>
</html>
