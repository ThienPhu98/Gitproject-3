package ProductManagement.service;

import ProductManagement.model.Product;

import java.sql.*;
import java.util.ArrayList;

public class ProductService implements IProductService {
    public static String jdbcURL = "jdbc:mysql://localhost:3306/ProductManagement?useSSL=false";
    public static String jdbcUsername = "root";
    public static String jdbcPassword = "123456";

    @Override
    public ArrayList<Product> findAllProduct() {
        ArrayList<Product> productList = new ArrayList<>();
        String SELECT_PRODUCT_LIST = "SELECT Products.productId, productName, productPrice, productQuantity, productColor, productDescription, productCategory FROM Products" +
                " JOIN Category ON Products.productId = Category.productId";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_LIST);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String productName = rs.getString("productName");
                double productPrice = rs.getDouble("productPrice");
                int productQuantity = rs.getInt("productQuantity");
                String productColor = rs.getString("productColor");
                String productDescription = rs.getString("productDescription");
                String productCategory = rs.getString("productCategory");
                Product product = new Product(productId, productName, productPrice, productQuantity, productColor, productDescription, productCategory);
                productList.add(product);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productList;
    }

    @Override
    public Product findProductById(String productId) {
        Product product = null;
        String FIND_PRODUCT_LIST_BY_ID = "SELECT * FROM" +
                "(SELECT Products.productId, productName, productPrice, productQuantity, productColor, productDescription, productCategory FROM Products" +
                " JOIN Category ON Products.productId = Category.productId) AS productFullDetail WHERE productFullDetail.productID = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_PRODUCT_LIST_BY_ID);
            preparedStatement.setString(1, productId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String outPutProductId = rs.getString("productId");
                String productName = rs.getString("productName");
                double productPrice = rs.getDouble("productPrice");
                int productQuantity = rs.getInt("productQuantity");
                String productColor = rs.getString("productColor");
                String productDescription = rs.getString("productDescription");
                String productCategory = rs.getString("productCategory");
                product = new Product(outPutProductId, productName, productPrice, productQuantity, productColor, productDescription, productCategory);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    @Override
    public ArrayList<Product> findAllProductByName(String productName) {
        ArrayList<Product> productListByName = new ArrayList<>();
        String FIND_PRODUCT_LIST_BY_NAME = "SELECT * FROM" +
                " (SELECT Products.productId, productName, productPrice, productQuantity, productColor, productDescription, productCategory FROM Products" +
                " JOIN Category ON Products.productId = Category.productId) AS productFullDetail WHERE productFullDetail.productName LIKE ? ";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_PRODUCT_LIST_BY_NAME);
            preparedStatement.setString(1, "'%" + productName +"%'");
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String productId = rs.getString("productId");
                String outPutProductName = rs.getString("productName");
                double productPrice = rs.getDouble("productPrice");
                int productQuantity = rs.getInt("productQuantity");
                String productColor = rs.getString("productColor");
                String productDescription = rs.getString("productDescription");
                String productCategory = rs.getString("productCategory");
                Product product = new Product(productId, outPutProductName, productPrice, productQuantity, productColor, productDescription, productCategory);
                productListByName.add(product);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productListByName;
    }

    @Override
    public boolean addNewProduct(Product product) throws SQLException {
        boolean isActionSuccess = true;
        String ADD_NEW_PRODUCT_TO_PRODUCTS = "INSERT INTO Products (productId, productName, productPrice, productQuantity, productColor, productDescription) VALUE (?, ?, ?, ?, ?, ?);";
        String ADD_NEW_PRODUCT_TO_CATEGORY = "INSERT INTO Category (productId, productCategory) VALUE (?, ?);";
        Connection connection =getConnection();
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW_PRODUCT_TO_PRODUCTS);
            PreparedStatement preparedStatement2 = connection.prepareStatement(ADD_NEW_PRODUCT_TO_CATEGORY);
            preparedStatement.setString(1, product.getProductId());
            preparedStatement.setString(2, product.getProductName());
            preparedStatement.setDouble(3,product.getProductPrice());
            preparedStatement.setInt(4,product.getProductQuantity());
            preparedStatement.setString(5, product.getProductColor());
            preparedStatement.setString(6, product.getProductDescription());
            preparedStatement2.setString(1, product.getProductId());
            preparedStatement2.setString(2, product.getProductCategory());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            System.out.println(preparedStatement2);
            preparedStatement2.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            isActionSuccess = false;
            printSQLException(e);
            connection.rollback();
        } finally {
            connection.setAutoCommit(true);
            connection.close();
        }
        return isActionSuccess;
    }

    @Override
    public boolean updateProduct(String productId, Product product) throws SQLException {
        boolean isActionSuccess = true;
        String INSERT_PRODUCT_TO_PRODUCTS = "UPDATE Products SET productName = ?, productPrice = ?, productQuantity = ?, productColor = ? , productDescription = ? WHERE productId = ? ;";
        String INSERT_PRODUCT_TO_CATEGORY = "UPDATE Category SET productCategory = ? WHERE productId = ?;";
        Connection connection =getConnection();
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_TO_PRODUCTS);
            PreparedStatement preparedStatement2 = connection.prepareStatement(INSERT_PRODUCT_TO_CATEGORY);
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setDouble(2,product.getProductPrice());
            preparedStatement.setInt(3,product.getProductQuantity());
            preparedStatement.setString(4, product.getProductColor());
            preparedStatement.setString(5, product.getProductDescription());
            preparedStatement.setString(6, productId);
            preparedStatement2.setString(1, product.getProductCategory());
            preparedStatement2.setString(2, productId);
            System.out.println(preparedStatement);
            System.out.println(preparedStatement2);
            preparedStatement.executeUpdate();
            preparedStatement2.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            isActionSuccess = false;
            printSQLException(e);
            connection.rollback();
        } finally {
            connection.setAutoCommit(true);
            connection.close();
        }
        return isActionSuccess;
    }

    @Override
    public boolean removeProduct(String productId) throws SQLException {
        boolean isActionSuccess = true;
        String DELETE_PRODUCT = "DELETE FROM Products WHERE productId = ?;" ;
        String DELETE_CATEGORY = "DELETE FROM Category WHERE productId = ?;";
        Connection connection = getConnection();
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            PreparedStatement preparedStatement2 = connection.prepareStatement(DELETE_CATEGORY);
            preparedStatement.setString(1, productId);
            preparedStatement2.setString(1, productId);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            System.out.println(preparedStatement2);
            preparedStatement2.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            isActionSuccess = false;
            printSQLException(e);
            connection.rollback();
        } finally {
            connection.setAutoCommit(true);
            connection.close();
        }
        return isActionSuccess;
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
