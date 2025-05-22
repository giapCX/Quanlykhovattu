/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.ResetRequest;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class AdminApproveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        ArrayList<ResetRequest> requests = ResetPassword_Controller.getResetRequests();
        synchronized (requests) {
            for (ResetRequest req : requests) {
                if (req.getUsername().equals(username) && req.getStatus().equals("pending")) {
                    req.setStatus("done");

                    //  Reset password tại đây (ví dụ update DB, nhưng demo thì chỉ log ra)
                    System.out.println("Password của " + username + " đã được reset về mặc định: 123456");
                }
            }
        }

        response.sendRedirect("adminView.jsp");
    }
}