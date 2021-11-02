package Service;

import Model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save (Product product);

    Product findByID (int id);

    void update(int id, Product product);

    void remove(int id);
}
