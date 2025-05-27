package Controller;

import DAO.Roledao;
import DAO.Userdao;
import Dal.DBContext;
import Model.Role;
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
        String url = "jdbc:mysql://localhost:3306//quan_ly_kho_vat_tu";
        String user = "root";
        String pass = "123456";
        return DriverManager.getConnection(url, user, pass);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session Check
//        String username = (String) request.getSession().getAttribute("username");
//        if (username == null) {
//            response.sendRedirect("Login.jsp");
//            return;
//        }
        String search = request.getParameter("search");
String roleIdParam = request.getParameter("roleId");
String status = request.getParameter("status");
String pageParam = request.getParameter("page");

int currentPage = 1;
int recordsPerPage = 8;

if (pageParam != null) {
    try {
        currentPage = Integer.parseInt(pageParam);
    } catch (NumberFormatException e) {
        currentPage = 1;
    }
}

Integer roleId = null;
if (roleIdParam != null && !roleIdParam.isEmpty()) {
    try {
        roleId = Integer.parseInt(roleIdParam);
    } catch (NumberFormatException e) {
        roleId = null;
    }
}

try (Connection conn = DBContext.getConnection()) {
    Userdao userDAO = new Userdao(conn);
    Roledao roleDAO = new Roledao(conn);

    // Tổng số user theo search, role, status filter
    int totalRecords = userDAO.countUsersByNameRoleStatus(search, roleId, status);

    // Tính offset để phân trang
    int offset = (currentPage - 1) * recordsPerPage;

    // Lấy danh sách user theo điều kiện + phân trang
   List<User> users = userDAO.searchUsersByNameRoleStatusWithPaging(search, roleId, status, offset, recordsPerPage);
    List<Role> roles = roleDAO.getAllRoles();

    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);

    request.setAttribute("data", users);
    request.setAttribute("roles", roles);
    request.setAttribute("search", search);
    request.setAttribute("roleId", roleId);
    request.setAttribute("status", status);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("totalPages", totalPages);

    request.getRequestDispatcher("List_user.jsp").forward(request, response);
} catch (Exception e) {
    throw new ServletException(e);
}

    }
}

// nếu cần xử lý POST cho thêm/sửa user thì bạn có thể thêm method doPost ở đây

