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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class SignInServlet extends HttpServlet {

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
            out.println("<title>Servlet SignInServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignInServlet at " + request.getContextPath() + "</h1>");
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
        PasswordHashing ph = new PasswordHashing();
        DatabaseConnection dc = new DatabaseConnection();
        Connection conn = null;
        Statement s = null;
        
        try {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Open a connection
            conn = dc.getConnection();  
            s = (Statement) conn.createStatement();
            
            //Get ResultSet
            ResultSet r;
            r = s.executeQuery("SELECT user_name, password FROM useraccount");
            
            while(r.next()){
                String dbUsername = r.getString("user_name");
                String dbPassword = r.getString("password");

                if(dbUsername.equals(username) && ph.checkPassword(password, dbPassword)){
                    out.println("PASOK<br/>");
                    
                    break;
                    //response.sendRedirect("MainPage.jsp");
                    //then start session on that page
                }else{
                    //prompt user w/ wrong username and password
                }
            }

            //Clean up environment
            conn.close();
            dc.closeConnection();
            
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
