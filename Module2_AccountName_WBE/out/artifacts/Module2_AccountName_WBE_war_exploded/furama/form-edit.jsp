<%--
  Created by IntelliJ IDEA.
  User: phand
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
    <title>Form Edit</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../furama/style.css">
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
                        <a class="nav-link" href="index.jsp">
                            <i class="fas fa-home"></i>  Home<span class="sr-only"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="/customer?action=show">
                            <i class="fas fa-list"></i>&nbsp;  Dashboard<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">
                            <i class="far fa-edit"></i> &nbsp; Edit Product
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
            <form method="post" action="/customer?action=edit">
                <div class="form-group">
                    <input name="id" type="hidden" class="form-control"  aria-describedby="emailHelp" value="${customer.getId()}">
                </div>
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" id="id" aria-describedby="emailHelp" value="${customer.getId()}" disabled>
                </div>
                <div class="form-group">
                    <label for="Type">Customer Type</label>
                    <select id="Type" name="customer_type" class="form-control" required>
                        <option value="">Customer Type</option>
                        <option value="5">Member</option>
                        <option value="4">Silver</option>
                        <option value="3">Gold</option>
                        <option value="2">Platinum</option>
                        <option value="1">Diamond</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input name="name" type="input" class="form-control" id="name" required>
                </div>
                <div class="form-group">
                    <label for="Birthday">Birthday</label>
                    <input name="birthday" type="date" class="form-control" id="Birthday">
                </div>
                <div class="form-group">
                    <label for="Birthday">Gender</label>
                    <select name="gender" class="form-control" required>
                        <option value="">Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Card">ID Card</label>
                    <input name="idCard" type="text" class="form-control" id="Card">
                </div>
                <div class="form-group">
                    <label for="Phone">Phone Number</label>
                    <input name="phone" type="text" class="form-control" id="Phone">
                </div>
                <div class="form-group">
                    <label for="Email">Email</label>
                    <input name="email" type="text" class="form-control" id="Email">
                </div>
                <div class="form-group">
                    <label for="Address">Address</label>
                    <input name="address" type="text" class="form-control" id="Address">
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
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