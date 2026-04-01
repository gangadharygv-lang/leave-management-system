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
            HttpSession session = req.getSession(false);

            // 🔐 Session check
            if(session == null || session.getAttribute("userId") == null) {
                res.sendRedirect(req.getContextPath() + "/jsp/security/login.jsp");
                return;
            }

            int userId = (int) session.getAttribute("userId");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO leaves(user_id, leave_type, from_date, to_date, reason, status) VALUES (?,?,?,?,?,?)"
            );

            ps.setInt(1, userId);
            ps.setString(2, req.getParameter("type"));
            ps.setString(3, req.getParameter("from"));
            ps.setString(4, req.getParameter("to"));
            ps.setString(5, req.getParameter("reason"));
            ps.setString(6, "Pending");

            ps.executeUpdate();

            // ✅ FIXED REDIRECT
            res.sendRedirect(req.getContextPath() + "/jsp/user/dashboard.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}