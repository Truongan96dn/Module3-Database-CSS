<%--
  Created by IntelliJ IDEA.
  User: hotruongan
  Date: 04/05/2023
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <h1>User Management</h1>
    <h2>
        <button type="button" onclick="window.location.href='/UserServlet?action=create'" class="btn btn-primary">ADD NEW USER</button>
    </h2>
<form action="">
    <label>
        <button type="submit" class="btn btn-primary" onclick="window.location.href = '/UserServlet?action=search'">Search</button>
        <input type="text" name="name" class="form-control">
    </label>
</form>
<div align="center">
    <table class="table table-striped">
        <h2>List of Users</h2>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <a href="/UserServlet?action=edit&id=${user.id}">Edit</a>
                    <a href="/UserServlet?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
