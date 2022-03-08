package com.Quan.TryJWT.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Quan.TryJWT.models.Category;
import com.Quan.TryJWT.models.Province;

public interface CategoryRepository extends JpaRepository<Category, Long>{

}