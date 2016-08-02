/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.PasswordHashing;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdbc.DatabaseConnection;

/**
 *
 * @author Jasmin
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
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

        PrintWriter out = response.getWriter();
        DatabaseConnection dc = new DatabaseConnection();
        PasswordHashing ph = new PasswordHashing();
        Connection conn = null;
        PreparedStatement ps = null;

        String firstname = request.getParameter("firstname");
        String middlename = request.getParameter("middlename");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String verifypassword = request.getParameter("verifypassword");
        int acctypeid = 4;

        password = ph.PasswordHashing(password);
        System.out.println(password);

        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = dc.getConnection();

            // Execute SQL query
            String sql;
            sql = "INSERT INTO useraccount (user_name, password, account_type_id, first_name, middle_initial, last_name, email) VALUES(?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, acctypeid);
            ps.setString(4, firstname);
            ps.setString(5, middlename);
            ps.setString(6, lastname);
            ps.setString(7, email);
            ps.executeUpdate();

            //Clean up environment
            conn.close();
            dc.closeConnection();

            //TODO: Redirected to Main Page
           response.sendRedirect("catalog.jsp");
        } catch (SQLException se) {
            out.println("Stack Trace:<br/>");
            se.printStackTrace(out);
            out.println("<br/><br/>Stack Trace (for web display):</br>");
            out.println(displayErrorForWeb(se));
        } catch (ClassNotFoundException ce) {
            out.println("Stack Trace:<br/>");
            ce.printStackTrace(out);
            out.println("<br/><br/>Stack Trace (for web display):</br>");
            out.println(displayErrorForWeb(ce));
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

    public String displayErrorForWeb(Throwable t) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        t.printStackTrace(pw);
        String stackTrace = sw.toString();
        return stackTrace.replace(System.getProperty("line.separator"), "<br/>\n");
    }

}
