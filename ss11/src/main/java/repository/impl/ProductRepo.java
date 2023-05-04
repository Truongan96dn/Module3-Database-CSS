package repository.impl;

import model.Product;
import repository.IProductRepo;

import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo {
    //int id, String productName, float price, String description, String producer
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone8", 50, "Black", "Apple"));
        productList.add(new Product(2, "Iphone11", 200, "Grey", "Apple"));
        productList.add(new Product(3, "Iphone13", 600, "White", "Apple"));
        productList.add(new Product(4, "Z3Flip", 660, "Pink", "Samsung"));

    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void remove(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.remove(i);
                break;
            }
        }
    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.set(i, product);
                break;
            }
        }
    }

    @Override
    public void updateProduct(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (product.getId() == productList.get(i).getId()) {
                productList.set(i, product);
                break;
            }
        }
    }
}
