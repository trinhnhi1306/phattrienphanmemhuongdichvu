package com.Quan.TryJWT.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.model.Category;
import com.Quan.TryJWT.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
	Boolean existsByName(String name);
	List<Product> findAllByCategory(Category category, Pageable pageable);
	int countByCategory(Category category);
}