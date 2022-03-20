package com.Quan.TryJWT.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Quan.TryJWT.model.Brand;
import com.Quan.TryJWT.service.BrandService;

@RestController
@RequestMapping("/api/brand")
public class BrandController {
	
	@Autowired
	BrandService brandService;
	
	@GetMapping
	public ResponseEntity<List<Brand>> getAllBrands() {
		List<Brand> list = brandService.findAll();
		return ResponseEntity.ok(list);
	}
}
