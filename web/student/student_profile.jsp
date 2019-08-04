<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Student: Profile</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="/LibraryMS/student/library.png" type="image/png" sizes="16x16">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: #11998e;
                /* fallback for old browsers */
                background: -webkit-linear-gradient(to right, #38ef7d, #11998e);
                /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to right, #38ef7d, #11998e);
                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */


            }

            #main-content {
                background-color: white;
                margin: auto;
                width: 964px;
                position: fixed;
                top: 0%;
                bottom: 0%;
                left: 10%;
                right: 10%;
                display: flex;
                flex-direction: column;
            }

            #navbar {
                width: auto;
                height: 50px;
                color: white;
                background-color: rgb(70, 218, 70);
                padding-left: 20px;

            }

            #divider {
                display: flex;
                flex-direction: row;
                margin: 5%;
                margin-left: 20px;
            }

            #aside-content {
                display: flex;
                flex-direction: column;
                border: 2px solid black;
                padding-top: 10px;
            }

            .aside-content-child {
                padding-bottom: 5%;
            }

            #search {
                background-image: url('search_icon.png');
                background-size: 14px;
                background-repeat: no-repeat;
                background-position: left;
                padding-left: 3%;
            }

            .info {
                margin: 5px;
            }

            td, th {
                padding: 5px;
            }
        </style>
    </head>

    <body>
        <div id="main-content">
            <div id="header">
                <h1 style="color: rgb(70, 218, 70); padding-left: 20px; display: inline-block;">Student: <h3
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;profile</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>

            <div id="divider">
                <c:if test="${not empty student}">
                    <div style="width: 25%; display: flex; flex-direction: column;">
                        <div>
                            <h5 class="info">Your full name: </h5>
                            <input type="text" value="${student.name}" disabled>
                        </div>
                        <div>
                            <h5 class="info">Email: </h5>
                            <input type="text" value="${student.email}" disabled>
                        </div>
                        <div>
                            <h5 class="info">Phone: </h5>
                            <input type="text" value="${student.phone}" disabled>
                        </div>
                        <div>
                            <h5 class="info">Username: </h5>
                            <input type="text" value="${student.account_id}" disabled>
                        </div>


                    </div>
                </c:if>
                <div>
                    <h3 style="margin: 0px;">If your information is not correct, please contact our administrators at:</h3>
                    <br>
                    <h3 style="margin: 0px; color: red;">(+84)&nbsp;1900-8010 <span style="color: black;">or</span>
                        fptlib@fpt.edu.vn</h3>
                </div>
                <div id="aside-content" style="width: 25%;">
                    <center>
                        <div class="aside-content-child">
                            <a href="http://localhost:8080/LibraryMS/student/student_homepage.jsp">Homepage</a>
                        </div>
                        <div class="aside-content-child">
                            <a href="http://localhost:8080/LibraryMS/student/student_leased_book.jsp">See book(s) you leased</a>
                        </div>
                        <div class="aside-content-child">
                            <h6 style="display: inline; color: orange;">Today's recommendation</h6>
                            <img width="60%" src="/LibraryMS/student/highschoolad.jpg">
                        </div>
                    </center>
                </div>
            </div>
            <div style="position: absolute;bottom: 0px;right: 20px;">
                <p>© 2019 FPT University.</p>
            </div>
            <div style="position: absolute;bottom: 0px;left: 20px; margin-bottom: 18px;">
                <a style="padding-right: 10px;" class="link-bottom-left" href="http://localhost:8080/LibraryMS/student/student_homepage.jsp">Homepage</a>
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/student/student_leased_book.jsp">View book(s) you leased</a>
            </div>
        </div>

    </body>

</html>