package com.Quan.TryJWT.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Quan.TryJWT.models.Brand;
import com.Quan.TryJWT.models.Province;

public interface BrandRepository extends JpaRepository<Brand, Long>{

}