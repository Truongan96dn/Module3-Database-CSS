package service.impl;

import model.Product;
import repository.IProductRepo;
import repository.impl.ProductRepo;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepo iProductRepo = new ProductRepo();
    @Override
    public List<Product> getAll() {
        List<Product> productList = iProductRepo.getAll();
        if(productList.size()==0){
            System.out.println("no date for Display");
            return null;
        }
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        iProductRepo.save(product);
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepo.remove(id);
    }

    @Override
    public void updateProduct(Product product) {
        iProductRepo.updateProduct(product);

    }
}
