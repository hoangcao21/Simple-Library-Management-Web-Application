<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Student: Homepage</title>
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
                padding-top: 10px;
            }

            .aside-content-child {
                padding-bottom: 5%;
            }

            #search {
                background-image: url('/LibraryMS/student/search_icon.png');
                background-size: 14px;
                background-repeat: no-repeat;
                background-position: left;
                padding-left: 3%;
            }

            td, th {
                width: 60px;
                padding: 5px;
            }
        </style>
    </head>

    <body>
        <div id="main-content">
            <div id="header">
                <h1 style="color: rgb(70, 218, 70); padding-left: 20px; display: inline-block;">Student: <h3
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;homepage</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>

            <div id="divider">
                <div style="width: 80%;">
                    <div style="padding-bottom: 2%;">
                        <form action="http://localhost:8080/LibraryMS/student/student_homepage.jsp"  method="post">
                            <input id="search" style="width:80%;" type="text" name="search"
                                   placeholder="Search a book...">
                            <input type="hidden" name="page" value="1"/>
                        </form>
                    </div>
                    <h4 style="/*! padding: 0px; */margin-bottom: 10px;margin-top: 0px;">View available book(s), search or
                        reserve book</h4>

                    <!-- 
                    *
                    *
                    *
                    *
                    * UNCOMMENT CHỈ ĐỀ DEMO CHỨC NĂNG ĐĂNG NHẬP CHO CÁC ACCOUNT CÓ CÁC ROLE KHÁC NHAU
                    *
                    *
                    *
                    *
                    -->
                    <!-- START: Paging Bean -->
                    <jsp:useBean id="p" class="paging.BookPaging" scope="request" />
                    <jsp:setProperty property="search" name="p" value="${param.search}"/>
                    <jsp:setProperty property="page" name="p" value="${param.page}"/> 
                    <c:if test="${empty param.search}">
                        <jsp:setProperty property="search" name="p" value=""/>
                    </c:if>
                    <c:if test="${empty param.page}">
                        <jsp:setProperty property="page" name="p" value="1"/>
                    </c:if>


                    <p>
                    <table border="1" cellspacing ="0" style="font-size: 11px; width: 90%;">
                        <tr>
                            <th>ISBN</th><th>Title</th>
                            <th>Subject</th><th>Publisher</th>
                            <th>Language</th><th>Number of pages</th><th></th>
                        </tr>
                        <c:forEach var="x" items="${p.books}">
                            <tr>
                                <td>${x.isbn}</td>
                                <td>${x.title}</td>
                                <td>${x.subject}</td>
                                <td>${x.publisher}</td>
                                <td>${x.language}</td>
                                <td>${x.numberOfPages}</td>
                                <td><a href="http://localhost:8080/LibraryMS/BookReserveServlet?isbn=${x.isbn}">Reserve</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    </p>
                    <c:if test="${not empty bookReserved}">
                        <p>Book <span style="color: red">${bookReserved.title}</span> (${bookReserved.isbn}) by 
                            <span style="font-style: italic">${bookReserved.publisher}</span> has been reserved successfully</p>
                        </c:if>
                    <p>Page: 
                        <c:forEach begin="1" end="${p.numPage}" varStatus="status">
                            <c:if test="${status.last == true}">
                                <span>
                                    <a href="/LibraryMS/student/student_homepage.jsp?page=${status.index}&AMP;search=${p.search}">${status.index}</a>
                                </span>
                            </c:if>
                            <c:if test="${status.last != true}">
                                <span>
                                    <a href="/LibraryMS/student/student_homepage.jsp?page=${status.index}&AMP;search=${p.search}">${status.index}</a>,      
                                </span>
                            </c:if>

                        </c:forEach>

                    </p>


                </div>
                <div id="aside-content" style="width: 20%;">
                    <center style="border: 2px solid black;">
                        <div class="aside-content-child">
                            <a href="http://localhost:8080/LibraryMS/ProfileServlet">View your profile</a>
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
        </div>

    </body>

</html>