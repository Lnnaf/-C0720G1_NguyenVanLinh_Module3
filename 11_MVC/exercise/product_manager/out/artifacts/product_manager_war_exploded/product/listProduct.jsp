<%--
  Created by IntelliJ IDEA.
  User: phand
  Date: 04/11/2020
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>List</title>
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
                        <a class="nav-link active" href="/products?action=show">
                            Dashboard <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/products?action=create">
                            Add Product
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
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Product Code</th>
                    <th scope="col">MFG Date</th>
                    <th scope="col">Origin Country</th>
                    <th scope="col">Company</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items='${requestScope["productsList"]}' var="product">
                    <th scope="row">${product.getId()}</th>
                    <td>${product.getName()}</td>
                    <td>${product.getCode()}</td>
                    <td>${product.getDate()}</td>
                    <td>${product.getOrigin()}</td>
                    <td>${product.getCompany()}</td>
                    <td><a href="/products?action=edit&id=${product.getId()}">Edit</a></td>
                    <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
                    <td><a href="/products?action=detail&id=${product.getId()}">Detail</a></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
