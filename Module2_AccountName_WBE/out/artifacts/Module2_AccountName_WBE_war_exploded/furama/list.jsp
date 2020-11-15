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
    <link rel="stylesheet" href="../furama/style.css">
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
                        <a class="nav-link " href="index.jsp">
                            <i class="fas fa-home"></i>  Home<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/customer?action=show">
                            <i class="fas fa-list"></i>&nbsp;  Dashboard<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#staticBackdrop">
                            <i class="fas fa-plus-circle"></i></i>  &nbsp; Add Customer
                        </button>
                    </li>
                    <form method="post"action="/customer?action=find">
                        <input name="name" class="form-control" type="text" placeholder="Enter name user" aria-label="Search">
                        <button type="submit" class="btn btn-primary">Seacrh</button>
                    </form>
                    <form method="post"action="/customer?action=findByCountry">
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
                    <th>Cusomer ID</th>
                    <th>Name</th>
                    <th>BirthDay</th>
                    <th>Gender</th>
                    <th>ID Card</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Adress</th>
                    <th>Customer Type</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items='${listcustomer}' var="customer">
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.birthday}</td>
                    <td>${customer.gender}</td>
                    <td>${customer.idCard}</td>
                    <td>${customer.phone}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>${customer.customerType}</td>
                    <td>
                        <a href="/customer?action=edit&id=${customer.id}" > <i class="far fa-edit"></i>&nbsp;Edit</a>
                    </td>
                    <td>
                        <a href="/customer?action=delete&id=${customer.id}"><i class="far fa-trash-alt"></i>&nbsp;Delete</a>
                    </td>
                    <td>
                        <a href="/customer?action=detail&id=${customer.id}"><i class="fas fa-info"></i>&nbsp;Detail</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Create New Customer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/customer?action=create" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input name="name" type="input" class="form-control" id="name" required>
                        <span class="validity"></span>
                        <p style="color: red">${errMessageName}</p>
                    </div>
                    <div class="form-group">
                        <label for="Birthday">Birthday</label>
                        <input name="birthday" type="date" class="form-control" id="Birthday">
                    </div>
                    <div class="form-group">
                        <select name="gender" class="form-control" required>
                            <option value="">Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Card">ID Card</label>
                        <input name="idCard" type="text" class="form-control" id="Card">
                        <p style="color: red">${errMessageIdCard}${errMessageIDCardDuplicate}</p>
                    </div>
                    <div class="form-group">
                        <label for="Phone">Phone Number</label>
                        <input name="phone" type="text" class="form-control" id="Phone">
                        <p style="color: red">${errMessagePhone}${errMessagePhoneDuplicate}</p>
                    </div>
                    <div class="form-group">
                        <label for="Email">Email</label>
                        <input name="email" type="text" class="form-control" id="Email">
                        <p style="color: red">${errMessageEmail}</p>
                    </div>
                    <div class="form-group">
                        <label for="Address">Address</label>
                        <input name="address" type="text" class="form-control" id="Address">
                    </div>
                    <div class="form-group">
                        <select name="customer_type" class="form-control" required>
                            <option value="">Customer Type</option>
                            <option value="5">Member</option>
                            <option value="4">Silver</option>
                            <option value="3">Gold</option>
                            <option value="2">Platinum</option>
                            <option value="1">Diamond</option>
                        </select>
                    </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
            </form>
        </div>
    </div>
</div>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#edit">
        Launch
    </button>

    <!-- Modal -->
    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Body
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        let check = '${check}';
        if(check==='false'){
            $(window).on('load',function(){
                $('#staticBackdrop').modal('show');
            });
        }

    </script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://kit.fontawesome.com/9a2483646c.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
</body>
</html>