<%-- 
    Document   : verifySuccessful
    Created on : May 24, 2025, 10:19:48 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify Successful</title>
        <style>
            .payment-successful-content{
                text-align: center;
                margin: 10% auto;
                width: 30%;
                height: 200px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .payment-item img{
                width: 15%;
            }

        </style>
    </head>

    <body style="background-color: #f1f1f1;">
        <div class="payment-successful">
            <div class="payment-successful-content">
                <div class="payment-item"><img src="../Assets/icon/icon (74).png" alt=""></div>
                <div class="payment-item" style="font-weight: bolder; font-size: 2rem; padding-top: 10px;">Xác nhận email thành công</div>

                <div class="payment-item" style="padding-top: 40px;"><a href="./changePassword">
                        <button style="height: 2em; width: 10em; font-size: larger; font-weight: bolder; color: #fff; background-color: #32c671;
                                border-radius: 10px; border: white; cursor: pointer" type="button">
                            Đổi mật khẩu
                        </button>
                    </a></div>
            </div>
        </div>
    </body>

</html>

