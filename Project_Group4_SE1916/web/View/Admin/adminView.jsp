<%-- 
    Document   : adminView
    Created on : May 22, 2025, 11:56:01 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*, controller.ResetPassword_Controller, model.ResetRequest" %>

<html>
<head><title>Quản lý Yêu cầu Reset</title></head>
<body>
<h2>Danh sách yêu cầu reset mật khẩu</h2>
<table border="1">
<tr><th>Username</th><th>Trạng thái</th><th>Hành động</th></tr>

<%
    ArrayList<ResetRequest> requests = ResetRequestServlet.getResetRequests();
    for (ResetRequest req : requests) {
%>
<tr>
    <td><%= req.getUsername() %></td>
    <td><%= req.getStatus() %></td>
    <td>
        <% if (req.getStatus().equals("pending")) { %>
        <form action="AdminApproveServlet" method="post" style="display:inline;">
            <input type="hidden" name="username" value="<%= req.getUsername() %>">
            <input type="submit" value="Reset">
        </form>
        <% } else { %> Đã xử lý <% } %>
    </td>
</tr>
<% } %>
</table>
</body>
</html>
