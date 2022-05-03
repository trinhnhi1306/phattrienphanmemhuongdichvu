package com.Quan.TryJWT.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.Exception.NotFoundException;
import com.Quan.TryJWT.dto.BrandOutput;
import com.Quan.TryJWT.model.Brand;
import com.Quan.TryJWT.service.BrandService;

@RestController
@RequestMapping("/api/brand")
public class BrandController {
	
	@Autowired
	BrandService brandService;
	
	@GetMapping(value = "/all")
	public ResponseEntity<List<Brand>> getAllBrands() {
		List<Brand> list = brandService.findAll();
		return ResponseEntity.ok(list);
	}
	
	@GetMapping("")
	public ResponseEntity<BrandOutput> findCategories(			
			@RequestParam(value = "pageNo", required = false) Optional<Integer> pPageNo, 
			@RequestParam(value = "pageSize", required = false) Optional<Integer> pPageSize,
			@RequestParam(value = "sortField", required = false) Optional<String> pSortField, 
			@RequestParam(value = "sortDirection", required = false) Optional<String> pSortDir) 
	{
		int pageNo = 1;
		int pageSize = 10;
		String sortField = "brandId";
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
		List<Brand> brands = new ArrayList<Brand>();
		
		totalPage = (int) Math.ceil((double) (brandService.getCount()) / pageSize);
		brands = brandService.getPage(pageNo, pageSize, sortField, sortDirection).getContent();
		
		
		BrandOutput output = new BrandOutput();
		output.setPage(pageNo);
		output.setTotalPage(totalPage);
		output.setListResult(brands);
		return ResponseEntity.ok(output);
	}
	
	@GetMapping(value = { "/{id}" })
	public ResponseEntity<?> getBrandById(@PathVariable("id") long id) {
		Brand brand = null;
		try {
			brand = brandService.findById(id);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Brand is unavaiable");
		}
		return ResponseEntity.ok(brand);
	}
	
	@PostMapping
	public ResponseEntity<?> postBrand(@Valid @RequestBody Brand brand, BindingResult bindingResult) {
		if (brandService.existsByName(brand.getName())) {
			return ResponseEntity
					.badRequest()
					.body("Error: Brand name is already taken!");
		}
		if (bindingResult.hasErrors())
			return ResponseEntity
					.badRequest()
					.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());

		brandService.addBrand(brand);
		return ResponseEntity.ok("Add brand successfully!");
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteBrand(@PathVariable("id") long id) {
		Brand brand = null;
		try {
			brand = brandService.findById(id);
			if(brand.getProducts().size() > 0)
				return ResponseEntity.badRequest().body("Brand is in use");
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Brand is unavaiable");
		}
		brandService.deleteBrand(brand);
		return ResponseEntity.ok("Remove brand successfully!");
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> putBrand(@PathVariable("id") long id, @Valid @RequestBody Brand newbrand, BindingResult bindingResult) {
		Brand oldBrand = null;
		try {
			oldBrand = brandService.findById(id);
			if (brandService.existsByName(newbrand.getName()) && !newbrand.getName().equals(oldBrand.getName())) {
				return ResponseEntity
						.badRequest()
						.body("Error: Brand name is already taken!");
			}
			if (bindingResult.hasErrors())
				return ResponseEntity
						.badRequest()
						.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Brand is unavaiable");
		}
		
		brandService.updateBrand(newbrand);
		return ResponseEntity.ok("Update brand successfully!");
	}
}
