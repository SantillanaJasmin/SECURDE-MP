/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import controller.UserController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jasmin
 */
public class AddAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet AddAccountServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccountServlet at " + request.getContextPath() + "</h1>");
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
        String fName = request.getParameter("firstName");
        String midInitial = request.getParameter("middleInitial");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("temporaryPassword1");
        String type = request.getParameter("accountType");
        int accountType = 0;
        if (type.equals("ProductManager")) {
            accountType = 3;
        } else if (type.equals("AccountingManager")) {
            accountType = 2;
        }

        UserController uc = new UserController();
        boolean isRegistered = uc.signUp(fName, midInitial, lName, username, password, email, accountType);

        if (!isRegistered) {
//            System.out.println("Hindi Pasok");
//            request.setAttribute("message", username + " can't be added."); // Will be available as ${message}
//            request.getRequestDispatcher("account-list.jsp").forward(request, response);
        } else {
//            System.out.println("Pasok");
//            request.setAttribute("message", username + " has been added."); // Will be available as ${message}
//            request.getRequestDispatcher("account-list.jsp").forward(request, response);
            response.sendRedirect("account-list.jsp");
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
