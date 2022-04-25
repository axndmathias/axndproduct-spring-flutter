package ch.axnd.axndproduct.services.servicesImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import ch.axnd.axndproduct.entities.Product;
import ch.axnd.axndproduct.repositories.ProductRepository;
import ch.axnd.axndproduct.services.ProductService;

@Service
@Primary
public class ProductServiceImp implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Product addProduct(Product product) {
        return productRepository.save(product);
    }

}
