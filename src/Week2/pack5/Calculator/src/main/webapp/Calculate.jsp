<%--
  Created by IntelliJ IDEA.
  User: ubuntu
  Date: 11/1/21
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculate</title>
</head>
<body>
<%
    double firstNumber = Double.parseDouble(request.getParameter("1stOperator"));
    double secondNumber = Double.parseDouble(request.getParameter("2ndOperator"));
    String subtend = String.valueOf(request.getParameter("subtend"));

    String result = "";
    String sign = "";

    if (subtend.equals("Plus")) {
        sign = " + ";
        result = String.valueOf(firstNumber + secondNumber);
    } else if (subtend.equals("Minus")) {
        sign = " - ";
        result = String.valueOf(firstNumber - secondNumber);
    } else if (subtend.equals("Multiplication")) {
        sign = " x ";
        result = String.valueOf(firstNumber * secondNumber);
    } else {
        sign = " : ";
        try {
            result = String.valueOf(firstNumber / secondNumber);
        } catch (Exception e) {
            result = "Calculate fail! can't addition by 0";
        }
    }
%>
<h1>Result: </h1>
<br>
<p><%=firstNumber + sign + secondNumber + " = " + result%></p>
</body>
</html>
