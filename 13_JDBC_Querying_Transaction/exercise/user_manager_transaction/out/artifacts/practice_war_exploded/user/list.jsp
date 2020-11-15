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
    <link rel="stylesheet" href="../user/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script>
        $(document).ready( function () {
            $('#table').DataTable();
        } );
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="/user?action=show">
                            <i class="fas fa-list"></i>&nbsp;  Dashboard<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user?action=create">
                            <i class="fas fa-plus-circle"></i></i>&nbsp; Add Product
                        </a>
                    </li>
                    <form method="post"action="/user?action=find">
                        <input name="name" class="form-control" type="text" placeholder="Enter name user" aria-label="Search">
                        <button type="submit" class="btn btn-primary">Seacrh</button>
                    </form>
                    <form method="post"action="/user?action=findByCountry">
                        <input name="country" class="form-control" type="text" placeholder="Enter Country" aria-label="Search">
                        <button type="submit" class="btn btn-primary">Seacrh</button>
                    </form>

                </ul>
            </div>
        </div>
        <div class="col-md-10 center">
            <table id="table" class="display">
                <thead>
                <tr>
                    <th>ID</th>
                    <th><a href="/user?action=sortByName">Name</a></th>
                    <th>Email</th>
                    <th>Country</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items='${requestScope["listUser"]}' var="user">
                    <td>${user.getId()}</td>
                    <td>${user.getName()}</td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getCountry()}</td>
                    <td><a href="/user?action=edit&id=${user.getId()}"><i class="far fa-edit"></i>&nbsp;Edit</a></td>
                    <td><a href="/user?action=delete&id=${user.getId()}"><i class="far fa-trash-alt"></i>&nbsp;Delete</a></td>
                    <td><a href="/user?action=detail&id=${user.getId()}"><i class="fas fa-info"></i>&nbsp;Detail</a></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://kit.fontawesome.com/9a2483646c.js" crossorigin="anonymous"></script>
</body>
</html>