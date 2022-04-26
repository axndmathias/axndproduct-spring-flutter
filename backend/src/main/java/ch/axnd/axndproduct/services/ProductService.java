package ch.axnd.axndproduct.services;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

import ch.axnd.axndproduct.entities.Product;

public interface ProductService {

    Product addProduct(Product product);

    Product editProduct(Product product);

    void deleteProduct(long Id);

    Page<Product> getRequestFilters(int page, int limit, String productname, Sort.Direction sortType);

}
