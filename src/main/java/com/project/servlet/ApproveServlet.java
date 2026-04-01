package com.project.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.project.util.DBConnection;

public class ApproveServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String action = req.getParameter("action");

        try {
            Connection con = DBConnection.getConnection();

            String status = action.equals("approve") ? "Approved" : "Rejected";

            PreparedStatement ps = con.prepareStatement(
                "UPDATE leaves SET status=? WHERE id=?"
            );

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();

            res.sendRedirect("manageLeaves.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}