<%-- 
    Document   : ResetPassword
    Created on : May 21, 2025, 10:10:09 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý kho vật tư</title>
    </head>
    <body>
        <h2> Reset Password</h2>

        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
        <div style="padding: 10px; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 4px; width: 300px;">
            <%= message %>
        </div>
        <% } %>

        <form action="reset_password" method="post">
            Username: <input type="text" name="username" required><br><br>
            <input type="submit" value="Gửi yêu cầu">
        </form>

        <script>
            setTimeout(() => {
                const msg = document.querySelector("div[style*='background-color']");
                if (msg)
                    msg.style.display = "none";
            }, 3000);
        </script>
    </body>
</html>
