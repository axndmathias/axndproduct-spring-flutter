package ch.axnd.axndproduct.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ch.axnd.axndproduct.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Page<Product> findByNameContainingIgnoreCase(String productName, Pageable pageable);
}
