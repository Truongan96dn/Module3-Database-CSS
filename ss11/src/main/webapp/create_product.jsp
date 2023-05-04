<%--
  Created by IntelliJ IDEA.
  User: hotruongan
  Date: 28/04/2023
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create-product</title>
    <style>
        div {
            background: lightgray;
            border-radius: 5px;
            justify-content: center;
            width: 50%;
        }

    </style>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<body>
<h1 style="padding-left: 10px">ADD NEW PRODUCT</h1><br>
<div >
    <form action="/product?action=create" method="post" style="padding-left: 10px ">
        <label>ID</label>
        <input class="form-control" name="id" placeholder="Example: 1"><br>
        <label>Product Name</label>
        <input class="form-control" name="productName" placeholder="Example: IphoneX"><br>
        <label>Price</label>
        <input class="form-control" name="price"placeholder="Example: 400"><br>
        <label>Product Description</label>
        <input class="form-control" name="description"placeholder="Example: Blue"><br>
        <label>Producer Name</label>
        <input class="form-control" name="producer"placeholder="Example: Apple"><br>
        <button class="btn btn-dark" type="submit">Create</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
