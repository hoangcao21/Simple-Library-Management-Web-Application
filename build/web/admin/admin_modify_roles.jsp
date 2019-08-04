<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>

    <head>
        <title>Admin: Modify roles</title>
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
        <!-- Begin JavaBean -->
        <jsp:useBean id="rolePaging" class="paging.RolePaging" scope="request" />

        <c:if test="${not empty param.page}">
            <jsp:setProperty name="rolePaging" property="page" param="page" />
        </c:if>
        <!-- End JavaBean -->

        <div id="main-content">
            <div id="header">
                <h1 style="color: rgb(70, 218, 70); padding-left: 20px; display: inline-block;">Admin: <h3
                        style="color: rgb(70, 218, 70); display: inline-block;">&nbsp;modify roles</h3>
                </h1>
            </div>
            <div id="navbar">
                <p style="display: inline-block;">Welcome, ${account.id}!</p>
                <p style="display: inline-block; float: right; padding-right: 20px;">[<a id="logout" style="text-decoration: none; color: white; font-weight: bold;" href="/LibraryMS/LoginServlet?logout=YES&accountid=${account.id}&role=${account.role}">&nbsp;Logout&nbsp;</a>]</p>
            </div>

            <div id="divider">
                <div style="width: 100%;">
                    <h4 style="/*! padding: 0px; */margin-bottom: 10px;margin-top: 0px;">
                        View the current list of users, select an user to
                        <span style="color: red;">MODIFY</span></h4>

                    <table border="1" cellspacing="0" width="100%">
                        <tr>
                            <th>User ID</th>
                            <th>Password</th>
                            <th>Status</th>
                            <th>Role</th>
                        </tr>
                        <c:forEach var="i" items="${rolePaging.accounts}">
                            <tr>
                                <td>${i.id}</td>
                                <td>${i.password}</td>
                                <td>${i.status}</td>
                                <td>${i.role}</td>
                                <td>
                            <center>
                                <form action="/LibraryMS/ModifyRoleServlet" method="post">
                                    <input type="hidden" name="accountId" value="${i.id}">
                                    <select name="roleName">
                                        <c:forEach var="r" items="${rolePaging.roles}">
                                            <c:if test="${r != i.role}">
                                                <option value="${r}">${r}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <input type="submit" value="Modify role" />
                                </form>
                            </center>
                            </td>
                            </tr>
                        </c:forEach>                        
                    </table>
                    <p>Page: 
                        <c:forEach begin="1" end="${rolePaging.numPage}" varStatus="status">
                            <c:if test="${status.last == true}">
                                <span>
                                    <a href="/LibraryMS/admin/admin_modify_roles.jsp?page=${status.index}">${status.index}</a>
                                </span>
                            </c:if>
                            <c:if test="${status.last != true}">
                                <span>
                                    <a href="/LibraryMS/admin/admin_modify_roles.jsp?page=${status.index}">${status.index}</a>,      
                                </span>
                            </c:if>

                        </c:forEach>

                    </p>
                    <h4 style="color: red;">${successNotify}</h4>
                </div>


            </div>
            <div style="position: absolute;bottom: 0px;right: 20px;">
                <p>© 2019 FPT University.</p>
            </div>
            <div style="position: absolute;bottom: 0px;left: 20px; margin-bottom: 18px;">
                <a class="link-bottom-left" href="/LibraryMS/admin/admin_homepage.jsp">Homepage</a>
            </div>

        </div>
    </body>

</html>