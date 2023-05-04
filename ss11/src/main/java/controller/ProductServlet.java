package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();
    List<Product> productList = iProductService.getAll();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/create_product.jsp");
                break;
            }
            case "delete": {
                int idDelete = Integer.parseInt(request.getParameter("id"));
                iProductService.deleteProduct(idDelete);
                response.sendRedirect("/product");
                break;
            }
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                for (int i = 0; i < productList.size(); i++) {
                    if (id == productList.get(i).getId()) {
                        request.setAttribute("id", productList.get(i).getId());
                        request.setAttribute("productName", productList.get(i).getProductName());
                        request.setAttribute("price", productList.get(i).getPrice());
                        request.setAttribute("description", productList.get(i).getDescription());
                        request.getRequestDispatcher("/update.jsp").forward(request, response);
                        break;
                    }
                }
                break;
            case "search":
                List<Product> productListSearch = new ArrayList();
                String productName = request.getParameter("productName");
                for (int i = 0; i < productList.size(); i++) {
                    if (productName.equals(productList.get(i).getProductName())) {
                        productListSearch.add(productList.get(i));
                    }
                }
                request.setAttribute("productList", productListSearch);
                request.getRequestDispatcher("/product_list.jsp").forward(request, response);
            default: {
                showList(request, response);
            }
        }
    }


    public void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = iProductService.getAll();
        if (productList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/product_list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                break;
            }
            case "update":
                updateProduct(request, response);
                break;

        }
    }

    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, description, producer);
        iProductService.saveProduct(product);
        response.sendRedirect("/product");
    }

    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        Product product = new Product(id, productName, price, description, producer);
        iProductService.updateProduct(product);
        response.sendRedirect("/product");
    }

}
