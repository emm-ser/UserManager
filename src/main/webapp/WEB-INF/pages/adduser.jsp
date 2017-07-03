<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Add User</title>

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
<a href="<c:url value="/users"/>">Back to users list</a>
<br>
<br>
<h2>Add User</h2>



<div class="row">
    <div class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-0">

        <c:url var="addAction" value="/users/add"/>
        <form:form action="${addAction}" commandName="user" class="form-horizontal">

            <table class="table table-striped">
                <tr>
                    <td>
                        <form:label path="name" for="userName" class="col-sm-2 control-label">
                            <spring:message text="Username"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="name" class="form-control" id="userName" placeholder="User Name"/>

                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="age" class="col-sm-2 control-label">
                            <spring:message text="Age"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="age" class="form-control"/>
                    </td>
                </tr>

                <tr>
                    <td><form:label path="admin" class="col-sm-2 control-label"><spring:message text="Admin"/></form:label></td>
                    <td>
                        <form:checkbox path="admin" value="false"/>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center">
                        <input type="submit" class="btn btn-primary"
                               value="<spring:message text="Add User"/>"/>
                    </td>
                </tr>
            </table>



        </form:form>
    </div>
</div>




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>