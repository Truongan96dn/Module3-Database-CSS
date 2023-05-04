<%--
  Created by IntelliJ IDEA.
  User: hotruongan
  Date: 27/04/2023
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table border="1px">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
    <tr>
        <td>${customer.getName()}</td>
        <td>${customer.getDayOfBirth()}</td>
        <td>${customer.getAddress()}</td>
        <td>
            <img src="${customer.getImage()}" style="width: 100px">
        </td>
    </tr>
    </c:forEach>
</table>

</body>
</html>
