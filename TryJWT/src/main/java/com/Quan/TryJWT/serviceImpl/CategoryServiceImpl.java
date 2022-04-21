package com.Quan.TryJWT.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.model.Brand;
import com.Quan.TryJWT.model.Category;
import com.Quan.TryJWT.repository.CategoryRepository;
import com.Quan.TryJWT.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryRepository categoryRepository;
	
	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Category findById(long id) {
		Optional<Category> category = categoryRepository.findById(id);
		if(!category.isPresent()) {
			throw new NotFoundException("Category not found by id"); 
		}
		return category.get();
	}
	
	@Override
	public Category getById(long id) {
		return categoryRepository.getById(id);
	}

}