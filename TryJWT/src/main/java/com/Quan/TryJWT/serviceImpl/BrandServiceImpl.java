package com.Quan.TryJWT.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
