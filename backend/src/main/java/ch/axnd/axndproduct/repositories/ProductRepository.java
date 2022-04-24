package ch.axnd.axndproduct.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ch.axnd.axndproduct.entities.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
