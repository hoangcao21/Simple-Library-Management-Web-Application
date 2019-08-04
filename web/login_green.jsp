<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Library Management System</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="/LibraryMS/library.png" type="image/png" sizes="16x16">
        <style>
            #header-text {
                color: white;
            }

            #header {
                text-align: center;
                color: white;
                text-shadow: 0px 0px 8px rgba(149, 255, 74, 1);
                -webkit-user-select: none;  /* Chrome all / Safari all */
                -moz-user-select: none;     /* Firefox all */
                -ms-user-select: none;      /* IE 10+ */
                user-select: none;  
            }

            .flex-container {
                display: flex;

            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0px;
                background-repeat: no-repeat;
                background: #11998e;
                /* fallback for old browsers */
                background: -webkit-linear-gradient(to right, #38ef7d, #11998e);
                /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to right, #38ef7d, #11998e);
                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            }

            .main-content {
                border: 4px solid black;
                background-color: white;
                padding-top: 60px;
                border-radius: 20px;
                padding-bottom: 60px;
                padding-left: 150px;
                padding-right: 150px;
            }
        </style>
    </head>

    <body>
        <div class="flex-container" style="flex-direction: column;">
            <div id="header">
                <h1 id="header-text">FPT Library Management System</h1>
            </div>
            <div class="flex-container" style="flex-direction: row; margin-top: 2%;">

                <div style="margin: auto;">
                    <form class="main-content" style="float:right;" action="/LibraryMS/LoginServlet">
                        <h3><span style="color:darkorange;">User</span> login:</h3>
                        <label>Your ID:&nbsp;&nbsp;&nbsp;</label>
                        <input type="text" name="account_id" value="${param.account_id}">
                        <br>
                        <br>
                        <label>Password:</label>
                        <input type="password" name="password">
                        <br>
                        <br>
                        <input type="submit" value="Submit">
                        <br>
                        <br>
                        <br>
                        <h5 style="color:red;margin:0px;">${error}</h5>
                        <br>
                        <br>
                        <br>
                        <p style="text-align: center">&COPY; 2019 FPT University.</p>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>