<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Users page</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h1>Users List</h1>

<div class="row">
    <div class="col-xs-9">

        <c:if test="${!empty listUsers}">
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Admin</th>
                    <th>Created date</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a></td>
                        <td>${user.age}</td>
                        <td>${user.admin}</td>
                        <td>${user.createdDate}</td>
                        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                        <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a> </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <div align="center">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="<c:url value="/users"/>" aria-label="Back">
                        <%--<a href="<c:url value="/users">" aria-label="Back">--%>
                            <span aria-hidden="true">&laquo;&laquo;</span>
                        </a>
                    </li>
                    <c:if test="${page > 1}">
                        <li>
                            <a href="<c:url value="/users"><c:param name="page" value="${page - 1}"/>${page - 1}</c:url>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <li>
                        <c:if test="${empty listUsers}">
                            <a href="<c:url value="/users"><c:param name="page" value="${page-1}"/></c:url>"><spring:message text="${page - 1}"/></a>
                        </c:if>
                    </li>
                    <li class="active">
                        <a href="<c:url value="/users"><c:param name="page" value="${page}"/></c:url>"><spring:message text="${page}"/>
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li>
                        <c:if test="${!empty listUsers}">
                            <a href="<c:url value="/users"><c:param name="page" value="${page+1}"/></c:url>"><spring:message text="${page + 1}"/></a>
                        </c:if>
                    </li>

                    <li>
                        <c:if test="${!empty listUsers}">
                        <a href="<c:url value="/users"><c:param name="page" value="${page + 1}"/>${page + 1}</c:url>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                        </c:if>
                    </li>
                </ul>
            </nav>
        </div>


        <br/>
        <br/>
        <c:url var="searchuser" value="/searchresults"/>
        <form:form action="${searchuser}" commandName="searcheduser">
            <table width="30%">
                <tr>
                    <td><input class="btn btn-primary" type="submit" name="action" value="<spring:message text="Search"/>"/></td>
                    <td><form:input path="name" class="form-control" placeholder="User name"/></td>

                </tr>
            </table>
        </form:form>


        <br/>
        <br/>


        <form>
            <a class="btn btn-primary btn-lg" href="/adduser" role="button">Add User</a>
        </form>



    </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>