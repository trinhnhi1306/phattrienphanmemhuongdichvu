package com.Quan.TryJWT.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.Brand;
import com.Quan.TryJWT.repository.BrandRepository;
import com.Quan.TryJWT.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService{

	@Autowired
	BrandRepository brandRepository;
	
	@Override
	public List<Brand> findAll() {
		return brandRepository.findAll();
	}

	@Override
	public Brand findById(long id) {
		Optional<Brand> brand = brandRepository.findById(id);
		if(!brand.isPresent()) {
			throw new NotFoundException("Brand not found by id"); 
		}
		return brand.get();
	}
}
