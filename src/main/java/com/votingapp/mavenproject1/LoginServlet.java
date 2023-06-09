/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.votingapp.mavenproject1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at iii" + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        // handle the exception
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
        String firstname = request.getParameter("firstname");
        String userPassword = request.getParameter("password");

        // Check if the provided credentials are valid (for example, by querying a database)
        if (isValidCredentials(firstname, userPassword, request)) {

            response.sendRedirect("navigation/homePage.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid login credentials");
            response.sendRedirect("forms/loginForm.jsp?error=1");
        }
    }

    private boolean isValidCredentials(String firstname, String userPassword, HttpServletRequest request) {

        try {
            HttpSession session = request.getSession();

            // Establish a connection to the PostgreSQL database
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT firstname, lastname, age, id_number, voted FROM voters WHERE firstname = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, firstname);
            pstmt.setString(2, userPassword);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                session.setAttribute("firstname", rs.getString("firstname"));
                session.setAttribute("lastname", rs.getString("lastname"));
                session.setAttribute("age", rs.getString("age"));
                session.setAttribute("idNumber", rs.getString("id_number"));
                session.setAttribute("voted", rs.getBoolean("voted"));

                System.out.println("Passwords match, login successful");
                rs.close();
                pstmt.close();
                conn.close();
                return true; // Passwords match, login successful
            } else {
                // No candidate with the given firstname found, login failed
                System.out.println("Invalid login credentials, login failed");
                rs.close();
                pstmt.close();
                conn.close();
                return false;
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            return false;
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
