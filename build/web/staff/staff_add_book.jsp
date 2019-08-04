<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Staff: Add book</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="/LibraryMS/staff/library.png" type="image/png" sizes="16x16">
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
                flex-direction: column;
                margin: 2%;
                margin: auto;
                margin-top: 5%;
            }

            #aside-content {
                display: flex;
                flex-direction: column;
                border: 2px solid black;
                height: 120%;

            }

            .aside-content-child {
                padding-top: 1%;
                display: flex;
                flex-direction: column;
            }

            h5 {
                padding-right: 5px;
            }

            .separate {
                padding-bottom: 5px;
            }

            .link-bottom-left {
                padding-right: 10px;
            }

            #search {
                background-image: url('search_icon.png');
                background-size: 14px;
                background-repeat: no-repeat;
                background-position: left;
                padding-left: 2%;
            }

            .seperate {
                width: 300px !important;
            }


            #center {
                border: 2px solid;
                padding: 20px;
            }

            td, th {
                padding: 5px;
            }

        </style>
    </head>

    <body>
        <div id="main-content">
            <div id="header">
                <h1 style="color: rgb(70, 218, 70); padding-left: 20px; display: inline-block;">Staff: <h3
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;add book</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>

            <div id="divider">

                <h4 style="margin-bottom: 1%;"><span style="color: red;text-align: center;">&nbsp;ADD</span> a new book</h4>
                <form  method="post" style="padding: 5px;" action="http://localhost:8080/LibraryMS/BookAddServlet">

                    <table id="center" border="0">
                        <tr>
                            <td><h5 style="display: inline;">ISBN</h5></td>
                            <td><input class="seperate" style="width:60%;"
                                       type="text" name="isbn" required="required"></td>
                        </tr>

                        <tr>
                            <td> <h5 style="display: inline;">Title</h5></td>
                            <td><input class="seperate" style="width:60%;"
                                       type="text" name="title" required="required"></td>
                        </tr>

                        <tr>
                            <td> <h5 style="display: inline;">Subject</h5></td>
                            <td><input class="seperate" style="width:60%;"
                                       type="text" name="subject" required="required"></td>
                        </tr>

                        <tr>
                            <td> <h5 style="display: inline;">Publisher</h5></td>
                            <td> <input class="seperate" style="width:60%;"
                                        type="text" name="publisher" required="required"></td>
                        </tr>

                        <tr>
                            <td> <h5 style="display: inline;">Language</h5></td>
                            <td>  <input class="seperate" style="width:60%;"
                                         type="text" name="language" required="required"></td>

                        </tr>
                        <tr>
                            <td>  <h5 style="display: inline;">Number of pages</h5></td>
                            <td>  <input style="width:30%;"
                                         type="number" name="numberOfPages" required="required"></td>
                        </tr>

                        <tr>
                            <td> <input type="submit" value="Add book">
                            <td>  <input type="reset" value="Reset">
                    </table>
                </form>

            </div>
            <div style="position: absolute;bottom: 0px;right: 20px;">
                <p>© 2019 FPT University.</p>
            </div>
            <div style="position: absolute;bottom: 0px;left: 20px; margin-bottom: 18px;">
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/staff/staff_homepage.jsp">Homepage</a>
                <a class="link-bottom-left" href="/LibraryMS/staff/staff_renew_books.jsp">Renew book requests</a>
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/staff/staff_remove_book.jsp">Remove books</a>
            </div>
        </div>

    </body>

</html>