package repository;

import model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> getAll();

    void save(Product product);
    void remove(int id);

    void update(int id, Product product);

    void updateProduct(Product product);
}
