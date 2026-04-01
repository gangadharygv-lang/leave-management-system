package com.project.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.project.util.DBConnection;

import java.sql.*;

public class ApproveUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET status='Approved' WHERE id=?"
            );

            ps.setInt(1, id);
            ps.executeUpdate();

            res.sendRedirect("manageUsers.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}