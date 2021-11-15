<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking</title>
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
                                    <span class= "active_point">MainMenu</span>
                                </li>
                                <li class="breadcrumb-item active">
                                    <span>AddNewProduct</span>
                                </li>
                            </ol>
                        </div>
                        <h4 class="page-title">Add New Product</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="row g-3" method="post">
                                <div class="col-md-6">
                                    <label for="validationDefault01" class="form-label">Product name</label>
                                    <input type="text" class="form-control" id="validationDefault01" placeholder="iphone12" name="productName" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="validationDefault02" class="form-label">Price</label>
                                    <input type="number" class="form-control" id="validationDefault02" placeholder="9999" name="productPrice" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="validationDefault03" class="form-label">Quantity</label>
                                    <input type="number" class="form-control" id="validationDefault03" placeholder="12" name="Quantity" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="validationDefault04" class="form-label">Color</label>
                                    <input type="text" class="form-control" id="validationDefault04" placeholder="red" name="productColor" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="validationDefault05" class="form-label">Description</label>
                                    <input type="text" class="form-control" id="validationDefault05" placeholder="2 hours full charge" name="productDescription" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="validationDefault06" class="form-label">Category</label>
                                    <input type="text" class="form-control" id="validationDefault06" placeholder="apple" name="productCategory" required>
                                </div>
                                <div class="col-2">
                                    <button class="btn btn-primary" type="submit">Add New</button>
                                </div>

                                <div class="col-2">
                                    <button class="btn btn-secondary" type="button" onclick='window.location.href="/systems"'>Back</button>
                                </div>

                                <div class="col-8">
                                    <c:if test='${requestScope["message"] == "false"}'>
                                        <div class="alert alert-danger" role="alert" style="margin-left: 20px">
                                            <span>Add new Product Fail! please follow Instructor!</span>
                                        </div>
                                    </c:if>
                                    <c:if test='${requestScope["message"] == "success"}'>
                                        <div class="alert alert-success" role="alert" style="margin-left: 20px">
                                            <span>Add new Product Success!!!</span>
                                        </div>
                                    </c:if>
                                </div>

                            </form>
                        </div>
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

