/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Cart;
import entity.Item;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartControl", urlPatterns = {"/cart"})
public class CartControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ form
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Lấy size và color nếu có, không thì dùng "Default"
        String size = request.getParameter("size") != null ? request.getParameter("size") : "Default";
        String color = request.getParameter("color") != null ? request.getParameter("color") : "Default";

        // Tạo đối tượng Product
        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setPrice(price);
        product.setImage(image);

        // Tạo đối tượng Item
        Item item = new Item(product, quantity, size, color);

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Lấy user nếu đã đăng nhập
        Account user = (Account) session.getAttribute("acc");
        cart.addItem(item); // thêm vào session

        // Nếu đã login → lưu vào DB
        if (user != null) {
            DAO dao = new DAO();
            Item existing = dao.getItemByUserAndProduct(user.getId(), id, size, color);
            if (existing != null) {
                int newQty = existing.getQuantity() + quantity;
                item.setQuantity(newQty);
                dao.updateQuantity(user.getId(), item);
            } else {
                dao.addToCart(user.getId(), item);
            }
        }

// Cập nhật giỏ hàng trong session cho cả login và chưa login
        session.setAttribute("cart", cart);

// Quay lại trang chi tiết sản phẩm
        response.sendRedirect("detail?product_id=" + id);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
