/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.votingapp.mavenproject1;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 
 */
@WebServlet(name = "CandidateRegistrationServlet", urlPatterns = {"/candidateRegistration"})
public class CandidateRegistrationServlet extends HttpServlet {

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
            out.println("<title>Servlet CandidateRegistrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CandidateRegistrationServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        // Get form data from request
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String userPassword = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        int id = Integer.parseInt(request.getParameter("id"));
        String politicalParty = request.getParameter("political-party");

        // Establish a connection to the PostgreSQL database
        Connection conn = DBConnection.getConnection();

        try {

            // Prepare INSERT statement
            String sql = "INSERT INTO candidates (firstname, lastname, password, age, identificationnumber, political_party) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, firstname);
            pstmt.setString(2, lastname);
            pstmt.setString(3, userPassword);
            pstmt.setInt(4, age);
            pstmt.setInt(5, id);
            pstmt.setString(6, politicalParty);

            // Execute INSERT statement
            pstmt.executeUpdate();

            // Close resources
            pstmt.close();
            conn.close();
            // Redirect to success page
            response.sendRedirect("components/candidateSuccess.jsp");

        } catch (SQLException e) {
            System.err.println(e);
            response.sendRedirect("forms/registrationForm.jsp");
        }
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
