<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="model.Customer" %>
<%@ page import="main.MainController" %><%--
  Created by IntelliJ IDEA.
  User: phand
  Date: 03/11/2020
  Time: 09:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!doctype html>
  <html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
  <table class="table table-hover table-responsive-sm">
    <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Date of Birth</th>
      <th scope="col">Address</th>
      <th scope="col">Image</th>
    </tr>
    </thead>
    <tbody>
      <%
        int index=0;
      List<Customer> listCustomer = MainController.readFile();
      request.setAttribute("listCustomer",listCustomer);
      %>
<c:forEach var="customer" items="${listCustomer}">
  <%
    index++;
  %>
  <tr>
    <td><%=index%></td>
    <td name="name"><c:out value="${customer.name}">a</c:out></td>
    <td name="date"><c:out value="${customer.date}">a</c:out></td>
    <td name="address"><c:out value="${customer.address}">a</c:out></td>
    <td><img style="height:60px;width:50px;" src="<c:out value="${customer.imgUrl}">a</c:out> "alt=""></td>
  </tr>
</c:forEach>

<%--    </c:forEach>--%>

    </tbody>
  </table>
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
