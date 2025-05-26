<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8" />
       <title>Add New User</title>
    </head>
    <body>
        <h2>Add New User</h2>

         <form action="adduser" method="post">
             <table>
                 <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username" required /></td>
                     </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" name="fullName" required /></td>
                    </tr>
                 <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" required /></td>
                     </tr>
                 <tr>
                     <td>Email:</td>
                     <td><input type="email" name="email" required /></td>
                     </tr>
                <tr>
                    <td>Phone:</td>
                     <td><input type="text" name="phone" /></td>
                    </tr>
                 <tr>
                     <td>Date of Birth:</td>
                    <td><input type="date" name="dob" /></td>
                     </tr>
                 <tr>
                     <td>Status:</td>
                     <td>
                         <select name="status" required>
                            <option value="active">Active</option>
                             <option value="inactive">Inactive</option>
                             </select>
                         </td>
                   </tr>
                 <tr>
                    <td>Role:</td>
                    <td>
                        <select name="roleId">
                            <c:forEach var="role" items="${roles}">
                                <option value="${role.roleId}">${role.roleName}</option>
                            </c:forEach>
                        </select>
                        </td>
                     </tr>
                 <tr>
                    <td colspan="2">
                         <button type="submit">Add User</button>
                        </td>
                    </tr>
                 </table>
            </form>

        <p><a href="List_user.jsp">Back to User List</a></p>
    </body>
</html>
