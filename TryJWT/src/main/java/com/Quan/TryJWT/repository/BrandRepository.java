package com.Quan.TryJWT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Quan.TryJWT.models.Brand;
import com.Quan.TryJWT.models.Province;
@Repository
public interface BrandRepository extends JpaRepository<Brand, Long>{

}