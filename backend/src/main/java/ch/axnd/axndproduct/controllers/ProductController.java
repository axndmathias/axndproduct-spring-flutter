package ch.axnd.axndproduct.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.axnd.axndproduct.entities.Product;
import ch.axnd.axndproduct.handlers.ResponseHandler;
import ch.axnd.axndproduct.services.ProductService;

@Controller
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @PostMapping("/add")
    public ResponseEntity<Object> addProduct(@RequestBody @Valid Product product) {
        try {
            Product addedProduct = productService.addProduct(product);
            return ResponseHandler.handleResponse("Sucessfuly add product", HttpStatus.OK, addedProduct);
        } catch (Exception e) {
            return ResponseHandler.handleResponse("ERROR", HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }
}
