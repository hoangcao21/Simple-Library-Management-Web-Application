<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Staff: Renew books</title>
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
                background-image: url('/LibraryMS/staff/keyboard.png');
                background-size: 14px;
                background-repeat: no-repeat;
                background-position: left;
                padding-left: 2%;
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
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;Renew books</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>

            <div id="divider">
                <div style="width: 100%;">

                    <!-- START: Paging Bean -->
                    <jsp:useBean id="p" class="paging.RenewPaging" scope="request" />
                    <jsp:setProperty property="search" name="p" value="${param.search}"/>
                    <c:if test="${not empty param.page}">
                        <jsp:setProperty property="page" name="p" value="${param.page}"/> 
                    </c:if>
                    <c:if test="${not empty currentStudent}">
                        <jsp:setProperty property="search" name="p" value="${currentStudent}"/>
                    </c:if>

                    <div style="padding-bottom: 2%;">
                        <form action="http://localhost:8080/LibraryMS/staff/staff_renew_books.jsp"  method="post">
                            <input id="search" style="width:80%;" type="text" name="search"
                                   placeholder="Input student's account ID..." value="${param.search}">
                            <input type="hidden" name="page" value="1"/>
                        </form>
                    </div>
                    <h4 style="/*! padding: 0px; */margin-bottom: 10px;margin-top: 0px;">View all books student <span style="color: red;">${p.search}</span> borrowed, select a book
                        to <span style="color: red;">RENEW</span></h4>

                    <c:if test="${empty p.search}">
                        <h1 style="color: gray;">Search for an account to renew books</h1>
                    </c:if>
                    <c:if test="${not empty p.search}">
                        <p>
                            <c:if test="${empty p.books}">
                            <h4>No books to renew</h4>
                        </c:if>

                        <c:if test="${not empty p.books}">

                            <table border="1" cellspacing ="0" style="font-size: 11px; width: 100%;">
                                <tr>
                                    <th>ISBN</th>
                                    <th>Title</th>
                                    <th>Publisher</th>
                                    <th>Return Date</th>
                                    <th>Overdue</th>
                                </tr>
                                <c:forEach var="x" items="${p.books}">
                                    <tr>
                                        <td>${x.isbn}</td>
                                        <td>${x.title}</td>
                                        <td>${x.publisher}</td>
                                        <td>${x.returnDate}</td>
                                        <td>${x.overdue == true? "<span style='color:red;font-weight:bold;'>OVERDUE</span>" : "NO"}</td>
                                        <td><a href="/LibraryMS/RenewBookServlet?isbn=${x.isbn}&AMP;overdue=${x.overdue}&AMP;returnDate=${x.returnDate}&AMP;studentId=${p.search}">RENEW</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <c:if test="${not empty renewedBook}">
                                The book <span style="color: red; font-style: italic">${renewedBook.title}</span> has been renewed.
                            </c:if>


                            <p>Page: 
                                <c:forEach begin="1" end="${p.numPage}" varStatus="status">
                                    <c:if test="${status.last == true}">
                                        <span>
                                            <a href="/LibraryMS/staff/staff_renew_books.jsp?page=${status.index}&AMP;search=${p.search}">${status.index}</a>
                                        </span>
                                    </c:if>
                                    <c:if test="${status.last != true}">
                                        <span>
                                            <a href="/LibraryMS/staff/staff_renew_books.jsp?page=${status.index}&AMP;search=${p.search}">${status.index}</a>,      
                                        </span>
                                    </c:if>

                                </c:forEach>

                            </p>

                        </c:if>
                        <!-- END: Paging Bean -->  
                    </c:if>
                </div>

            </div>
            <div style="position: absolute;bottom: 0px;right: 20px;">
                <p>© 2019 FPT University.</p>
            </div>
            <div style="position: absolute;bottom: 0px;left: 20px; margin-bottom: 18px;">
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/staff/staff_homepage.jsp">Homepage</a>
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/staff/staff_add_book.jsp">Add books</a>
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/staff/staff_remove_book.jsp">Remove books</a>
            </div>
        </div>

    </body>

</html>