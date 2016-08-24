/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import controller.CartController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.CartDB;
import jdbc.DatabaseConnection;
import jdbc.ProductDB;
import model.Product;
import model.TransactionItem;
import model.User;

/**
 *
 * @author Jasmin
 */
public class AddToCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private int product_id;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        String name = request.getParameter("productName");
        String price = request.getParameter("productPrice");
        String quantity = request.getParameter("quantity");
      
        PreparedStatement stmt = null;
        ResultSet rs = null;
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "SELECT product_id FROM product WHERE product_name = ? ";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            rs = stmt.executeQuery();
            if(rs.next()) {
                product_id = rs.getInt("product_id");
                System.out.println("Product ID: " + product_id);
            } else {
                System.out.println("Not found");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        CartController cc = new CartController();
        boolean result = cc.addToCart(user.getUserId(), product_id, Integer.parseInt(quantity));
        if(result) {
            ProductDB pdb = new ProductDB();
            List<Product> productList = pdb.getProducts();

            ArrayList<TransactionItem> cartList = cc.getCart(user.getUserId());
            int cartSize = cartList.size();
            
            System.out.println("username: " + user.getUsername() + " " + user.getUserId());
            session.setAttribute("user", user);
            session.setAttribute("productList", productList);
            session.setAttribute("cartList", cartList);
            session.setAttribute("cartSize", cartSize);
            
            request.getRequestDispatcher("catalog.jsp").forward(request,response); 
        }
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
