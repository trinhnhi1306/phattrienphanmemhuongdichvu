package com.Quan.TryJWT.service;

import java.util.List;

import com.Quan.TryJWT.model.Category;

public interface CategoryService {
	public List<Category> findAll();
	public Category findById(long id);
	public Category getById(long id);
}
