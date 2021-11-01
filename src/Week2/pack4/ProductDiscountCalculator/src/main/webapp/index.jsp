<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 11/1/21
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>ProductDiscountCalculator</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
  <h2>Product Discount Calculator</h2>
  <form action="/count" method="post">
    <input type="text" name="Product Description" placeholder="ProductDescription"><br/>
    <input type="number" name="Price" placeholder="Price" Value = 0><br/>
    <input type="number" name="Percent Discount" placeholder="Discount" Value = 0><br/>
    <input type = "submit" id = "submit" value = "Count"/>
  </form>
  </body>
</html>
