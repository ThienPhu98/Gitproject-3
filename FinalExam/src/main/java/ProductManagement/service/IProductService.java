package ProductManagement.service;

import ProductManagement.model.Product;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductService {
    ArrayList<Product> findAllProduct();

    Product findProductById(String productId);

    ArrayList<Product> findAllProductByName(String productName);

    boolean addNewProduct(Product product) throws SQLException;

    boolean updateProduct(String productId, Product product) throws SQLException;

    boolean removeProduct(String productId) throws SQLException;
}
