package com.Quan.TryJWT.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

import com.Quan.TryJWT.Exception.AppUtils;
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

		brand = brandService.findById(id);
		
		if(brand == null) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Brand is unavaiable", null);
		}
		return ResponseEntity.ok(brand);
	}
	
	@PostMapping
	public ResponseEntity<?> postBrand(@Valid @RequestBody Brand brand, BindingResult bindingResult) {
		if (brandService.existsByName(brand.getName())) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Brand name is already taken!", null);
		}
		if (bindingResult.hasErrors())
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, bindingResult.getAllErrors().get(0).getDefaultMessage(), null);
		
		brandService.addBrand(brand);
		
		return AppUtils.returnJS(HttpStatus.OK, "Add brand successfully!", brand);
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteBrand(@PathVariable("id") long id) {
		Brand brand = null;

		brand = brandService.findById(id);
		
		if(brand == null) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Brand is unavaiable", null);
		}
		
		if(brand.getProducts().size() > 0)
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Brand is in use", null);

		brandService.deleteBrand(brand);
		return AppUtils.returnJS(HttpStatus.OK, "Remove brand successfully!", null);
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> putBrand(@PathVariable("id") long id, @Valid @RequestBody Brand newbrand, BindingResult bindingResult) {
		Brand oldBrand = null;
		oldBrand = brandService.findById(id);
		
		if(oldBrand == null)
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Brand is unavaiable", null);
		
		if (brandService.existsByName(newbrand.getName()) && !newbrand.getName().equals(oldBrand.getName())) {
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, "Brand name is already taken!", null);
		}
		if (bindingResult.hasErrors())
			return AppUtils.returnJS(HttpStatus.BAD_REQUEST, bindingResult.getAllErrors().get(0).getDefaultMessage(), null);
		
		newbrand.setBrandId(id);
		brandService.updateBrand(newbrand);
		return AppUtils.returnJS(HttpStatus.OK, "Update brand successfully!", newbrand);
	}
}
