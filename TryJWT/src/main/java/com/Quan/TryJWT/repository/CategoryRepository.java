package com.Quan.TryJWT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.models.Category;
import com.Quan.TryJWT.models.Province;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>{

}