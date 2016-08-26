/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.ProductController;
import controller.UserController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.CartDB;
import jdbc.DatabaseConnection;

/**
 *
 * @author Jasmin
 */
public class EditAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet EditAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAccountServlet at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password1");

        int user_id = 0;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        DatabaseConnection dbc = new DatabaseConnection();
        try {
            Connection conn = dbc.getConnection();
            String sql = "SELECT user_id FROM useraccount WHERE user_name = ? ";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();
            if (rs.next()) {
//                System.out.println("ID: " + rs.getInt("user_id"));
                user_id = rs.getInt("user_id");
            } else {
                System.out.println("Not found");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDB.class.getName()).log(Level.SEVERE, null, ex);
        }

        UserController uc = new UserController();
        boolean isEdited = uc.editUser(user_id, username, email, password);

        if (isEdited) {
            System.out.println("OH YES!");
            response.sendRedirect("account-list.jsp");
//            request.setAttribute("message", "Product " + name + " has been edited."); // Will be available as ${message}
//            request.getRequestDispatcher("product-list.jsp").forward(request, response);
        } else {
            System.out.println("UUHHHH!");
//            request.setAttribute("message", "Product " + name + " can't be edited."); // Will be available as ${message}
//            request.getRequestDispatcher("product-list.jsp").forward(request, response);
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
