<%--
  Created by IntelliJ IDEA.
  User: phand
  Date: 03/11/2020
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: phand
  Date: 02/11/2020
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="Description" content="Enter your description here"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css">
  <link rel="stylesheet" href="style.css">
  <title> Simple Calculator</title>
</head>
<body>
<form method="post" action="/calculate" autocomplete="off">
  <div class="container">
    <div class="row">
      <div class="col-3">
      </div>
      <div class="col-6 form-group">
        <div id="name-form">
          Simple Calculator
        </div>
        <div class="input-group mb-3">
          <input type="text" name="first_num" class="form-control" placeholder="First Number">
        </div>
        <div class="input-group mb-3">
          <select class="custom-select" name="operator"id="inputGroupSelect01">
            <option selected>Choose Operator</option>
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">x</option>
            <option value="/">/</option>
          </select>
        </div>
        <div class="input-group mb-3">
          <input type="text" name="second_num" class="form-control" placeholder="Second number">
        </div>
        <button type="submit" class="btn btn-outline-primary">Calculate</button>
      </div>

    </div>
  </div>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

