<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 11/1/21
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
  <title>Simple Calculator</title>
</head>
<body>
<h2>Simple Calculator</h2>
<form action="Calculate.jsp" method="post">
  <label>First Operator: </label>
  <input type="number" name="1stOperator" placeholder="First Operator"/>
  <br>
  <select name="subtend" placeholder="subtend">
    <option>Plus</option>
    <option>Minus</option>
    <option>Multiplication</option>
    <option>Addition</option>
  </select>
  <br>
  <label>Second Operator: </label>
  <input type="number" name="2ndOperator" placeholder="First Operator"/>
  <br>
  <input type = "submit" id = "submit" value = "Calculate"/>
</form>
</body>
</html>