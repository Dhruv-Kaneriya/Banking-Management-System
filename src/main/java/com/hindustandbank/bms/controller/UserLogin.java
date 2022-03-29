package com.hindustandbank.bms.controller;

import com.hindustandbank.bms.dao.UserDao;
import com.hindustandbank.bms.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "userLogin", value = "/login")
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        UserDao userDao = new UserDao();
        //getting session object from request
        HttpSession session = request.getSession();

        try {
            Boolean doesUserExist = userDao.authenticateUser(user);
            if (doesUserExist) {
                //setting session object to id
                session.setAttribute("id", username);
                response.sendRedirect("customer_registration");
                } else {
                request.setAttribute("errMessage", "Invalidate Username or Password");
                request.getRequestDispatcher("/index.jsp").forward(request, response);//forwarding the request
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
