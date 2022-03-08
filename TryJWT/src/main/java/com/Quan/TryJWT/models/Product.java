package com.Quan.TryJWT.models;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "product")
@Getter
@Setter
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class Product {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
	private long productId;
	
	 @Column(name = "name",length = 200)
		private String name;
	 
	 
	 @Column(name = "description",length = 1000)
		private String description;
	 
	 @Column(name = "image",length = 300)
		private String image;
	 
	 
	 @Column(name = "price")
		private float price;
	 
	 
	 @Column(name = "specification",length = 50)
		private String specification;
	 
	 private int discount;
	 
	 @Column(name = "sold_quantity")
	 private int soldQuantity;
	 
	 private int quantity;
	 
	 @ManyToOne
	 @JoinColumn(name = "category_id")
	 private Category category;
	 
	 @ManyToOne
	 @JoinColumn(name = "brand_id")
	 private Brand brand;
	 
	 private boolean status;
	 
	 @OneToMany(mappedBy = "product",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	 private Set<Cart> carts = new HashSet<>();
	 
}
