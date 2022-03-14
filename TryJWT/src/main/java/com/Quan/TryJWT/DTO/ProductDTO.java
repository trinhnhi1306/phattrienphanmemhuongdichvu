package com.Quan.TryJWT.DTO;

import com.Quan.TryJWT.model.Brand;
import com.Quan.TryJWT.model.Category;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductDTO {
	private String name;
	private String description;
	private String image;
	private float price;
	private String specification;
	private int discount;
	private int soldQuantity;
	private int quantity;
	private String category;
	private String brand;
}
