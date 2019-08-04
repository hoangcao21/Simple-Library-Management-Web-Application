<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Staff: Homepage</title>
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
                flex-direction: row;
                margin: 2%;
                margin-left: 20px;
            }

            #aside-content {
                display: flex;
                flex-direction: column;
                border: 2px solid black;
                margin-top: 4%;
            }

            .aside-content-child {
                padding-top: 10%;
            }

            #search {
                background-image: url('/LibraryMS/staff/search_icon.png');
                background-size: 14px;
                background-repeat: no-repeat;
                background-position: left;
                padding-left: 10%;
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
                <h1 style="color: rgb(70, 218, 70); padding-left: 20px; display: inline-block;">Staff: <h3
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;homepage</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>

            <div id="divider">
                <div style="width: 80%;">
                    <h4 style="/*! padding: 0px; */margin-bottom: 10px;margin-top: 0px;">View current catalog</h4>

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

                    <%--
                    <!-- START: Paging Bean -->
                    --%>                    
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
                    <table border="1" cellspacing ="0" style="font-size: 11px;width: 700px;">
                        <tr>
                            <th>ISBN</th><th>Title</th>
                            <th>Subject</th><th>Publisher</th>
                            <th>Language</th><th>Number of pages</th>
                        </tr>
                        <c:forEach var="x" items="${p.books}">
                            <tr>
                                <td>${x.isbn}</td>
                                <td>${x.title}</td>
                                <td>${x.subject}</td>
                                <td>${x.publisher}</td>
                                <td>${x.language}</td>
                                <td>${x.numberOfPages}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    </p>
                    <c:if test="${not empty isbn}">
                        <p>Book <span style="color: red">${title}</span> (${isbn}) by 
                            <span style="font-style: italic">${publisher}</span> has been added successfully</p>
                        </c:if>

                    <p>Page: 
                        <c:forEach begin="1" end="${p.numPage}" varStatus="status">
                            <c:if test="${status.last == true}">
                                <span>
                                    <a href="/LibraryMS/staff/staff_homepage.jsp?page=${status.index}&AMP;search=${p.search}">${status.index}</a>
                                </span>
                            </c:if>
                            <c:if test="${status.last != true}">
                                <span>
                                    <a href="/LibraryMS/staff/staff_homepage.jsp?page=${status.index}&AMP;search=${p.search}">${status.index}</a>,      
                                </span>
                            </c:if>

                        </c:forEach>

                    </p>

                    <%--

                    <!-- END: Paging Bean -->  --%>


                </div>
                <div id="aside-content" style="width: 20%;height: 180px;">
                    <center>
                        <div class="aside-content-child">
                            <form  method="post" action="http://localhost:8080/LibraryMS/staff/staff_homepage.jsp">
                                <input id="search" style="width:80%;" type="text" name="search"
                                       placeholder="Search a book...">
                                <input type="hidden" name="page" value="1"/>
                            </form>
                        </div>
                        <div class="aside-content-child">
                            <a href="http://localhost:8080/LibraryMS/staff/staff_renew_books.jsp">Renew books for student</a>
                        </div>
                        <div class="aside-content-child">
                            <a href="http://localhost:8080/LibraryMS/staff/staff_remove_book.jsp">Remove books</a>
                        </div>
                        <div class="aside-content-child">
                            <a href="http://localhost:8080/LibraryMS/staff/staff_add_book.jsp">Add books</a>
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