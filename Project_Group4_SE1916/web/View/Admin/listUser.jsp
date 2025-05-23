<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>List User</title>
    </head>
    <body>
        <h2>List Users:</h2>
        <table border="1">
            <tr>
                <th>Username</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <c:forEach var="item" items="${data}">
                <tr>
                    <td>${item.username}</td>
                    <td>${item.fullName}</td>
                    <td>${item.email}</td>
                    <td>${item.phone}</td>
                    <td>${item.role.roleName}</td>
                    <td>${item.status}</td>
                    <td>
                        <a href="edituser?userId=${item.userId}">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
