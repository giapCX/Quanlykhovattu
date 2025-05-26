package Controller;

import DAO.UserDAO;
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
public class ListUserServlet extends HttpServlet {
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306//quan_ly_kho_vat_tu"; // sửa theo db bạn
        String user = "root";
        String pass = "123456";
        return DriverManager.getConnection(url, user, pass);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = getConnection()) {
            UserDAO userDAO = new UserDAO(conn);
            List<User> users = userDAO.getAllUsers();

            request.setAttribute("data", users);
            request.getRequestDispatcher("/user-list.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    // nếu cần xử lý POST cho thêm/sửa user thì bạn có thể thêm method doPost ở đây
}
