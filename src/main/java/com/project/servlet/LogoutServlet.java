package com.project.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException {

        HttpSession session = req.getSession();
        session.invalidate();

        // ✅ Correct absolute redirect
        res.sendRedirect(req.getContextPath() + "/jsp/security/login.jsp");
    }
}