package com.Quan.TryJWT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.model.Category;
import com.Quan.TryJWT.service.CategoryService;

@RestController
@RequestMapping("/api/category")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@GetMapping
	public ResponseEntity<List<Category>> getAllCategories() {
		List<Category> list = categoryService.findAll();
		return ResponseEntity.ok(list);
	}
	
}
