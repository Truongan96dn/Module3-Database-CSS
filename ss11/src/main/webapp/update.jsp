<%--
  Created by IntelliJ IDEA.
  User: hotruongan
  Date: 28/04/2023
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upate</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<h1 style="padding: 15px">Update Product</h1>
<form method="post" style="width: 25vw;padding: 15px">
<label>Name</label>
<input class="form-control"  name="name"><br>
<label>Price</label>
<input class="form-control"  type="number" name="price"><br>
<label>Description</label>
<input class="form-control" name="description"><br>
<label>Producer</label>
<input class="form-control"  name="producer"><br>
<button class="btn btn-success" type="submit">Update</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>
