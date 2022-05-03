package com.Quan.TryJWT.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.dto.CategoryOutput;
import com.Quan.TryJWT.model.Category;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.service.CategoryService;

@RestController
@RequestMapping("/api/category")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@GetMapping(value = "/all")
	public ResponseEntity<List<Category>> getAllCategories() {
		List<Category> list = categoryService.findAll();
		return ResponseEntity.ok(list);
	}
	
	@RequestMapping(value = "image/{imageName}", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<?> getImage(@PathVariable("imageName") String imageName) throws IOException {

		try {
			ClassPathResource imgFile = new ClassPathResource("images/categories/" + imageName);
			return ResponseEntity
	                .ok()
	                .contentType(MediaType.IMAGE_JPEG)
	                .body(new InputStreamResource(imgFile.getInputStream()));
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Image not found!");
		}       
    }
	
	@GetMapping
	public ResponseEntity<CategoryOutput> findCategories(			
			@RequestParam(value = "pageNo", required = false) Optional<Integer> pPageNo, 
			@RequestParam(value = "pageSize", required = false) Optional<Integer> pPageSize,
			@RequestParam(value = "sortField", required = false) Optional<String> pSortField, 
			@RequestParam(value = "sortDirection", required = false) Optional<String> pSortDir) 
	{
		int pageNo = 1;
		int pageSize = 10;
		String sortField = "categoryId";
		String sortDirection = "ASC";
		if (pPageNo.isPresent()) {
			pageNo = pPageNo.get();
		}
		if (pPageSize.isPresent()) {
			pageSize = pPageSize.get();
		}
		if (pSortField.isPresent()) {
			sortField = pSortField.get();
		}
		if (pSortDir.isPresent()) {
			sortDirection = pSortDir.get();
		}
		
		int totalPage;
		List<Category> categories = new ArrayList<Category>();
		
		totalPage = (int) Math.ceil((double) (categoryService.getCount()) / pageSize);
		categories = categoryService.getPage(pageNo, pageSize, sortField, sortDirection).getContent();
		
		
		CategoryOutput output = new CategoryOutput();
		output.setPage(pageNo);
		output.setTotalPage(totalPage);
		output.setListResult(categories);
		return ResponseEntity.ok(output);
	}
	
	@GetMapping(value = { "/{id}" })
	public ResponseEntity<?> getProductById(@PathVariable("id") long id) {
		Category category = null;
		try {
			category = categoryService.findById(id);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Category is unavaiable");
		}
		return ResponseEntity.ok(category);
	}
	
	@PostMapping
	public ResponseEntity<?> postCategory(@Valid @RequestBody Category category, BindingResult bindingResult) {
		if (categoryService.existsByName(category.getName())) {
			return ResponseEntity
					.badRequest()
					.body("Error: Category name is already taken!");
		}
		if (bindingResult.hasErrors())
			return ResponseEntity
					.badRequest()
					.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());

		categoryService.addCategory(category);
		return ResponseEntity.ok("Add category successfully!");
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteCategory(@PathVariable("id") long id) {
		Category category = null;
		try {
			category = categoryService.findById(id);
			if(category.getProducts().size() > 0)
				return ResponseEntity.badRequest().body("Category is in use");
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Category is unavaiable");
		}
		categoryService.deleteCategory(category);
		return ResponseEntity.ok("Remove category successfully!");
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> putProduct(@PathVariable("id") long id, @Valid @RequestBody Category newCategory, BindingResult bindingResult) {
		Category oldCategory = null;
		try {
			oldCategory = categoryService.findById(id);
			if (categoryService.existsByName(newCategory.getName()) && !newCategory.getName().equals(oldCategory.getName())) {
				return ResponseEntity
						.badRequest()
						.body("Error: Category name is already taken!");
			}
			if (bindingResult.hasErrors())
				return ResponseEntity
						.badRequest()
						.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Category is unavaiable");
		}
		
		categoryService.updateCategory(newCategory);
		return ResponseEntity.ok("Update category successfully!");
	}
}
