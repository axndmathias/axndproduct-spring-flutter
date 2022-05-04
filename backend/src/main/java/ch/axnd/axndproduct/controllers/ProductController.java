package ch.axnd.axndproduct.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ch.axnd.axndproduct.entities.Product;
import ch.axnd.axndproduct.handlers.ResponseHandler;
import ch.axnd.axndproduct.services.ProductService;

@CrossOrigin(origins = "*")
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

    @PutMapping("/edit")
    public ResponseEntity<Object> editProduct(@RequestBody @Valid Product product) {
        try {
            Product editedProduct = productService.editProduct(product);
            if (editedProduct != null) {
                return ResponseHandler.handleResponse("Sucessfuly edit product", HttpStatus.OK, editedProduct);
            } else {
                return ResponseHandler.handleResponse("Product Id not exist", HttpStatus.BAD_REQUEST, null);
            }
        } catch (Exception e) {
            return ResponseHandler.handleResponse("ERROR", HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Object> deleteProduct(@PathVariable Long id) {
        try {
            productService.deleteProduct(id);
            return ResponseHandler.handleResponse("Sucessfully delete product", HttpStatus.OK, null);
        } catch (Exception e) {
            return ResponseHandler.handleResponse("ERROR", HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }

    @GetMapping
    public ResponseEntity<Object> getProducts(
            @RequestParam(required = false, defaultValue = "0") int page,
            @RequestParam(required = false, defaultValue = "5") int limit,
            @RequestParam(required = false) String productName,
            @RequestParam(required = false) Sort.Direction sortType) {

        try {
            Page<Product> productPage = productService.getRequestFilters(page, limit, productName, sortType);
            return ResponseHandler.handleResponse("Sucessfully get products", HttpStatus.OK, productPage);
        } catch (Exception e) {
            return ResponseHandler.handleResponse("ERROR", HttpStatus.BAD_REQUEST, e.getMessage());
        }
    }
}
