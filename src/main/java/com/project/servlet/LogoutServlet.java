package com.project.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.project.util.DBConnection;

import java.sql.*;
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException {

        HttpSession session = req.getSession();
        session.invalidate();

        res.sendRedirect("login.jsp");
    }
}