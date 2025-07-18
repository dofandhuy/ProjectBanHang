/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Bill;
import entity.Cart;
import entity.Item;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BuyControl", urlPatterns = {"/buy"})
public class BuyControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Cart cart = (Cart) session.getAttribute("cart");
        Account acc = (Account) session.getAttribute("acc");

        Object user = (session != null) ? session.getAttribute("acc") : null;

        if (user == null) {
            // Chưa đăng nhập → chuyển về trang login
            response.sendRedirect("Login.jsp");
            return;
        }
        if (cart == null || cart.getItems().isEmpty()) {
            request.setAttribute("message", "Giỏ hàng trống. Vui lòng thêm sản phẩm trước khi thanh toán.");
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
            return;
        }

        DAO dao = new DAO();

        // Giả sử địa chỉ và phone được nhập (hoặc bạn có thể lấy mặc định)
        
        String payment = "COD";
        String address = (String) session.getAttribute("order_address");
        String phoneStr = (String) session.getAttribute("order_phone");
        if (address == null) {
            address = "Chưa cập nhật";
        }
        if (phoneStr == null || phoneStr.isEmpty()) {
            phoneStr = "0";
        }
        int phone = Integer.parseInt(phoneStr);

        // Tạo bill
        Bill bill = new Bill(0, acc, (float) cart.getTotalMoney(), payment, address, new java.sql.Date(System.currentTimeMillis()), phone);
        int billId = dao.insertBill(bill);

        // Tạo từng chi tiết đơn hàng
        for (Item item : cart.getItems()) {
            dao.insertBillDetail(billId, item);
        }

        // Xoá giỏ hàng khỏi DB nếu cần
        dao.clearCart(acc.getId());

        // Sau khi thanh toán, xoá giỏ hàng:
        session.removeAttribute("cart");

        // Gửi tới trang xác nhận
        request.setAttribute("success", "Đơn hàng của bạn đã được đặt thành công!");
        request.getRequestDispatcher("order-success.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
