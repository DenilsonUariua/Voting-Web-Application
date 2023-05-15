/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.votingapp.mavenproject1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * @author denilson
 */
@WebServlet(name = "VoteServlet", urlPatterns = {"/processVote"})
public class VoteServlet extends HttpServlet {

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
            out.println("<title>Servlet VoteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoteServlet at " + request.getContextPath() + "</h1>");
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
        // Retrieve candidate ID and voter ID from the form data
        int candidateId = Integer.parseInt(request.getParameter("candidateId"));
        int voterId = Integer.parseInt(request.getParameter("voterId"));

        // Establish a connection to the PostgreSQL database
        Connection conn = DBConnection.getConnection();
        
        HttpSession session = request.getSession();
        try {
            // Insert the vote into the "votes" table
            String insertSql = "INSERT INTO votes (candidate_id, voter_id) VALUES (?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                insertStmt.setInt(1, candidateId);
                insertStmt.setInt(2, voterId);
                int rowsAffected = insertStmt.executeUpdate();
                // Update the "votes" column in the "candidates" table
                if (rowsAffected == 1) {
                    String updateSql = "UPDATE candidates SET votes = votes + 1 WHERE id = ?";

                    PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                    updateStmt.setInt(1, candidateId);
                    updateStmt.executeUpdate();

                    String votedSql = "UPDATE voters SET voted = true WHERE id_number = ?";
                    PreparedStatement votedStmt = conn.prepareStatement(votedSql);
                    votedStmt.setInt(1, voterId);
                    votedStmt.executeUpdate();
                    session.setAttribute("voted", true);
                }   // Send a response back to the client
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                if (rowsAffected == 1) {
                    response.sendRedirect("components/votingSuccess.jsp");
                    out.println("<p>Vote submitted successfully.</p>");
                } else {
                    out.println("<p>Error submitting vote.</p>");
                }
                out.println("</body></html>");
                // Close the database connection and resources
            }
            conn.close();
        } catch (SQLException e) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, e);
            System.out.println("Voting failed " + e);
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
