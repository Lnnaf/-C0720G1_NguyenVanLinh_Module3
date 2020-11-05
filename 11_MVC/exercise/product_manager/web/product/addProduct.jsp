<%--
  Created by IntelliJ IDEA.
  User: phand
  Date: 04/11/2020
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Add Form</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link " href="/products?action=show">
                            <i class="fas fa-list"></i>&nbsp; Dashboard  <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/products?action=create">
                            <i class="fas fa-plus-circle"></i></i>&nbsp;  Add Product
                        </a>
                    </li>
                    <form method="post"action="/products?action=find">
                        <input name="id" class="form-control" type="text" placeholder="Enter ID Product" aria-label="Search">
                        <button type="submit" class="btn btn-primary">Seacrh</button>
                    </form>
                </ul>
            </div>
        </div>
        <div class="col-md-10 center">
            <form action="products?action=create" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">Name</label>
                    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name Product">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Product Code</label>
                    <input name="code" type="text" class="form-control" id="exampleInputPassword1" placeholder="Product Code">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">MFG Date</label>
                    <input name="date" type="text" class="form-control" id="exampleInputPassword1" placeholder="MFG Date">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Origin Country</label>
                    <input name="origin" type="text" class="form-control" id="exampleInputPassword1" placeholder="Origin Country">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Company</label>
                    <input name="company" type="text" class="form-control" id="exampleInputPassword1" placeholder="Company">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://kit.fontawesome.com/9a2483646c.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>

