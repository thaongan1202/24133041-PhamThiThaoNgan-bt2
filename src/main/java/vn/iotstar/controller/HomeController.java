package vn.iotstar.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.User;
import vn.iotstar.util.Constant;

@WebServlet(urlPatterns = { "/home", "/admin/home", "/manager/home" })
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        User u = session == null ? null : (User) session.getAttribute(Constant.SESSION_ACCOUNT);
        if (u == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String base = req.getContextPath();
        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().println("<h2>Xin chào " + u.getFullname() + " (roleid = " + u.getRoleid() + ")</h2>");
        resp.getWriter().println("<a href='" + base + "/admin/categories'>Quản lý danh mục</a> | ");
        resp.getWriter().println("<a href='" + base + "/logout'>Đăng xuất</a>");
    }
}