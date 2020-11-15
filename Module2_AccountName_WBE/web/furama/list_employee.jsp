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
    <title>List Employee</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../furama/style.css">
    <script src="sweetalert2.all.min.js"></script>
    <!-- Optional: include a polyfill for ES6 Promises for IE11 -->
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
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
                        <a class="nav-link active" href="/employee?action=">
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
                    <th> ID</th>
                    <th> Name</th>
                    <th> BirthDay</th>
                    <th> ID Card</th>
                    <th> Salary</th>
                    <th> Phone</th>
                    <th> Email</th>
                    <th> Address</th>
                    <th> Position</th>
                    <th> Education</th>
                    <th> Division</th>
                    <th>User Name</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items='${listEmployee}' var="employee">
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.birthday}</td>
                    <td>${employee.idCard}</td>
                    <td>${employee.salary}&nbsp;$</td>
                    <td>${employee.phone}</td>
                    <td>${employee.email}</td>
                    <td>${employee.address}</td>
                    <td>${employee.position}</td>
                    <td>${employee.education}</td>
                    <td>${employee.address} </td>
                    <td>${employee.username}</td>
                    <td>
                        <a href="" data-toggle="modal" data-target="#modalEdit"
                           onclick="onUpdate('${employee.id}','${employee.name}','${employee.birthday}',
                               ${employee.idCard},'${employee.salary}','${employee.phone}','${employee.email}','${employee.address}','${employee.position}',
                                   '${employee.education}','${employee.address}','${employee.username}')"><i
                                class="far fa-edit"></i>&nbsp;Edit</a>
                    </td>
                            <%--               modal update            --%>
                    <div class="modal fade" id="modalEdit" data-backdrop="static" data-keyboard="false" tabindex="-1"
                         aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdroLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form method="post" action="employee?action=update">
                                        <div class="form-group">
                                            <label for="IDUpd">ID</label>
                                            <input hidden type="text" name="id" id="IDUpd" class="form-control" placeholder=""
                                                   aria-describedby="helpId">
                                            <input type="text" disabled id="IDUpd2" class="form-control" placeholder=""
                                                   aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="IDUpd">Name</label>
                                            <input type="text" name="name" id="nameUpd" class="form-control" placeholder=""
                                                   aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="birthdayUpd">BirthDay</label>
                                            <input type="date" name="birthday" id="birthdayUpd" class="form-control"
                                                   placeholder="" aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="idCardUpd">ID Card</label>
                                            <input type="number" name="idCard" id="idCardUpd" class="form-control"
                                                   placeholder="" aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="salaryUpd">Salary</label>
                                            <input type="text" name="salary" id="salaryUpd" class="form-control"
                                                   placeholder="" aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="phoneUpd">Phone</label>
                                            <input type="text" name="phone" id="phoneUpd" class="form-control" placeholder=""
                                                   aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="emailUpd">Email</label>
                                            <input type="text" name="email" id="emailUpd" class="form-control" placeholder=""
                                                   aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="addressUpd">Address</label>
                                            <input type="text" name="address" id="addressUpd" class="form-control"
                                                   placeholder="" aria-describedby="helpId">
                                        </div>
                                        <div class="form-group">
                                            <label for="positionUpd">Position</label>
                                            <select class="form-control" id="positionUpd" name="position">
                                                <c:forEach items='${position}' var="position">
                                                    <option value="${position.id}">${position.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="educationUpd">Education</label>
                                            <select class="form-control" id="educationUpd" name="education">
                                                <c:forEach items='${education}' var="education">
                                                    <option value="${education.id}">${education.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="divisionUpd">Divison</label>
                                            <select class="form-control" id="divisionUpd" name="division">
                                                <c:forEach items='${division}' var="division">
                                                    <option value="${division.id}">${division.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="userUpd">UserName</label>
                                            <input type="text" name="username" id="userUpd" class="form-control"
                                                   hidden placeholder="" aria-describedby="helpId">
                                        </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="" type="submit" class="btn btn-primary">Edit</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <td>
                        <a href="" data-toggle="modal" data-target="#confirm" onclick="confirm_delete('${employee.id}')"><i class="far fa-trash-alt" ></i>&nbsp;Delete</a>
                    </td>
                    <td>
                        <a href="/employee?action=detail&id=${employee.id}"><i class="fas fa-info"></i>&nbsp;Detail</a>
                    </td>
                    </div>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--         Modal         Confirm -->
<div class="modal fade" id="confirm" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm Action</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="false">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/employee?action=delete">
                        <input name="id" id="id_delete" type="text">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        <a href=""><button type="submit" class="btn btn-primary" >Yes</button></a>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>
<!--         Modal         alert -->
<div class="modal fade" id="success" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Succes
            </div>
            <div class="modal-footer">
                <a href="employee?action="><button type="button" class="btn btn-primary" >Close</button></a>
            </div>
        </div>
    </div>
</div>

<!--         Modal         alert -->
<div class="modal fade" id="failed" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Failed
            </div>
            <div class="modal-footer">
                <a href="employee?action="><button type="button" class="btn btn-primary" >Close</button></a>
            </div>
        </div>
    </div>
</div>

<%--              MODAL CREATE             --%>
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
                <form action="/employee?action=create" method="post"id="form_create">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder=""
                               aria-describedby="helpId">
                    </div>
                    <div class="form-group">
                        <label for="birthday">BirthDay</label>
                        <input type="date" name="birthday" id="birthday" class="form-control"
                               placeholder="" aria-describedby="helpId">
                    </div>
                    <div class="form-group">
                        <label for="idCard">ID Card</label>
                        <input type="number" name="idCard" id="idCard" class="form-control"
                               placeholder="" aria-describedby="helpId">
                    </div>
                    <div class="form-group">
                        <label for="salary">Salary</label>
                        <input type="text" name="salary" id="salary" class="form-control"
                               placeholder="" aria-describedby="helpId">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" name="phone" id="phone" class="form-control" placeholder=""
                               aria-describedby="helpId">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email" class="form-control" placeholder=""
                               aria-describedby="helpId">
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" name="address" id="address" class="form-control"
                               placeholder="" aria-describedby="helpId">
                    </div>
                    <div class="form-group">
                        <label for="position">Position</label>
                        <select class="form-control" id="position" name="position">
                            <c:forEach items='${position}' var="position">
                                <option value="${position.id}">${position.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="education">Education</label>
                        <select class="form-control" id="education" name="education">
                            <c:forEach items='${education}' var="education">
                                <option value="${education.id}">${education.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="division">Divison</label>
                        <select class="form-control" id="division" name="division">
                            <c:forEach items='${division}' var="division">
                                <option value="${division.id}">${division.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="submit_create">Create</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        let check = '${check}';
        switch (check) {
            case "true":
                $(window).on('load', function () {
                    $('#success').modal('show');
                });
                break;
                case "false":
                    $(window).on('load', function () {
                        $('#failed').modal('show');
                    });
                    break;
                    case "back":
                        break;

        }
        function confirm_delete(id) {
            document.getElementById("id_delete").value=id;
        }
        function onUpdate(id, name, birthday, idCard, salary, phone, email, address, position, education, division, username) {
            document.getElementById("IDUpd").value = id;
            document.getElementById("IDUpd2").value = id;
            document.getElementById("nameUpd").value = name;
            document.getElementById("birthdayUpd").value = birthday;
            document.getElementById("idCardUpd").value = idCard;
            document.getElementById("salaryUpd").value = salary;
            document.getElementById("phoneUpd").value = phone;
            document.getElementById("emailUpd").value = email;
            document.getElementById("addressUpd").value = address;
            document.getElementById("userUpd").value = username;
            switch (position) {
                case "Lễ Tân":
                    document.getElementById("positionUpd").value = 1;
                    break;
                case "Phục Vụ":
                    document.getElementById("positionUpd").value = 2;
                    break;
                case "Chuyên Viên":
                    document.getElementById("positionUpd").value = 3;
                    break;
                case "Giám Sát":
                    document.getElementById("positionUpd").value = 4;
                    break;
                case "Quản Lý":
                    document.getElementById("positionUpd").value = 5;
                    break;
                case "Giám Đốc":
                    document.getElementById("positionUpd").value = 6;
                    break;
            }
            switch (education) {
                case "Trung Cấp":
                    document.getElementById("educationUpd").value = 1;
                    break;
                case "Cao Đẳng":
                    document.getElementById("educationUpd").value = 2;
                    break;
                case "Đại Học":
                    document.getElementById("educationUpd").value = 3;
                    break;
                case "Sau Đại Học":
                    document.getElementById("educationUpd").value = 4;
                    break;
            }
            switch (education) {
                case "Sale Marketing":
                    document.getElementById("divisionUpd").value = 1;
                    break;
                case "Hành Chính":
                    document.getElementById("divisionUpd").value = 2;
                    break;
                case"Phục Vụ":
                    document.getElementById("divisionUpd").value = 3;
                    break;
                case"Quản Lý":
                    document.getElementById("divisionUpd").value = 4;
                    break;
            }
            document.getElementById("userUpd").value = username;
        }
    </script>

    <!-- Button trigger modal -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.0/dist/sweetalert2.all.min.js"></script>
    <script src="https://kit.fontawesome.com/9a2483646c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
            integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
            crossorigin="anonymous"></script>
</div>
</body>
</html>