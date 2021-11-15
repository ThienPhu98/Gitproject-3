package ProductManagement.controller;

import ProductManagement.model.Product;
import ProductManagement.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ProductManagementServlet", urlPatterns = "/systems")
public class ProductManagementServlet extends HttpServlet {

    ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addProduct":
                try {
                    doAddNewProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "updateProduct":
                try {
                    doUpdate(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "removeProduct":
                try {
                    doRemove(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addProduct":
                showProductForm(request, response);
                break;
            case "updateProduct":
                showUpdateForm(request, response);
                break;
            case "removeProduct":
                showRemoveConfirm(request, response);
                break;
            case "findProduct":
                showListProductByName(request, response);
                break;
            default:
                showListProduct(request, response);
                break;
        }
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Product> productList = productService.findAllProduct();
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
        request.setAttribute("productList", productList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/addNew.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void doAddNewProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int Quantity = Integer.parseInt(request.getParameter("Quantity"));
        String productColor = request.getParameter("productColor");
        String productDescription = request.getParameter("productDescription");
        String productCategory = request.getParameter("productCategory");
        ArrayList<Product> productList = productService.findAllProduct();

        boolean isproductIdValid = true;
        String productId = "0";
         do {
            int randomNumber = (int) (Math.random() * 9999) + 1000;
            productId = String.valueOf(randomNumber);
            for (Product product: productList) {
                if (product.getProductId().equals(productId)) {
                    isproductIdValid = false;
                    break;
                }
            }
        } while (!isproductIdValid);

        Product product = new Product(productId, productName, productPrice, Quantity, productColor, productDescription, productCategory);
        if (productService.addNewProduct(product)) {
            request.setAttribute("message", "success");
        } else {
            request.setAttribute("message", "false");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/addNew.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("id");
        Product product = productService.findProductById(productId);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int Quantity = Integer.parseInt(request.getParameter("Quantity"));
        String productColor = request.getParameter("productColor");
        String productDescription = request.getParameter("productDescription");
        String productCategory = request.getParameter("productCategory");
        Product product = new Product(productId, productName, productPrice, Quantity, productColor, productDescription, productCategory);

        RequestDispatcher dispatcher;
        if (productService.updateProduct(productId, product)) {
            ArrayList<Product> productList = productService.findAllProduct();
            request.setAttribute("message", "update");
            request.setAttribute("productList", productList);
            dispatcher = request.getRequestDispatcher("product/productList.jsp");
        } else {
            request.setAttribute("message", "false");
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showRemoveConfirm (HttpServletRequest request, HttpServletResponse response) {
        String productId = request.getParameter("id");
        Product product = productService.findProductById(productId);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/remove.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void doRemove(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String productId = request.getParameter("productId");
        RequestDispatcher dispatcher;
        if (productService.removeProduct(productId)) {
            ArrayList<Product> productList = productService.findAllProduct();
            request.setAttribute("productList", productList);
            request.setAttribute("message", "remove");
            dispatcher = request.getRequestDispatcher("product/productList.jsp");
        } else {
            ArrayList<Product> productList = productService.findAllProduct();
            request.setAttribute("productList", productList);
            request.setAttribute("message", "remove-fail");
            dispatcher = request.getRequestDispatcher("product/productList.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListProductByName(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("searchProductName");
        ArrayList<Product> productList = productService.findAllProductByName(productName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productListByName.jsp");
        request.setAttribute("productList", productList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
