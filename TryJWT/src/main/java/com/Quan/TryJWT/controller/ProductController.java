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
import org.springframework.web.bind.annotation.CrossOrigin;
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
import com.Quan.TryJWT.dto.ProductOutput;
import com.Quan.TryJWT.model.Product;
import com.Quan.TryJWT.service.BrandService;
import com.Quan.TryJWT.service.CategoryService;
import com.Quan.TryJWT.service.ProductService;

import io.swagger.annotations.ApiOperation;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/product")
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	BrandService brandService;

//	@GetMapping(value = { "/{pageNo}", "/" })
//	public ResponseEntity<ProductOutput> getProductInOnePage(@PathVariable(required = false) Optional<Integer> pageNo) {
//		int pageNoOffical = 1;
//		if (pageNo.isPresent())
//			pageNoOffical = pageNo.get();
//		String sortDir = "desc";
//		String sortField = "productId";
//		int pageSize = 20;
//		List<Product> products = productService.findPaginated(pageNoOffical, pageSize, sortField, sortDir).getContent();
//
//		ProductOutput output = new ProductOutput();
//		output.setPage(pageNoOffical);
//		output.setTotalPage((int) Math.ceil((double) (productService.totalItem()) / pageSize));
//		output.setListResult(products);
//		return ResponseEntity.ok(output);
//	}

	@GetMapping(value = { "/{id}" })
	public ResponseEntity<?> getProductById(@PathVariable("id") long id) {
		Product product = null;
		try {
			product = productService.findById(id);
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Product is unavaiable");
		}
		return ResponseEntity.ok(product);
	}
	
	@RequestMapping(value = "image/{imageName}", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<?> getImage(@PathVariable("imageName") String imageName) throws IOException {

		try {
			ClassPathResource imgFile = new ClassPathResource("images/products/" + imageName);
			return ResponseEntity
	                .ok()
	                .contentType(MediaType.IMAGE_JPEG)
	                .body(new InputStreamResource(imgFile.getInputStream()));
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Image not found!");
		}       
    }
	
	@PostMapping
	public ResponseEntity<?> postProduct(@Valid @RequestBody Product product, BindingResult bindingResult) {
		if (productService.existsByName(product.getName())) {
			return ResponseEntity
					.badRequest()
					.body("Error: Product name is already taken!");
		}
		if (bindingResult.hasErrors())
			return ResponseEntity
					.badRequest()
					.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());
		Product newProduct = product;
		newProduct.setBrand(brandService.findById(product.getBrand().getBrandId()));
		newProduct.setCategory(categoryService.findById(product.getCategory().getCategoryId()));
		productService.addProduct(newProduct);
		return ResponseEntity.ok("Add product successfully!");
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<?> deleteProduct(@PathVariable("id") long id) {
		Product product = null;
		try {
			product = productService.findById(id);
			if(product.getOrderDetails().size() > 0)
				return ResponseEntity.badRequest().body("Product is in use");
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Product is unavaiable");
		}
		productService.deleteProduct(product);
		return ResponseEntity.ok("Remove product successfully!");
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<?> putProduct(@PathVariable("id") long id, @Valid @RequestBody Product newProduct, BindingResult bindingResult) {
		Product oldProduct = null;
		try {
			oldProduct = productService.findById(id);
			if (productService.existsByName(newProduct.getName()) && !newProduct.getName().equals(oldProduct.getName())) {
				return ResponseEntity
						.badRequest()
						.body("Error: Product name is already taken!");
			}
			if (bindingResult.hasErrors())
				return ResponseEntity
						.badRequest()
						.body("Error: " + bindingResult.getAllErrors().get(0).getDefaultMessage());
			newProduct.setBrand(brandService.findById(newProduct.getBrand().getBrandId()));
			newProduct.setCategory(categoryService.findById(newProduct.getCategory().getCategoryId()));
		} catch (NotFoundException e) {
			return ResponseEntity.badRequest().body("Product is unavaiable");
		}
		
		productService.updateProduct(newProduct);
		return ResponseEntity.ok("Update product successfully!");
	}
	
	@GetMapping("")
	public ResponseEntity<ProductOutput> findProducts(			
			@RequestParam(value = "pageNo", required = false) Optional<Integer> pPageNo, 
			@RequestParam(value = "pageSize", required = false) Optional<Integer> pPageSize,
			@RequestParam(value = "sortField", required = false) Optional<String> pSortField, 
			@RequestParam(value = "sortDirection", required = false) Optional<String> pSortDir,
			@RequestParam(value = "categoryId", required = false) Optional<Long> pCategoryId) 
	{
		int pageNo = 1;
		int pageSize = 10;
		String sortField = "productId";
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
		List<Product> products = new ArrayList<Product>();
		if (pCategoryId.isPresent()) {
			long categoryId = pCategoryId.get();
			totalPage = (int) Math.ceil((double) (productService.getCountByCategoryId(categoryId)) / pageSize);
			products = productService.getAllByCategoryId(categoryId, pageNo, pageSize, sortField, sortDirection);
		}
		else {
			totalPage = (int) Math.ceil((double) (productService.getCount()) / pageSize);
			products = productService.getAllByStatus(true, pageNo, pageSize, sortField, sortDirection);
		}
		
		ProductOutput output = new ProductOutput();
		output.setPage(pageNo);
		output.setTotalPage(totalPage);
		output.setListResult(products);
		return ResponseEntity.ok(output);
	}
	
	@ApiOperation(value="Lấy tất cả danh sách sản phẩm")
    @GetMapping("/all")
    public ResponseEntity<List<Product>> getAllProduct(){
        return ResponseEntity.ok(productService.getAllProduct());
    }
}
