<%--
  Created by IntelliJ IDEA.
  User: hotruongan
  Date: 28/04/2023
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<body>
<div>
    <div style="text-align: center">
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <h2>Product List</h2>
                <form class="d-flex" action="/product" method="get">
                    <input type="hidden" name="action" value="search"/>
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                           name="productName" value="${productName}">
                    <button class="btn btn-outline-primary" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <button class="btn btn-outline-secondary" onclick="window.location.href='/create_product.jsp'">Add New Product
    </button>
    <table class="table table-striped table-dark">
        <thead>
        <tr>
            <th>#</th>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Producer Name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${product.getId()}</td>
                <td>${product.getProductName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td>${product.getProducer()}</td>
                <th>
                    <button type="button" class="btn btn-outline-warning"
                            onclick="window.location.href='/product?action=update&id=${product.id}'">
                        Update
                    </button>
                </th>
                <th>
                    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                            data-bs-target="#deleteModal${product.id}">
                        Delete
                    </button>
                </th>
                <th>
                    <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop${product.getId()}">
                        Detail
                    </button>
                </th>
            </tr>
            <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">x</button>
                        </div>
                        <div class="modal-body">
                            Do you want to delete ${product.productName}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                            <button type="button"
                                    onclick="window.location.href='/product?action=delete&id=${product.id}'"
                                    class="btn btn-primary">OK
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="staticBackdrop${product.getId()}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Product Detail</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"  aria-label="Close" >x</button>
                        </div>
                        <div class="modal-body">
                            <p>Id :${product.getId()}</p>
                            <p>Product Name :${product.getProductName()}</p>
                            <p>Price :${product.getPrice()}</p>
                            <p>Product Detail :${product.getProducer()}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
