package com.project.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.project.util.DBConnection;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // ❌ Check approval first
                if(!"Approved".equals(rs.getString("status"))) {
                    res.sendRedirect(req.getContextPath() + "/jsp/security/login.jsp?error=notapproved");
                    return;
                }

                HttpSession session = req.getSession();
                session.setAttribute("user", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));
                session.setAttribute("userId", rs.getInt("id"));

                String role = rs.getString("role");

                // ✅ Correct redirects
                if("admin".equals(role)) {
                    res.sendRedirect(req.getContextPath() + "/jsp/admin/adminDashboard.jsp");
                } else {
                    res.sendRedirect(req.getContextPath() + "/jsp/user/dashboard.jsp");
                }

            } else {
                // ❌ Invalid login
                res.sendRedirect(req.getContextPath() + "/jsp/security/login.jsp?error=invalid");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}