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
  <title> Product Discount Calculator</title>
</head>
<body>
<form method="post" action="/discount_calculation" autocomplete="off">
<div class="container">
  <div class="row">
    <div class="col-3">
    </div>
    <div class="col-6 form-group">
      <div id="name-form">
        Product Discount Calculator
      </div>
      <div class="input-group mb-3">
        <input type="text" name="description" class="form-control" placeholder="Product Description">
      </div>
      <div class="input-group mb-3">
        <input type="text" name="listPrice" class="form-control" placeholder="List Price">
      </div>
      <div class="input-group mb-3">
        <select class="custom-select" name="discount"id="inputGroupSelect01">
          <option selected>Choose Discount Percent</option>
          <option value="10">10%</option>
          <option value="20">20%</option>
          <option value="30">30%</option>
          <option value="40">40%</option>
          <option value="50">50%</option>
          <option value="60">60%</option>
          <option value="70">70%</option>
          <option value="80">80%</option>
          <option value="90">90%</option>
          <option value="100">100%</option>
        </select>
      </div>
      <button type="submit" class="btn btn-outline-primary">Calculate Discount </button>
    </div>

  </div>
</div>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
