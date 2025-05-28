<%-- 
    Document   : forgetPassword
    Created on : May 24, 2025, 10:19:02 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Assets/css/styleLogin.css"/>
        <link rel="icon" href="../Assets/icon/favicon.png"/>
        <title>Forget Password</title>
        <style>
            .login{
                border-radius: 12px;
                background: white;
            }
            .login-label{
                color: black;
            }
            #loading {
                display: none;
            }
        </style>
    </head>
    <body>
        <div id="loading">
            <img src="https://img.pikbest.com/png-images/20190918/cartoon-snail-loading-loading-gif-animation_2734139.png!bw700" 
                 style="position: fixed;
                 z-index: 10000;
                 top: 50%;
                 left: 50%;
                 width: 200px;
                 height: 200px;
                 background: wheat;
                 border-radius: 15px;
                 transform: translateX(-50%) translateY(-50%)">
        </div>
        <div class="login">
            <h1 class="login-heading">Quên mật khẩu</h1>
            <div class="alert alert-danger" role="alert" style="color: red; margin-bottom: 1em; text-align: center"">
                ${mess}
            </div>
            <!-- <button class="signup-social">
              <i class="fa fa-google signup-social-icon"></i>
              <span class="signup-social-text">Sign up with Google</span>
            </button>
            -->
            <form id="myForm" action="./forget" method="POST" class="login-form" autocomplete="off">
                <!-- <label for="username" class="login-label">Nhập tên đăng nhập và địa chỉ Email (địa chỉ email này phải đúng với địa chỉ email đã đăng kí trong trang cá nhân). Sau đó chúng tôi sẽ gửi mật khẩu mới vào Email của bạn!</label> -->

                <!-- username -->
                <label for="username" class="login-label">Nickname</label>
                <input type="text" name="username" class="login-input" placeholder="VD: HoangPongPayVoCungLuon">

                <!-- Email -->
                <label for="Email" class="login-label">Email</label>
                <input type="email" name="Email" class="login-input" placeholder="VD: KhanhCute@gmail.com">
                <input class="login-submit" type="submit" value="Lấy lại mật khẩu">
            </form>
            <p class="login-already">

                <a href="../login.jsp" class="login-signup-link">Về đăng nhập</a>
            </p>
        </div>
    </body>
        <script>
        // Lấy đối tượng giao diện loading và form
        const loading = document.getElementById("loading");
        const form = document.getElementById("myForm");

        // Gán sự kiện cho form
        form.addEventListener("submit", function () {
            // Hiển thị giao diện loading
            loading.style.display = "block";
        });


