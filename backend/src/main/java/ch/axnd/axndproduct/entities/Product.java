package ch.axnd.axndproduct.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull(message = "name can not be null")
    private String name;

    @NotNull(message = "description can not be null")
    private String description;

    @NotNull(message = "price can not be null")
    private double price;

    @NotNull(message = "image can not be null")
    private String image;
}
