/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.DAO;
import entity.Category;
import entity.Product;
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

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name="UpdateControl", urlPatterns={"/update"})
public class UpdateControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO dao = new DAO();

        String id = request.getParameter("product_id");
        String name = request.getParameter("product_name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String describe = request.getParameter("describe");
        String cateId = request.getParameter("category_id");
        String oldImg = request.getParameter("old_image");

        Part imgPart = request.getPart("product_img");
        String fileName = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();

        // Nếu không chọn ảnh mới thì giữ ảnh cũ
        String imgPath;
        if (fileName == null || fileName.isEmpty()) {
            imgPath = oldImg;
        } else {
            // Upload vào thư mục thực
            String uploadPath = getServletContext().getRealPath("") + "images";
            imgPart.write(uploadPath + "/" + fileName);
            imgPath = "images/" + fileName;
        }

        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setPrice(Double.parseDouble(price));
        p.setQuantity(Integer.parseInt(quantity));
        p.setDescription(describe);
        p.setImage(imgPath);
        p.setCate(new Category(Integer.parseInt(cateId)));

        dao.updateProduct(p);
        response.sendRedirect("manage");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
