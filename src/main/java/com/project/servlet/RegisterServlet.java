package com.project.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.project.util.DBConnection;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,email,password,role,status) VALUES (?,?,?,?,?)"
            );

            ps.setString(1, req.getParameter("name"));
            ps.setString(2, req.getParameter("email"));
            ps.setString(3, req.getParameter("password"));
            ps.setString(4, "user");
            ps.setString(5, "Pending");

            ps.executeUpdate();

            // ✅ FIXED REDIRECT
            res.sendRedirect(req.getContextPath() + "/jsp/security/register.jsp?msg=1");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}