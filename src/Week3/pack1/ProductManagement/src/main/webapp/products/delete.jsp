<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 11/2/21
  Time: 4:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Deleting product</title>
</head>
<body>
<h1>Delete product</h1>
<p>
  <a href="/products">Back to product list</a>
</p>
<form method="post">
  <h3>Are you sure?</h3>
  <fieldset>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Name: </td>
        <td>${requestScope["products"].getName()}</td>
      </tr>
      <tr>
        <td>Price: </td>
        <td>${requestScope["products"].getPrice()}</td>
      </tr>
      <tr>
        <td>Description: </td>
        <td>${requestScope["products"].getDecription()}</td>
      </tr>
      <tr>
        <td>Manufacture: </td>
        <td>${requestScope["products"].getManufacture()}</td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete product"></td>
        <td><a href="/products">Back to product list</a></td>
      </tr>
    </table>
  </fieldset>
</body>
</html>
