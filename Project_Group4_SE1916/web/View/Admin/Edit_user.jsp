<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>Edit User</title></head>
<body>
    <h2>Edit User</h2>
    <form action="edituser" method="post">
        <input type="hidden" name="userId" value="${user.userId}" />

        <p><strong>Username:</strong> ${user.username}</p>

        <label>Role:
            <select name="roleId">
                <c:forEach var="r" items="${roles}">
                    <option value="${r.roleId}" ${r.roleId == user.role.roleId ? 'selected' : ''}>
                        ${r.roleName}
                    </option>
                </c:forEach>
            </select>
        </label><br><br>

        <label>Status:
            <select name="status">
                <option value="active" ${user.status == 'active' ? 'selected' : ''}>Active</option>
                <option value="inactive" ${user.status == 'inactive' ? 'selected' : ''}>Inactive</option>
            </select>
        </label><br><br>

        <button type="submit">Update</button>
    </form>
</body>
</html>
