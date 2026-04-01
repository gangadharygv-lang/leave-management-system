package com.project.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.project.util.DBConnection;

public class ApplyLeaveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO leaves(user_id, leave_type, from_date, to_date, reason, status) VALUES (?,?,?,?,?,?)"
            );

            HttpSession session = req.getSession();
            String userName = (String) session.getAttribute("user");

            // temporary logic to map user → id
            int userId = 1; // we will improve later with DB

            ps.setInt(1, userId);
            ps.setString(2, req.getParameter("type"));
            ps.setString(3, req.getParameter("from"));
            ps.setString(4, req.getParameter("to"));
            ps.setString(5, req.getParameter("reason"));
            ps.setString(6, "Pending");

            ps.executeUpdate();

            res.sendRedirect("dashboard.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}