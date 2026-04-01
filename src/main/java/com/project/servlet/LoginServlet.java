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
                HttpSession session = req.getSession();
                session.setAttribute("user", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));
                session.setAttribute("userId", rs.getInt("id"));   // ✅ ADD THIS

                String role = rs.getString("role");

                if(role.equals("admin")) {
                    res.sendRedirect("adminDashboard.jsp");
                } else {
                    res.sendRedirect("dashboard.jsp");
                }
            } else {
                res.getWriter().println("Invalid Login!");
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}