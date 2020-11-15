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
    <title>List Service</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../furama/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script>
        $(document).ready(function () {
            $('#table').DataTable();
        });
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">
                            <i class="fas fa-home"></i> Home<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/service?action=">
                            <i class="fas fa-list"></i>&nbsp; Dashboard<span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#staticBackdrop">
                            <i class="fas fa-plus-circle"></i></i> &nbsp; Add Customer
                        </button>
                    </li>
                    <form method="post" action="/customer?action=find">
                        <input name="name" class="form-control" type="text" placeholder="Enter name user"
                               aria-label="Search">
                        <button type="submit" class="btn btn-primary">Seacrh</button>
                    </form>
                    <form method="post" action="/customer?action=findByCountry">
                        <input name="country" class="form-control" type="text" placeholder="Enter Country"
                               aria-label="Search">
                        <button type="submit" class="btn btn-primary">Seacrh</button>
                    </form>

                </ul>
            </div>
        </div>
        <div class="col-md-10 center">
            <table id="table" class="display">
                <thead>
                <tr>
                    <th>Service ID</th>
                    <th>Service Name</th>
                    <th>Service Area</th>
                    <th>Service Cost</th>
                    <th>Max People</th>
                    <th>Service Type</th>
                    <th>Rent Type</th>
                    <th>Rent Type Cost</th>
                    <th>Standard Room</th>
                    <th>Description</th>
                    <th>Area Pool</th>
                    <th>Floor</th>
                    <th>Status</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items='${listService}' var="service">
                    <td>${service.serviceId}</td>
                    <td>${service.name}</td>
                    <td>${service.serviceArea}&nbsp; m&sup2;</td>
                    <td>${service.serviceCost}&nbsp;$</td>
                    <td>${service.serviceMaxPeople}</td>
                    <td>${service.serviceTypeName}</td>
                    <td>${service.rentTypeName}</td>
                    <td>${service.rentTypeCost}  &nbsp;$</td>
                    <td>${service.standardRoom}</td>
                    <td>${service.description}</td>
                    <td>${service.poolArea}&nbsp; m&sup2;</td>
                    <td>${service.numOfFloor}</td>
                    <td>${service.status}</td>
                    <td>
                        <a href="/customer?action=edit&id=${service.serviceId}"><i
                                class="far fa-edit"></i>&nbsp;Edit</a>
                    </td>
                    <td>
                        <a href="/customer?action=delete&id=${service.serviceId}"><i class="far fa-trash-alt"></i>&nbsp;Delete</a>
                    </td>
                    <td>
                        <a href="/customer?action=detail&id=${service.serviceId}"><i class="fas fa-info"></i>&nbsp;Detail</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Create New Service</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/service?action=create" method="post">
                    <div class="form-group">
                        <label>Name Service</label>
                        <select name="name" class="form-control" required>
                            <option value="">Name Service</option>
                            <option value="Villa">Villa</option>
                            <option value="House">House</option>
                            <option value="Room">Room</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Area">Service Area</label>
                        <input name="service_area" type="number" class="form-control" id="Area">
                    </div>
                    <div class="form-group">
                        <label for="service_cost">Service Cost</label>
                        <input name="service_cost" type="number" class="form-control" id="service_cost">
                    </div>
                    <div class="form-group">
                        <label for="service_max_people">Service Max People</label>
                        <input name="service_max_people" type="number" class="form-control" id="service_max_people">
                    </div>
                    <div class="form-group">
                        <label>Rent Type</label>
                        <select name="rent_type_id" class="form-control" required>
                            <option value="">Service Type</option>
                            <option value="1">Villa</option>
                            <option value="2">House</option>
                            <option value="3">Room</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Rent Type</label>
                        <select name="service_type_id" class="form-control" required>
                            <option value="">Rent Type</option>
                            <option value="1">Hour</option>
                            <option value="2">Day</option>
                            <option value="3">Month</option>
                            <option value="4">Year</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="standard_room">Standard Room</label>
                        <input name="standard_room" type="text" class="form-control" id="standard_room">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input name="description" type="text" class="form-control" id="description">
                    </div>
                    <div class="form-group">
                        <label for="area_pool">Area Pool</label>
                        <input name="area_pool" type="number" class="form-control" id="area_pool">
                    </div>
                    <div class="form-group">
                        <label for="FLoor">Number OF FLoor</label>
                        <input name="number_of_floor" type="number" class="form-control" id="FLoor">
                    </div>
                    <div class="form-check form-check-inline">
                        <label>Status</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input name="status" class="form-check-input" type="radio" id="inlineRadio1" value="Active">
                        <label class="form-check-label" for="inlineRadio1">Active</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input name="status" class="form-check-input" type="radio" id="inlineRadio2" value="Not Active">
                        <label class="form-check-label" for="inlineRadio2">Not Active</label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        let check = '${check}';
        if (check === 'false') {
            $(window).on('load', function () {
                $('#staticBackdrop').modal('show');
            });
        }

    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://kit.fontawesome.com/9a2483646c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
            crossorigin="anonymous"></script>
</body>
</html>