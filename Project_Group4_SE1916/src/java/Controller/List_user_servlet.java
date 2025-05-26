package Controller;

import DAO.Userdao;
import Dal.DBContext;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/user")
public class List_user_servlet extends HttpServlet {
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306//quan_ly_vat_tu";
        String user = "root";
        String pass = "123456";
        return DriverManager.getConnection(url, user, pass);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try (Connection conn = DBContext.getConnection()) {
            Userdao dao = new Userdao(conn);
            List<User> userList = dao.getAllUsersWithRoles();
            request.setAttribute("data", userList);
            request.getRequestDispatcher("List_user.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    }

    
