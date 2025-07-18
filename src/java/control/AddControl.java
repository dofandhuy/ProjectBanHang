/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Category;
import entity.Color;
import entity.Product;
import entity.Size;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "AddControl", urlPatterns = {"/add"})
public class AddControl extends HttpServlet {

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
        String productid = request.getParameter("product_id");
        String categoryID = request.getParameter("category_id");
        String productname = request.getParameter("product_name");
        String price = request.getParameter("price");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String quantity = request.getParameter("quantity");
        Part filePart = request.getPart("product_img");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String img = "images/" + fileName;

        String describe = request.getParameter("describe");

        if (productid == null || categoryID == null || price == null || quantity == null
                || productname == null || describe == null || size == null || color == null
                || productid.isEmpty() || categoryID.isEmpty() || price.isEmpty() || quantity.isEmpty()) {
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin sản phẩm!");
            request.getRequestDispatcher("ManageProduct.jsp").forward(request, response);
            return;
        }
        int cid = Integer.parseInt(categoryID);
        int num = Integer.parseInt(quantity);
        double pricee = Double.parseDouble(price);

        DAO dao = new DAO();

        Category cate = new Category(cid);
        String[] size_rw = size.split("\\s*,\\s*");
        String[] color_rw = color.split("\\s*,\\s*");
        int[] sizez = new int[size_rw.length];
        int[] colorx = new int[color_rw.length];
        List<Size> list = new ArrayList<>();
        try {
            for (int i = 0; i < sizez.length; i++) {
                Size s = new Size(productid, size_rw[i]);
                list.add(s);
            }
        } catch (Exception e) {
        }
        // color
        List<Color> list2 = new ArrayList<>();
        try {
            for (int i = 0; i < colorx.length; i++) {
                Color s1 = new Color(productid, color_rw[i]);
                list2.add(s1);
            }
        } catch (Exception e) {
        }

        Product product = new Product();
        product.setCate(cate);
        product.setId(productid);
        product.setName(productname);
        product.setPrice(pricee);
        product.setDescription(describe);
        product.setQuantity(num);
        product.setImage(img);
        product.setSize(list);
        product.setColor(list2);
        dao.insertProduct(product);
        List<Category> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);
        response.sendRedirect("manage");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
