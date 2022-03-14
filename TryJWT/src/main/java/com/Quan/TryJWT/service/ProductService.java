package com.Quan.TryJWT.service;

import org.springframework.data.domain.Page;

import com.Quan.TryJWT.model.Product;


public interface ProductService {
	public Page<Product> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
	public Product findById(long idProduct);
}
