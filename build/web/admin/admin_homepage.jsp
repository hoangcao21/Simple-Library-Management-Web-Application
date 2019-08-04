<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Admin: Homepage</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="/LibraryMS/admin/library.png" type="image/png" sizes="16x16">

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
            }

            td, th {
                padding: 5px;
            }

        </style>
    </head>

    <body>
        <!-- Begin JavaBean -->
        <jsp:useBean id="logPaging" class="paging.LogPaging" scope="request" />

        <c:if test="${not empty param.page1}">
            <jsp:setProperty name="logPaging" property="page" param="page1" />
        </c:if>

        <jsp:useBean id="accountPaging" class="paging.AccountPaging" scope="request" />

        <c:if test="${not empty param.page2}">
            <jsp:setProperty name="accountPaging" property="page" param="page2" />
        </c:if>

        <!-- End JavaBean -->

        <div id="main-content">
            <div id="header">
                <h1 style="color: rgb(70, 218, 70); padding-left: 20px; display: inline-block;">Admin: <h3
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;homepage</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>
            <div id="divider">
                <div style="padding-left: 20px; width:50%;">
                    <h4>View recently report</h4>
                    <table border="1" cellspacing="0">
                        <tr>
                            <th>#</th>
                            <th>User ID</th>
                            <th>Role</th>
                            <th>Operation</th>
                            <th>Date & Time ⇩</th>
                        </tr>
                        <c:forEach var="i" items="${logPaging.logs}">

                            <tr>
                                <td>${i.no}</td>
                                <td>${i.account_id}</td>
                                <td>${i.role}</td>
                                <td>${i.operation}</td>
                                <td>${i.date_and_time}</td>
                            </tr>
                        </c:forEach>                        
                    </table>
                    <p>Page: 
                        <c:forEach begin="1" end="${logPaging.numPage}" varStatus="status">
                            <c:if test="${status.last == true}">
                                <span>
                                    <a href="/LibraryMS/admin/admin_homepage.jsp?page1=${status.index}">${status.index}</a>
                                </span>
                            </c:if>
                            <c:if test="${status.last != true}">
                                <span>
                                    <a href="/LibraryMS/admin/admin_homepage.jsp?page1=${status.index}">${status.index}</a>,      
                                </span>
                            </c:if>

                        </c:forEach>

                    </p>

                </div>
                <div style="padding-left: 20px; width:50%;">
                    <h4>Disable a user's active session</h4>
                    <c:if test="${empty accountPaging.accounts}">
                        <h3 style="color: grey;">No staff or student is active.</h3>
                    </c:if>
                    <c:if test="${not empty accountPaging.accounts}">
                        <table border="1" cellspacing="0">
                            <tr>
                                <th>User ID</th>
                                <th>Password</th>
                                <th>Status</th>
                                <th>Role</th>
                                <th></th>
                            </tr>
                            <c:forEach var="i" items="${accountPaging.accounts}">
                                <tr>
                                    <td>${i.id}</td>
                                    <td>${i.password}</td>
                                    <td>${i.status}</td>
                                    <td>${i.role}</td>
                                    <td>
                                        <form action="/LibraryMS/StatusServlet" method="post">
                                            <input type="hidden" name="id" value="${i.id}" />
                                            <input type="submit" value="Disable" />
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>                        
                        </table>
                        <p>Page: 
                            <c:forEach begin="1" end="${accountPaging.numPage}" varStatus="status">
                                <c:if test="${status.last == true}">
                                    <span>
                                        <a href="/LibraryMS/admin/admin_homepage.jsp?page2=${status.index}">${status.index}</a>
                                    </span>
                                </c:if>
                                <c:if test="${status.last != true}">
                                    <span>
                                        <a href="/LibraryMS/admin/admin_homepage.jsp?page2=${status.index}">${status.index}</a>,      
                                    </span>
                                </c:if>

                            </c:forEach>

                        </p>
                    </c:if>
                </div>
            </div>
            <div style="position: absolute;bottom: 0px;right: 20px;">
                <p>© 2019 FPT University.</p>
            </div>
            <div style="position: absolute;bottom: 0px;left: 20px; margin-bottom: 18px;">
                <a class="link-bottom-left" href="/LibraryMS/admin/admin_modify_roles.jsp" style="padding-right: 10px;">Modify roles</a>
            </div>
        </div>

    </body>

</html>