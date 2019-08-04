<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Student: Your leased books</title>
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

            td, th {
                padding: 5px;
            }
        </style>
    </head>

    <body>
        <div id="main-content">
            <div id="header">
                <h1 style="color: rgb(70, 218, 70); padding-left: 20px; display: inline-block;">Student: <h3
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;your leased books</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>

            <div id="divider">
                <div style="width: 100%;">
                    <h4 style="/*! padding: 0px; */margin-bottom: 10px;margin-top: 0px;">View books you leased</h4>

                    <!-- START: Paging Bean -->
                    <jsp:useBean id="p" class="paging.RenewPaging" scope="request" />
                    <jsp:setProperty property="search" name="p" value="${account.id}"/>
                    <c:if test="${not empty param.page}">
                        <jsp:setProperty property="page" name="p" value="${param.page}"/> 
                    </c:if>

                    <p>
                    <table border="1" cellspacing ="0" style="font-size: 11px; width: 100%;">
                        <tr>
                            <th>ISBN</th>
                            <th>Title</th>
                            <th>Publisher</th>
                            <th>Return Date</th>

                        </tr>
                        <c:forEach var="x" items="${p.books}">
                            <tr>
                                <td>${x.isbn}</td>
                                <td>${x.title}</td>
                                <td>${x.publisher}</td>
                                <td>${x.returnDate}</td>                                
                            </tr>
                        </c:forEach>
                    </table>
                    <c:if test="${not empty title}">
                        The book <span style="color: red; font-style: italic">${title}</span> has been renewed.
                    </c:if>


                    <p>Page: 
                        <c:forEach begin="1" end="${p.numPage}" varStatus="status">
                            <c:if test="${status.last == true}">
                                <span>
                                    <a href="/LibraryMS/student/student_leased_book.jsp?page=${status.index}&AMP;search=${account.id}">${status.index}</a>
                                </span>
                            </c:if>
                            <c:if test="${status.last != true}">
                                <span>
                                    <a href="/LibraryMS/student/student_leased_book.jsp?page=${status.index}&AMP;search=${account.id}">${status.index}</a>,      
                                </span>
                            </c:if>

                        </c:forEach>

                    </p>

                    <!-- END: Paging Bean -->  
                </div>

            </div>
            <div style="position: absolute;bottom: 0px;right: 20px;">
                <p>© 2019 FPT University.</p>
            </div>
            <div style="position: absolute;bottom: 0px;left: 20px; margin-bottom: 18px;">
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/student/student_homepage.jsp">Homepage</a>
                <a class="link-bottom-left" href="http://localhost:8080/LibraryMS/ProfileServlet">View your profile</a>
            </div>
        </div>

    </body>

</html>