<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking List</title>
    <%@include file ="/layout/headAndLink.jsp" %>
    <style>
        .active_point:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>

<div id="wrapper">
    <%@include file ="/layout/navbar.jsp" %>

    <div class="content-page">
        <div class="content">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item" onclick='window.location.href="/systems"'>
                                    <span class= "active_point">Product List</span>
                                </li>
                            </ol>
                        </div>
                        <h4 class="page-title">Product List</h4>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder="Product's username" aria-label="Recipient's username" name = "searchProductName" aria-describedby="button-addon2" style="margin-left: 50px" height="100%">
                                        <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick='window.location.href="/systems?action=findProduct"'>Find</button>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <button id="transfer-info-btn" class="btn btn-lg btn-primary" onclick='window.location.href="/systems?action=addProduct"'>
                                        <span>ADD NEW PRODUCT</span>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">
                            <table class="table table-hover table-centered mb-0">
                                <thead>
                                <tr class="table-primary">
                                    <th scope="col">#</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Color</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Category</th>
                                    <th colspan="2" style="text-align: center">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${requestScope["productList"]}' var="product">
                                    <tr>
                                        <td>${product.getProductId()}</td>
                                        <td>${product.getProductName()}</td>
                                        <td>${product.getProductPrice()}</td>
                                        <td>${product.getProductQuantity()}</td>
                                        <td>${product.getProductColor()}</td>
                                        <td>${product.getProductDescription()}</td>
                                        <td>${product.getProductCategory()}</td>
                                        <td style="text-align: center">
                                            <button type="button" class="btn btn-warning" onclick='window.location.href="/systems?action=updateProduct&id=${product.getProductId()}"'>
                                                Update
                                            </button>
                                        </td>
                                        <td style="text-align: center">
                                            <button type="button" class="btn btn-danger" onclick='window.location.href="/systems?action=removeProduct&id=${product.getProductId()}"'>
                                                Remove
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <c:if test='${requestScope["message"] == "update"}'>
                            <div class="alert alert-success" role="alert" style="margin-left: 20px">
                                <span>Update Success!!!</span>
                            </div>
                        </c:if>
                        <c:if test='${requestScope["message"] == "remove"}'>
                            <div class="alert alert-success" role="alert" style="margin-left: 20px">
                                <span>Remove Success!!!</span>
                            </div>
                        </c:if>
                        <c:if test='${requestScope["message"] == "remove-fail"}'>
                            <div class="alert alert-success" role="alert" style="margin-left: 20px">
                                <span>Remove Fail!!!</span>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <%@include file ="/layout/footer.jsp" %>
        </div>
    </div>
</div>

<%@include file ="/layout/script.jsp" %>
</body>
</html>
